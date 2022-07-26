package com.doorun.myapp.meeting.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doorun.myapp.meeting.dao.MeetingServiceImpl;
import com.doorun.myapp.meeting.vo.MeetingJoinVO;
import com.doorun.myapp.meeting.vo.MeetingVO;

@Controller
public class MeetingController {
	
	@Autowired
	MeetingServiceImpl service;
	
	@RequestMapping(value="/insertMeeting.do")
	public String insertMeeting(MeetingVO vo) {
		vo.setMeeting_date(vo.getMeeting_date()+vo.getMeeting_time());
		service.insertMeeting(vo);
		return "redirect:joinedMeeting.do";
	}
	
	@RequestMapping(value="/meeting.do")
	public String selectMeeting(HttpSession session, MeetingVO vo, Model model) {
		String member_id = (String)session.getAttribute("id");
		
		Map<MeetingVO, List<MeetingVO>> joined_meetings = new HashMap<>();
		for(MeetingVO meeting : service.selectJoinedMeeting(member_id)) {
			joined_meetings.put(meeting, service.selectJoinedMeetingImg(meeting.getId()));
		}
		model.addAttribute("joined_meeting", joined_meetings);
		
		Map<MeetingVO, List<MeetingVO>> not_joined_meetings = new HashMap<>();
		for(MeetingVO meeting : service.selectNotJoinedMeeting(member_id)) {
			not_joined_meetings.put(meeting, service.selectJoinedMeetingImg(meeting.getId()));
		}
		model.addAttribute("not_joined_meeting", not_joined_meetings);
		
		return "team_board.jsp";
	}
	
	@RequestMapping(value="/joinMeeting.do")
	public String joinMeeting(MeetingJoinVO vo) {
		service.joinMeeting(vo);
		return "meeting.do";
	}
	
	@RequestMapping(value="/joinedMeeting.do")
	public String joinedMeeting(HttpSession session, Model model) {
		String member_id = (String)session.getAttribute("id");
		model.addAttribute("joined_meeting",service.joinedMeetingNotHosting(member_id));
		model.addAttribute("hosting_meeting",service.hostingMeeting(member_id));
		return "joined_team.jsp";
	}
	
	@RequestMapping(value="/deleteJoin.do")
	public String deleteJoin(MeetingJoinVO vo) {
		service.deleteJoin(vo);
		return "joinedMeeting.do";
	}
	
	@RequestMapping(value="/updateMeeting.do")
	public String updateMeeting(MeetingVO vo) {
		vo.setMeeting_date(vo.getMeeting_date()+vo.getMeeting_time());
		service.updateMeeting(vo);
		return "joinedMeeting.do";
	}
	
	@RequestMapping(value="/deleteMeeting.do")
	public String deleteMeeting(MeetingJoinVO vo) {
		service.deleteMeeting(vo);
		return "joinedMeeting.do";
	}
	
}
