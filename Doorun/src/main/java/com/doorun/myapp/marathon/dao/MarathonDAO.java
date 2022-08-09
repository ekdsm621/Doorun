package com.doorun.myapp.marathon.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.doorun.myapp.marathon.vo.MarathonVO;

@Repository
public class MarathonDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<MarathonVO> getMarathon() {
		return sst.selectList("MarathonDAO.getmarathon" );
	}

}
