package com.doorun.myapp.meeting.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doorun.myapp.meeting.dao.MeetingServiceImpl;
import com.doorun.myapp.meeting.vo.MeetingVO;

@Controller
public class MeetingController {
	
	@Autowired
	MeetingServiceImpl service;
	
	@RequestMapping("/insertMeeting.do")
	public String insertMeeting(MeetingVO vo) {
		
		
		System.out.println("컨트롤러 들어옴");
		System.out.println(vo.getTitle());
		System.out.println(vo.getContent());
		System.out.println(vo.getMaster());
		System.out.println(vo.getLatitude());
		System.out.println(vo.getLongitude());
		System.out.println(vo.getMeeting_date());
		
		service.insertMeeting(vo);
		return "redirect:joined_team.jsp";
	}
	
}
