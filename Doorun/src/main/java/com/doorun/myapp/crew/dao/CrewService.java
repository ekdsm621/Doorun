package com.doorun.myapp.crew.dao;

import java.util.List;

import com.doorun.myapp.crew.vo.CrewVO;
import com.doorun.myapp.run.vo.RunVO;
import com.doorun.myapp.user.vo.UserVO;

public interface CrewService {
	
	public void insertCrew(CrewVO vo);
	public List<CrewVO> getCrewList(CrewVO vo);
	public CrewVO detailCrew(CrewVO vo);
	public void crew_Join(int crew_ID, String member_ID);
	public int getMaxCrewID();
	public void plusCrewMember(CrewVO vo);
	public List<UserVO> getCrewMember(CrewVO vo);
	public void updateCrew(CrewVO vo);
	public void quitCrew(String id);
	public void minusCrewMember(CrewVO vo);
	public List<RunVO> getCrewRecentRecord(CrewVO vo);
	public String  getCrewMasterImage(CrewVO vo);
	

}
