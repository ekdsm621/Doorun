package com.doorun.myapp.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import com.doorun.myapp.crew.vo.CrewVO;
import com.doorun.myapp.run.vo.RunVO;
import com.doorun.myapp.user.vo.UserVO;
import com.doorun.myapp.utils.MailUtils;
import com.doorun.myapp.utils.TempKey;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Repository
public class UserDAO {
		
		@Autowired
		private SqlSessionTemplate sst;
		@Inject
		private JavaMailSender mailSender;
		
		public void insert(UserVO vo) {
			sst.insert("UserDAO.insertUser", vo);
		}
		
		public void kakaoInsert(UserVO vo) {
			sst.insert("UserDAO.kakaoInsertUser", vo);
		}
		
		public void update(UserVO vo) {
			sst.update("UserDAO.updateUser", vo);
		}
		
		public void update2(UserVO vo) {
			sst.update("UserDAO.updateUser2", vo);
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
		
		public UserVO getKakaoUser(UserVO vo) {		
			return sst.selectOne("UserDAO.getKakaoUser",vo);
		}
		
		public String passwordCheck(String id) {		
			return sst.selectOne("UserDAO.passwordCheck",id);
		}
		
		public List<UserVO> getUserList(UserVO vo){		
			return sst.selectList("UserDAO.getUserList", vo);
		}
		
		public String getUserWithEmail(UserVO vo) {
			return sst.selectOne("UserDAO.getUserWithEmail", vo);
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
		
		public void sendEmail(UserVO vo, HttpSession session)throws Exception{
			

			
			String memberKey = new TempKey().getKey(6,false);
//			String memberPw = BCrypt.hashpw(memberKey,BCrypt.gensalt());
			
			
			String email = vo.getEmail();
			System.out.println(email);
			findPw(email,memberKey);
			 
			 MailUtils sendMail = new MailUtils(mailSender);
				sendMail.setSubject("[DooRunDooRun 커뮤니티 임시 비밀번호 입니다.]"); //메일제목
				sendMail.setText(
						"<h1>임시비밀번호 발급</h1>" +
								"<br/>"+vo.getNickname()+"님 "+
								"<br/>비밀번호 찾기를 통한 임시 비밀번호입니다."+
								"<br/>임시비밀번호 :   <h2>"+memberKey+"</h2>"+
								"<br/>로그인 후 비밀번호 변경을 해주세요."+
								"<a href='http://localhost:9292/login.jsp"+
								">로그인 페이지</a>");
				sendMail.setFrom(email, "Doo Run Doo Run");
				sendMail.setTo(email);
				sendMail.send();
		}
		

		
		public void certifiedPhoneNumber(String phoneNumber, String cerNum) {

		        String api_key = "NCSFD4ZROEZH3TGM";
		        String api_secret = "PHNTMAPIFQVCGWA7RCCHHVKOIH5IP9R3";
		        Message coolsms = new Message(api_key, api_secret);

		        HashMap<String, String> params = new HashMap<String, String>();
		        params.put("to", phoneNumber);    // 수신전화번호
		        params.put("from", "01073025251");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		        params.put("type", "SMS");
		        params.put("text", "DooRun DooRun 휴대폰인증\n인증번호는" + "["+cerNum+"]" + "입니다.");
		        params.put("app_version", "test app 1.2"); 

		        try {
		            JSONObject obj = (JSONObject) coolsms.send(params);
		            System.out.println(obj.toString());
		        } catch (CoolsmsException e) {
		            System.out.println(e.getMessage());
		            System.out.println(e.getCode());
		        }

		   }

		public UserVO getUserDesc(UserVO vo) {
			return sst.selectOne("UserDAO.getUserDesc", vo);
		}
		
		public List<RunVO> getUserRecordList(UserVO vo) {
			return sst.selectList("UserDAO.getUserRecordList", vo);
		}
		
		public List<CrewVO> getJoinedCrewList(UserVO vo) {
			return sst.selectList("UserDAO.getJoinedCrewList", vo);
		}
	}



