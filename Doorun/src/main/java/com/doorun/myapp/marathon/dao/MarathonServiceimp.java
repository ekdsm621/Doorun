package com.doorun.myapp.marathon.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doorun.myapp.marathon.vo.MarathonLinkVO;
import com.doorun.myapp.marathon.vo.MarathonVO;

@Service("marathonService")
public class MarathonServiceimp implements MarathonService {
	
	@Autowired
	MarathonDAO dao ;

	@Override
	public List<MarathonLinkVO> getMarathon() {
		return dao.getMarathon();
	}

}
