package com.doorun.myapp.meeting.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doorun.myapp.meeting.vo.MeetingVO;

@Service
public class MeetingServiceImpl implements MeetingService {

	@Autowired
	MeetingDAO dao;
	
	@Override
	public void insertMeeting(MeetingVO vo) {
		dao.insertMeeting(vo);
	}

}
