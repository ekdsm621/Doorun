package com.doorun.myapp.server.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doorun.myapp.run.vo.RunVO;
import com.doorun.myapp.user.vo.UserVO;

@Service
public class ServerServiceImp implements ServerService {
	
	@Autowired
	private ServerDAO serverDAO;

	@Override
	public String login(UserVO vo) {
		return serverDAO.login(vo);
	}

	@Override
	public void insertRecord(RunVO vo) {
		serverDAO.insertRecord(vo);
		
	}

	@Override
	public int getJourneyMaxId() {
		return serverDAO.getJourneyMaxId();
	}

	@Override
	public void insertLocation(RunVO vo) {
		serverDAO.insertLocation(vo);
		
	}

}
