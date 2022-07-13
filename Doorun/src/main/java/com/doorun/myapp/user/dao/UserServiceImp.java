package com.doorun.myapp.user.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doorun.myapp.user.vo.UserVO;

@Service("userService")
public class UserServiceImp implements UserService {
	
	@Autowired
	private UserDAO userDAO;

	@Override
	public void insert(UserVO vo) {
		userDAO.insert(vo);
	}

	@Override
	public void update(UserVO vo) {
		userDAO.update(vo);
	}

	@Override
	public void delete(UserVO vo) {
		userDAO.delete(vo);
	}

	@Override
	public UserVO getUser(UserVO vo) {
		
		return userDAO.getUser(vo);
	}

	@Override
	public List<UserVO> getUserList(UserVO vo) {
		return userDAO.getUserList(vo);
	}

}
