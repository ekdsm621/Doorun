package com.doorun.myapp.crew.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doorun.myapp.crew.vo.CrewJoinVO;
import com.doorun.myapp.crew.vo.CrewVO;
import com.doorun.myapp.run.vo.RunVO;
import com.doorun.myapp.user.vo.UserVO;

@Service("crewService")
public class CrewServiceImp implements CrewService {
	
	@Autowired
	private CrewDAO crewDAO;

	@Override
	public void insertCrew(CrewVO vo) {
		crewDAO.insertCrew(vo);
	}

	@Override
	public List<CrewVO> getCrewList(CrewVO vo) {
		return crewDAO.getCrewList(vo);
	}

	@Override
	public CrewVO detailCrew(CrewVO vo) {
		return crewDAO.detailCrew(vo);
	}

	@Override
	public int crew_Join(CrewJoinVO vo) {
		return crewDAO.crew_Join(vo);
	}

	@Override
	public int getMaxCrewID() {
		return crewDAO.getMaxCrewID();
	}

	@Override
	public void plusCrewMember(CrewJoinVO vo) {
		crewDAO.plusCrewMember(vo);
	}

	@Override
	public List<UserVO> getCrewMember(CrewVO vo) {
		return crewDAO.getCrewMember(vo);
	}

	@Override
	public void updateCrew(CrewVO vo) {
		crewDAO.updateCrew(vo);
	}

	@Override
	public void quitCrew(String id) {
		crewDAO.quitCrew(id);
	}

	@Override
	public void minusCrewMember(CrewVO vo) {
		crewDAO.minusCrewMember(vo);
	}

	@Override
	public List<RunVO> getCrewRecentRecord(CrewVO vo) {
		return crewDAO.getCrewRecentRecord(vo);
	}


	@Override
	public String getCrewMasterImage(CrewVO vo) {
		return crewDAO.getCrewMasterImage(vo);
	}

	@Override
	public String getCrewMemberNickName(String Member_id) {
		return crewDAO.getCrewMemberNickName(Member_id);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
