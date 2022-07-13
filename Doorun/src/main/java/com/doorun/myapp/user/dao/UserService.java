package com.doorun.myapp.user.dao;

import java.util.List;

import com.doorun.myapp.user.vo.UserVO;

public interface UserService {
	
	public void insert(UserVO vo);
	
	public void update(UserVO vo);
	
	public void delete(UserVO vo);
	
	public UserVO getUser(UserVO vo);
	
	public List<UserVO> getUserList(UserVO vo);
}
