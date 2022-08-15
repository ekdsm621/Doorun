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
		
		public UserVO getUserWithId(String id) {
			return sst.selectOne("UserDAO.getUserWithId", id);
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
			String email = vo.getEmail();
			System.out.println(email);
			findPw(email,memberKey);
			 
			 MailUtils sendMail = new MailUtils(mailSender);
				sendMail.setSubject("[DooRunDooRun 而ㅻ�ㅻ땲�떚 �엫�떆 鍮꾨�踰덊샇 �엯�땲�떎.]"); //硫붿씪�젣紐�
				sendMail.setText(
						"<h1>�엫�떆鍮꾨�踰덊샇 諛쒓툒</h1>" +
								"<br/>"+vo.getNickname()+"�떂 "+
								"<br/>鍮꾨�踰덊샇 李얘린瑜� �넻�븳 �엫�떆 鍮꾨�踰덊샇�엯�땲�떎."+
								"<br/>�엫�떆鍮꾨�踰덊샇 :   <h2>"+memberKey+"</h2>"+
								"<br/>濡쒓렇�씤 �썑 鍮꾨�踰덊샇 蹂�寃쎌쓣 �빐二쇱꽭�슂."+
								"<a href='http://localhost:9292/login.jsp"+
								">濡쒓렇�씤 �럹�씠吏�</a>");
				sendMail.setFrom(email, "Doo Run Doo Run");
				sendMail.setTo(email);
				sendMail.send();
		}
		

		
		public void certifiedPhoneNumber(String phoneNumber, String cerNum) {

		        String api_key = "NCSFD4ZROEZH3TGM";
		        String api_secret = "PHNTMAPIFQVCGWA7RCCHHVKOIH5IP9R3";
		        Message coolsms = new Message(api_key, api_secret);

		        HashMap<String, String> params = new HashMap<String, String>();
		        params.put("to", phoneNumber);    // �닔�떊�쟾�솕踰덊샇
		        params.put("from", "01073025251");    // 諛쒖떊�쟾�솕踰덊샇. �뀒�뒪�듃�떆�뿉�뒗 諛쒖떊,�닔�떊 �몮�떎 蹂몄씤 踰덊샇濡� �븯硫� �맖
		        params.put("type", "SMS");
		        params.put("text", "DooRun DooRun �쑕���룿�씤利�\n�씤利앸쾲�샇�뒗" + "["+cerNum+"]" + "�엯�땲�떎.");
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
		
		public int EmailCheck(String email) {
			return sst.selectOne("UserDAO.EmailCheck", email);
		}
		
		public int IdCheck(String id) {
			return sst.selectOne("UserDAO.IdCheck", id);
		}
		
		public int NicknameCheck(String nickname) {
			return sst.selectOne("UserDAO.nicknameCheck" , nickname);
		}
		
		public int PhoneCheck(String phone) {
			return sst.selectOne("UserDAO.phoneCheck" , phone);
		}
		
		public UserVO recordForGraph(UserVO vo){
			return sst.selectOne("UserDAO.recordForGraph",vo);
		}
		public UserVO dateForGraph(UserVO vo) {
			return sst.selectOne("UserDAO.dateForGraph",vo);
		}
		
		
		
		
	}



