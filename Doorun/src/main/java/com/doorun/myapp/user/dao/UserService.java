package com.doorun.myapp.user.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.doorun.myapp.crew.vo.CrewVO;
import com.doorun.myapp.run.vo.RunVO;
import com.doorun.myapp.user.vo.UserVO;

public interface UserService {
	
	public void insert(UserVO vo);
	
	public void certifiedPhoneNumber(String phoneNumber, String cerNum);
	
	public void kakaoInsert(UserVO vo);
	
	public void update(UserVO vo);
	
	public void update2(UserVO vo);
	
	public void updatePassword(UserVO vo);
	
	public void delete(UserVO vo);
	
	public UserVO getUser(UserVO vo);
	
	public UserVO getKakaoUser(UserVO vo);
	
	public String getUserWithEmail(UserVO vo);
	
	public UserVO getUserWithId(String id);
	
	public String passwordCheck(String id);
	
	public List<UserVO> getUserList(UserVO vo);
	
	public int findPwCheck(UserVO vo)throws Exception; 
	
	public int findPw(String memberPw,String memberEmail)throws Exception;
	
	public void sendEmail(UserVO vo, HttpSession session)throws Exception;

	public UserVO getUserDesc(UserVO vo);
	
	public List<RunVO> getUserRecordList(UserVO vo);
	
	public List<CrewVO> getJoinedCrewList(UserVO vo);
	
	public int EmailCheck(String email);
	
	public int IdCheck(String id);
	
	public int NicknameCheck(String nickname);
	
	public int PhoneCheck(String phone);
	
	public UserVO recordForGraph(UserVO vo);
	
	public UserVO dateForGraph(UserVO vo);
	
	
}
