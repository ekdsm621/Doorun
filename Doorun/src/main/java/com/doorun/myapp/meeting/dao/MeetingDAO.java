package com.doorun.myapp.meeting.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.doorun.myapp.meeting.vo.MeetingJoinVO;
import com.doorun.myapp.meeting.vo.MeetingVO;

@Repository
public class MeetingDAO {
	
	@Autowired
	SqlSessionTemplate sst;
	
	public void insertMeeting(MeetingVO vo) {
		sst.update("Meeting.insertMeeting",vo);
		sst.update("Meeting.insertMeeingJoin",vo);
	}
	

	public List<MeetingVO> selectJoinedMeeting(String member_id) {
		return sst.selectList("Meeting.selectJoinedMeeting", member_id);
	}
	
	public List<MeetingVO> selectNotJoinedMeeting(String member_id) {
		return sst.selectList("Meeting.selectNotJoinedMeeting", member_id);
	}

	public void joinMeeting(MeetingJoinVO vo) {
		sst.update("Meeting.joinMeeting",vo);
		sst.update("Meeting.joinedMemberCountUp",vo);
	}
	
	public List<MeetingVO> joinedMeetingNotHosting(String member_id) {
		return sst.selectList("Meeting.selectJoinedMeetingNotHosting",member_id);
	}
	
	public List<MeetingVO> hostingMeeting(String member_id) {
		return sst.selectList("Meeting.selectHostingMeeting",member_id);
	}
	
	public void deleteJoin(MeetingJoinVO vo) {
		sst.update("Meeting.deleteJoinCountDown",vo);
		sst.update("Meeting.deleteJoin",vo);
	}
	
	public void updateMeeting(MeetingVO vo) {
		sst.update("Meeting.updateMeeting",vo);
	}
	
	public void deleteMeeting(MeetingJoinVO vo) {
		sst.update("Meeting.deleteMeeting",vo);
	}


	public List<MeetingVO> selectJoinedMeetingImg(int meeting_id) {
		return sst.selectList("Meeting.selectJoinedMeetingImg",meeting_id);
	}
}
