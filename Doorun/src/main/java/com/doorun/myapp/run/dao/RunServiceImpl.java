package com.doorun.myapp.run.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doorun.myapp.run.vo.RunVO;

@Service
public class RunServiceImpl implements RunService {
	
	@Autowired
	private RunDAO runDAO;

	@Override
	public List<RunVO> getRecordList(RunVO vo) {
		return runDAO.getRecordList(vo);
	}

	@Override
	public RunVO detailRecord(RunVO vo) {
		return runDAO.detailRecord(vo);
	}

	@Override
	public List<RunVO> getMap(RunVO vo) {
		return runDAO.getMap(vo);
	}

	@Override
	public double distance(double lat1, double lon1, double lat2, double lon2) {
		return runDAO.distance(lat1, lon1, lat2, lon2);
	}
	
	
	
	

}
