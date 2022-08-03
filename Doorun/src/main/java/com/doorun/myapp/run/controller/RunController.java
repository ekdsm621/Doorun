package com.doorun.myapp.run.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doorun.myapp.run.dao.RunService;
import com.doorun.myapp.run.vo.RunVO;


@Controller
public class RunController {
	
	@Autowired
	private RunService runService;
	
	@RequestMapping("/getRecordList.do")
	public String getRecordList(RunVO vo, Model model, HttpSession session) {
		
		vo.setMember_id((String)session.getAttribute("id"));
		
		model.addAttribute("recordList",runService.getRecordList(vo));
		
		return "getRecordList.jsp";
	}
	
	@RequestMapping("/detailRecord.do")
	public String detailRecord(RunVO vo, Model model, HttpSession session,HttpServletRequest req) {
		
		vo.setMember_id((String)session.getAttribute("id"));
		
		model.addAttribute("detailRecord", runService.detailRecord(vo));
		req.setAttribute("locationList",runService.getMap(vo));
		
		return "detail_Record.jsp";
		
	}
	

}
