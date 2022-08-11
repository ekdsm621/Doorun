package com.doorun.myapp.server.dao;

import com.doorun.myapp.run.vo.RunVO;
import com.doorun.myapp.user.vo.UserVO;

public interface ServerService {
	
	public String login(UserVO vo);
	
	public void insertRecord(RunVO vo);
	
	public int getJourneyMaxId();
	
	public void insertLocation(RunVO vo);
	
	public void updateMemberRecord(RunVO vo);
	
	public String getIdFromEmail(String email);
	
	public String kakao_login(UserVO vo);

}
