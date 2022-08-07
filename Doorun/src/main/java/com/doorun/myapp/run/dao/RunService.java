package com.doorun.myapp.run.dao;

import java.util.List;

import com.doorun.myapp.run.vo.RunVO;

public interface RunService {
	
	public List<RunVO> getRecordList(RunVO vo);
	
	public RunVO detailRecord(RunVO vo);
	
	public List<RunVO> getMap(RunVO vo);
	
	

}
