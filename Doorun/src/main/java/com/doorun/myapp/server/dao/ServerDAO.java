package com.doorun.myapp.server.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.doorun.myapp.run.vo.RunVO;
import com.doorun.myapp.user.vo.UserVO;


@Repository
public class ServerDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	

	
	public String login(UserVO vo) {
		
		int result = sst.selectOne("UserDAO.getUserFromApp",vo);
		
		System.out.println(result);
		
		if(result ==1 ) {
			return "true";
		}else {
			return "false";
		}
	}
	
	public void insertRecord(RunVO vo) {
		sst.insert("run.insertRecord",vo);
	}
	
	public int getJourneyMaxId() {
		return sst.selectOne("run.getJourneyMaxId");
	}
	
	public void insertLocation(RunVO vo) {
		sst.insert("run.insertLocation",vo);
	}
	
	
	

}
