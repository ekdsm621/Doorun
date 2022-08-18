package com.doorun.myapp.run.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.doorun.myapp.run.vo.RunVO;

@Repository
public class RunDAO {
	
	@Autowired
	SqlSessionTemplate sst;
	
	public List<RunVO> getRecordList(RunVO vo){
		
		return sst.selectList("run.getRecordList",vo);
		
	}
	
	public RunVO detailRecord(RunVO vo) {
		return sst.selectOne("run.detailRecord",vo);
	}
	
	public List<RunVO> getMap(RunVO vo){
		return sst.selectList("run.getMap", vo);
	}
	
    public double distance(double lat1, double lon1, double lat2, double lon2) {
    	
    	
        
        double theta = lon1 - lon2;
        double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
         
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;
         
        dist = dist * 1609.344;
 
        return (dist);
    }
    
    private static double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }
     
    private static double rad2deg(double rad) {
        return (rad * 180 / Math.PI);
    }
     

}
