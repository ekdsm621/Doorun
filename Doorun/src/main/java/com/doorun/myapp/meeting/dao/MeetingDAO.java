package com.doorun.myapp.meeting.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.doorun.myapp.meeting.vo.MeetingVO;

@Repository
public class MeetingDAO {
	
	@Autowired
	SqlSessionTemplate sst;
	
	public void insertMeeting(MeetingVO vo) {
		sst.update("Meeting.insertMeeting",vo);
	}
	
}
