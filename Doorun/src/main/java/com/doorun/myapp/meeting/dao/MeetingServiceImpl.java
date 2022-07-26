package com.doorun.myapp.meeting.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doorun.myapp.meeting.vo.MeetingJoinVO;
import com.doorun.myapp.meeting.vo.MeetingVO;

@Service
public class MeetingServiceImpl implements MeetingService {

	@Autowired
	MeetingDAO dao;
	
	@Override
	public void insertMeeting(MeetingVO vo) {
		dao.insertMeeting(vo);
	}

	@Override
	public List<MeetingVO> selectJoinedMeeting(String member_id) {
		return dao.selectJoinedMeeting(member_id);
	}
	
	@Override
	public List<MeetingVO> selectNotJoinedMeeting(String member_id) {
		return dao.selectNotJoinedMeeting(member_id);
	}
	
	public void joinMeeting(MeetingJoinVO vo) {
		dao.joinMeeting(vo);
	}

	public List<MeetingVO> joinedMeetingNotHosting(String member_id) {
		return dao.joinedMeetingNotHosting(member_id);
	}
	public List<MeetingVO> hostingMeeting(String member_id) {
		return dao.hostingMeeting(member_id);
	}

	public void deleteJoin(MeetingJoinVO vo) {
		dao.deleteJoin(vo);
	}
	
	@Override
	public void updateMeeting(MeetingVO vo) {
		dao.updateMeeting(vo);
	}
	
	@Override
	public void deleteMeeting(MeetingJoinVO vo) {
		dao.deleteMeeting(vo);
	}

	@Override
	public List<MeetingVO> selectJoinedMeetingImg(int meeting_id) {
		return dao.selectJoinedMeetingImg(meeting_id);
	}

}
