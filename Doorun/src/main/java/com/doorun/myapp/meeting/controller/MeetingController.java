package com.doorun.myapp.meeting.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.doorun.myapp.meeting.dao.MeetingServiceImpl;
import com.doorun.myapp.meeting.vo.MeetingJoinVO;
import com.doorun.myapp.meeting.vo.MeetingVO;
import com.doorun.myapp.user.vo.UserVO;

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
		
		// 참여한
		Map<MeetingVO, List<UserVO>> joined_meetings = new LinkedHashMap<>();
		for(MeetingVO meeting : service.selectJoinedMeeting(member_id)) {
			meeting.setMeeting_date(meeting.getMeeting_date().substring(0, 16));
			joined_meetings.put(meeting, service.selectJoinedMeetingImg(meeting.getId()));
		}
		model.addAttribute("joined_meeting", joined_meetings);
		
		//참여하지 않은
		Map<MeetingVO, List<UserVO>> not_joined_meetings = new LinkedHashMap<>();
		for(MeetingVO meeting : service.selectNotJoinedMeeting(member_id)) {
			meeting.setMeeting_date(meeting.getMeeting_date().substring(0, 16));
			not_joined_meetings.put(meeting, service.selectJoinedMeetingImg(meeting.getId()));
		}
		model.addAttribute("not_joined_meeting", not_joined_meetings);
		
		return "team_list.jsp";
	}
	
	@ResponseBody
	@RequestMapping(value="/joinMeeting.do", method=RequestMethod.POST)
	public String joinMeeting(MeetingJoinVO vo) {
		String result = null;
		if(service.joinMeeting(vo)) {
			result =  "y";
		}else {
			result = "n";
		}
		return result;
	}
	
	@RequestMapping(value="/joinedMeeting.do")
	public String joinedMeeting(HttpSession session, Model model) {
		String member_id = (String)session.getAttribute("id");
		
		Map<MeetingVO, List<UserVO>> joined_meeting = new LinkedHashMap<>();
		for(MeetingVO meeting : service.joinedMeetingNotHosting(member_id)) {
			meeting.setMeeting_date(meeting.getMeeting_date().substring(0, 16));
			joined_meeting.put(meeting, service.selectJoinedMeetingImg(meeting.getId()));
		}
		model.addAttribute("joined_meeting", joined_meeting);
		
		Map<MeetingVO, List<UserVO>> hosting_meeting = new LinkedHashMap<>();
		for(MeetingVO meeting : service.hostingMeeting(member_id)) {
			meeting.setMeeting_time(meeting.getMeeting_date().substring(11,16));
			meeting.setMeeting_date(meeting.getMeeting_date().substring(0,10));
			hosting_meeting.put(meeting, service.selectJoinedMeetingImg(meeting.getId()));
		}
		model.addAttribute("hosting_meeting", hosting_meeting);
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
