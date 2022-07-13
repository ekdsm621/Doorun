package com.doorun.myapp.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.doorun.myapp.user.vo.UserVO;

@Repository
public class UserDAO {
		
		@Autowired
		private SqlSessionTemplate sst;
		
		public void insert(UserVO vo) {
			sst.insert("UserDAO.insertUser", vo);
		}
		
		public void update(UserVO vo) {
			sst.update("UserDAO.updateUser", vo);
		}
		
		public void delete(UserVO vo) {
			sst.delete("UserDAO.deleteUser", vo);
		}
		
		public UserVO getUser(UserVO vo) {		
			return sst.selectOne("UserDAO.getUser",vo);
		}
		
		public List<UserVO> getUserList(UserVO vo){		
			return sst.selectList("UserDAO.getUserList", vo);
		}
		
	}



