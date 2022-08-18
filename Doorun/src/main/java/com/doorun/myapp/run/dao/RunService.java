package com.doorun.myapp.run.dao;

import java.util.List;

import com.doorun.myapp.run.vo.RunVO;

public interface RunService {
	
	public List<RunVO> getRecordList(RunVO vo);
	
	public RunVO detailRecord(RunVO vo);
	
	public List<RunVO> getMap(RunVO vo);
	
    public double distance(double lat1, double lon1, double lat2, double lon2);
	
	

}
