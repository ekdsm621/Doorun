package com.doorun.myapp.crew.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.doorun.myapp.crew.vo.CrewVO;
import com.doorun.myapp.run.vo.RunVO;
import com.doorun.myapp.user.vo.UserVO;


@Repository
public class CrewDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public void insertCrew(CrewVO vo) {
		
		sst.insert("Crew.insertCrew",vo);
	}
	
	public List<CrewVO> getCrewList(CrewVO vo) {
		
		return sst.selectList("Crew.getCrewList",vo);
	}
	
	public CrewVO detailCrew(CrewVO vo) {
		
		return sst.selectOne("Crew.detailCrew",vo);
	}
	public int getMaxCrewID() {
		return sst.selectOne("Crew.getMaxCrewID");
	}
	
	public void crew_Join(int crew_ID, String member_ID) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("crew_ID", crew_ID);
		map.put("member_ID", member_ID);
		
		sst.insert("Crew.crew_Join",map);
	}
	
	public void plusCrewMember(CrewVO vo) {
		sst.update("Crew.plusCrewMember", vo);
	}
	
	public List<UserVO> getCrewMember(CrewVO vo){
		return sst.selectList("Crew.getCrewMember", vo);
	}
	
	public void updateCrew(CrewVO vo) {
		sst.update("Crew.updateCrew", vo);
	}
	
	public void quitCrew(String id) {
		sst.delete("Crew.quitCrew",id);
	}
	
	public void minusCrewMember(CrewVO vo) {
		sst.update("Crew.minusCrewMember", vo);
	}
	
	public List<RunVO> getCrewRecentRecord(CrewVO vo) {
		return sst.selectList("Crew.getCrewRecentRecord",vo);
	}
	
	public String  getCrewMasterImage(CrewVO vo) {
		return sst.selectOne("Crew.getCrewMasterImage",vo);
	}
	
	
	
	

}
