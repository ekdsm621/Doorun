package com.doorun.myapp.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import com.doorun.myapp.user.vo.UserVO;
import com.doorun.myapp.utils.MailUtils;
import com.doorun.myapp.utils.TempKey;

@Repository
public class UserDAO {
		
		@Autowired
		private SqlSessionTemplate sst;
		@Inject
		private JavaMailSender mailSender;
		
		public void insert(UserVO vo) {
			sst.insert("UserDAO.insertUser", vo);
		}
		
		public void update(UserVO vo) {
			sst.update("UserDAO.updateUser", vo);
		}
		
		public void updatePassword(UserVO vo) {
			sst.update("UserDAO.updatePassword", vo);
		}
		
		public void delete(UserVO vo) {
			sst.delete("UserDAO.deleteUser", vo);
		}
		
		public UserVO getUser(UserVO vo) {		
			return sst.selectOne("UserDAO.getUser",vo);
		}
		
		public String passwordCheck(String id) {		
			return sst.selectOne("UserDAO.passwordCheck",id);
		}
		
		public List<UserVO> getUserList(UserVO vo){		
			return sst.selectList("UserDAO.getUserList", vo);
		}
		
		public int findPwCheck(UserVO vo)throws Exception{
			return sst.selectOne("UserDAO.findPwCheck", vo);	
		}


		public int findPw(String email,String password)throws Exception{
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("email", email);
			map.put("password", password);
			return sst.update("UserDAO.findPw", map);
			
		}
		
		public void sendEmail(String email, HttpSession session)throws Exception{
			

			
			String memberKey = new TempKey().getKey(6,false);
//			String memberPw = BCrypt.hashpw(memberKey,BCrypt.gensalt());
			
			System.out.println(email);
			
			findPw(email,memberKey);
			 
			 MailUtils sendMail = new MailUtils(mailSender);
				sendMail.setSubject("[DooRunDooRun 커뮤니티 임시 비밀번호 입니다.]"); //메일제목
				sendMail.setText(
						"<h1>임시비밀번호 발급</h1>" +
								"<br/>"+session.getAttribute("name")+"님 "+
								"<br/>비밀번호 찾기를 통한 임시 비밀번호입니다."+
								"<br/>임시비밀번호 :   <h2>"+memberKey+"</h2>"+
								"<br/>로그인 후 비밀번호 변경을 해주세요."+
								"<a href='http://localhost:9292/login.jsp"+
								">로그인 페이지</a>");
				sendMail.setFrom(email, "Doo Run Doo Run");
				sendMail.setTo(email);
				sendMail.send();
		}
		
		
		
		
		
	}



