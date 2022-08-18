package com.doorun.myapp.meeting.dao;

import java.util.List;

import com.doorun.myapp.meeting.vo.MeetingJoinVO;
import com.doorun.myapp.meeting.vo.MeetingVO;
import com.doorun.myapp.user.vo.UserVO;

public interface MeetingService {

	void insertMeeting(MeetingVO vo);

	List<MeetingVO> selectJoinedMeeting(MeetingVO vo);
	
	List<UserVO> selectJoinedMeetingImg(int meeting_id);

	List<MeetingVO> selectNotJoinedMeeting(MeetingVO vo);
	
	Boolean joinMeeting(MeetingJoinVO vo);

	List<MeetingVO> joinedMeetingNotHosting(String member_id);
	
	List<MeetingVO> hostingMeeting(String member_id);
	
	public void updateMeeting(MeetingVO vo);
	
	public void deleteMeeting(MeetingJoinVO vo);
}