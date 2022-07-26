package com.doorun.myapp.meeting.dao;

import java.util.List;

import com.doorun.myapp.meeting.vo.MeetingJoinVO;
import com.doorun.myapp.meeting.vo.MeetingVO;

public interface MeetingService {

	void insertMeeting(MeetingVO vo);

	List<MeetingVO> selectJoinedMeeting(String member_id);
	
	List<MeetingVO> selectJoinedMeetingImg(int meeting_id);

	List<MeetingVO> selectNotJoinedMeeting(String member_id);
	
	void joinMeeting(MeetingJoinVO vo);

	List<MeetingVO> joinedMeetingNotHosting(String member_id);
	
	List<MeetingVO> hostingMeeting(String member_id);
	
	public void updateMeeting(MeetingVO vo);
	
	public void deleteMeeting(MeetingJoinVO vo);
}