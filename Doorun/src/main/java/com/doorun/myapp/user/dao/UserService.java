package com.doorun.myapp.user.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.doorun.myapp.user.vo.UserVO;

public interface UserService {
	
	public void insert(UserVO vo);
	
	public void update(UserVO vo);
	
	public void updatePassword(UserVO vo);
	
	public void delete(UserVO vo);
	
	public UserVO getUser(UserVO vo);
	
	public String passwordCheck(String id);
	
	public List<UserVO> getUserList(UserVO vo);
	
	public int findPwCheck(UserVO vo)throws Exception; 
	
	public int findPw(String memberPw,String memberEmail)throws Exception;
	
	public void sendEmail(String memberEmail, HttpSession session)throws Exception;
	
}
