package com.doorun.myapp.meeting.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.doorun.myapp.meeting.vo.MeetingJoinVO;
import com.doorun.myapp.meeting.vo.MeetingVO;
import com.doorun.myapp.user.vo.UserVO;

@Repository
public class MeetingDAO {
	
	@Autowired
	SqlSessionTemplate sst;
	
	public void insertMeeting(MeetingVO vo) {
		sst.update("Meeting.insertMeeting",vo);
		sst.update("Meeting.insertMeeingJoin",vo);
	}
	

	public List<MeetingVO> selectJoinedMeeting(MeetingVO vo) {
		return sst.selectList("Meeting.selectJoinedMeeting", vo);
	}
	
	public List<MeetingVO> selectNotJoinedMeeting(MeetingVO vo) {
		return sst.selectList("Meeting.selectNotJoinedMeeting", vo);
	}

	public Boolean joinMeeting(MeetingJoinVO vo) {
		MeetingVO meeting = sst.selectOne("Meeting.selectJoinNumber", vo.getMeeting_id());
		if(meeting.getTotal_member() > meeting.getJoined_member()) {
			sst.update("Meeting.joinMeeting",vo);
			sst.update("Meeting.joinedMemberCountUp",vo);
			return true;
		}else {
			return false;
		}
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


	public List<UserVO> selectJoinedMeetingImg(int meeting_id) {
		return sst.selectList("Meeting.selectJoinedMeetingImg",meeting_id);
	}
}
