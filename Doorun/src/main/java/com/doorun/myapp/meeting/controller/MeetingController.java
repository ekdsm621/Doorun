package com.doorun.myapp.meeting.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	
	@RequestMapping(value="/insertMeeting.do", method=RequestMethod.POST)
	public String insertMeeting(HttpServletRequest request, MeetingVO vo) {
		String location = request.getParameter("general") + " " + request.getParameter("state");
		vo.setLocation(location);
		vo.setMeeting_date(vo.getMeeting_date()+vo.getMeeting_time());
		vo.setContent(vo.getContent().replace("\r\n", "<br>"));
		service.insertMeeting(vo);
		return "redirect:meeting.do";
	}
	
	@RequestMapping(value="/meeting.do")
	public String selectMeeting(HttpSession session, MeetingVO vo, Model model) {
		vo.setMember_id((String)session.getAttribute("id"));
		vo.setTitle("");
		vo.setLocation("");
		
		// 李몄뿬�븳
		Map<MeetingVO, List<UserVO>> joined_meetings = new LinkedHashMap<>();
		for(MeetingVO meeting : service.selectJoinedMeeting(vo)) {
			meeting.setMeeting_date(meeting.getMeeting_date().substring(0, 16));
			joined_meetings.put(meeting, service.selectJoinedMeetingImg(meeting.getId()));
		}
		model.addAttribute("joined_meeting", joined_meetings);
		
		//李몄뿬�븯吏� �븡��
		Map<MeetingVO, List<UserVO>> not_joined_meetings = new LinkedHashMap<>();
		for(MeetingVO meeting : service.selectNotJoinedMeeting(vo)) {
			meeting.setMeeting_date(meeting.getMeeting_date().substring(0, 16));
			not_joined_meetings.put(meeting, service.selectJoinedMeetingImg(meeting.getId()));
		}
		model.addAttribute("not_joined_meeting", not_joined_meetings);
		
		return "team_list.jsp";
	}
	
	@RequestMapping(value="/searchMeeting.do", method=RequestMethod.POST)
	public String searchMeeting(HttpServletRequest request, HttpSession session, MeetingVO vo, Model model) {
		vo.setMember_id((String)session.getAttribute("id"));
		if(request.getParameter("team_name") != null) {
			vo.setTitle(request.getParameter("team_name"));
		}else {
			vo.setTitle("");
		}
		if(request.getParameter("general") != null) {
			if(request.getParameter("state").equals("전체")) {
				vo.setLocation(request.getParameter("general"));			
			}else {
				vo.setLocation(request.getParameter("general") + " " + request.getParameter("state"));			
			}
		}else {
			vo.setLocation("");
		}
		
		// 李몄뿬�븳
		Map<MeetingVO, List<UserVO>> joined_meetings = new LinkedHashMap<>();
		
		for(MeetingVO meeting : service.selectJoinedMeeting(vo)) {
			meeting.setMeeting_date(meeting.getMeeting_date().substring(0, 16));
			joined_meetings.put(meeting, service.selectJoinedMeetingImg(meeting.getId()));
		}
		model.addAttribute("joined_meeting", joined_meetings);
		
		//李몄뿬�븯吏� �븡��
		Map<MeetingVO, List<UserVO>> not_joined_meetings = new LinkedHashMap<>();
		for(MeetingVO meeting : service.selectNotJoinedMeeting(vo)) {
			meeting.setMeeting_date(meeting.getMeeting_date().substring(0, 16));
			not_joined_meetings.put(meeting, service.selectJoinedMeetingImg(meeting.getId()));
		}
		model.addAttribute("not_joined_meeting", not_joined_meetings);
		
		return "team_list.jsp";
	}
	
	@RequestMapping(value="/joinMeeting.do", method=RequestMethod.POST)
	@ResponseBody
	public Object joinMeeting(MeetingJoinVO vo){
//		PrintWriter out = response.getWriter();
		if(service.joinMeeting(vo)) {
			return "y";
		}else {
			return "n";
		}
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
			meeting.setContent(meeting.getContent().replace("<br>", "\r\n"));
			hosting_meeting.put(meeting, service.selectJoinedMeetingImg(meeting.getId()));
		}
		model.addAttribute("hosting_meeting", hosting_meeting);
		return "joined_team_list.jsp";
	}
	
	@RequestMapping(value="/deleteJoin.do")
	public String deleteJoin(MeetingJoinVO vo) {
		service.deleteJoin(vo);
		return "joinedMeeting.do";
	}
	
	@RequestMapping(value="/updateMeeting.do", method=RequestMethod.POST)
	public String updateMeeting(HttpServletRequest request, MeetingVO vo) {
		String location = request.getParameter("general") + " " + request.getParameter("state");
		vo.setLocation(location);
		vo.setMeeting_date(vo.getMeeting_date()+vo.getMeeting_time());
		vo.setContent(vo.getContent().replace("\r\n", "<br>"));
		service.updateMeeting(vo);
		return "joinedMeeting.do";
	}
	
	@RequestMapping(value="/deleteMeeting.do")
	public String deleteMeeting(MeetingJoinVO vo) {
		service.deleteMeeting(vo);
		return "joinedMeeting.do";
	}
	
}
