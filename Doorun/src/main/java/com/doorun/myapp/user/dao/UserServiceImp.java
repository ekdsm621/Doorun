package com.doorun.myapp.user.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doorun.myapp.crew.vo.CrewVO;
import com.doorun.myapp.run.vo.RunVO;
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
	public void kakaoInsert(UserVO vo) {
		userDAO.kakaoInsert(vo);
	}

	@Override
	public void update(UserVO vo) {
		userDAO.update(vo);
	}
	
	@Override
	public void updatePassword(UserVO vo) {
		userDAO.updatePassword(vo);
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
	public String getUserWithEmail(UserVO vo) {
		return userDAO.getUserWithEmail(vo);
		
	}
	@Override
	public String passwordCheck(String id) {
		return userDAO.passwordCheck(id);
	}
	@Override
	public List<UserVO> getUserList(UserVO vo) {
		return userDAO.getUserList(vo);
	}

	@Override
	public int findPwCheck(UserVO vo) throws Exception {
		return userDAO.findPwCheck(vo);
	}

	@Override
	public int findPw(String memberPw, String memberEmail) throws Exception {
		return userDAO.findPw(memberEmail, memberPw);
	}

	@Override
	public void sendEmail(UserVO vo, HttpSession session) throws Exception {
		userDAO.sendEmail(vo , session);
	}


	@Override
	public UserVO getKakaoUser(UserVO vo) {
		return userDAO.getKakaoUser(vo);
	}

	@Override
	public void certifiedPhoneNumber(String phoneNumber, String cerNum) {
		userDAO.certifiedPhoneNumber(phoneNumber, cerNum);
		
	}

	@Override
	public void update2(UserVO vo) {
		userDAO.update2(vo);
	}

	@Override
	public UserVO getUserDesc(UserVO vo) {
		return userDAO.getUserDesc(vo);
	}

	@Override
	public List<RunVO> getUserRecordList(UserVO vo) {
		return userDAO.getUserRecordList(vo);
	}
	
	@Override
	public List<CrewVO> getJoinedCrewList(UserVO vo) {
		return userDAO.getJoinedCrewList(vo);
	}

}
