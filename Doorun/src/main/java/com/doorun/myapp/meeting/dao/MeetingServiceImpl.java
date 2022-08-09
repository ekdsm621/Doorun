package com.doorun.myapp.meeting.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doorun.myapp.meeting.vo.MeetingJoinVO;
import com.doorun.myapp.meeting.vo.MeetingVO;
import com.doorun.myapp.user.vo.UserVO;

@Service
public class MeetingServiceImpl implements MeetingService {

	@Autowired
	MeetingDAO dao;
	
	@Override
	public void insertMeeting(MeetingVO vo) {
		dao.insertMeeting(vo);
	}

	@Override
	public List<MeetingVO> selectJoinedMeeting(MeetingVO vo) {
		return dao.selectJoinedMeeting(vo);
	}
	
	@Override
	public List<MeetingVO> selectNotJoinedMeeting(MeetingVO vo) {
		return dao.selectNotJoinedMeeting(vo);
	}
	
	public Boolean joinMeeting(MeetingJoinVO vo) {
		return dao.joinMeeting(vo);
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
	public List<UserVO> selectJoinedMeetingImg(int meeting_id) {
		return dao.selectJoinedMeetingImg(meeting_id);
	}

}
