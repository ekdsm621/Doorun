package com.doorun.myapp.marathon.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doorun.myapp.marathon.dao.MarathonService;
import com.doorun.myapp.marathon.vo.MarathonVO;

@Controller
public class MarathonController {
	
	@Autowired
	private MarathonService marathonService;
	
	
	@RequestMapping("/getmarathon.do")
	public String getMarathon( Model model) {
		
		List<MarathonVO> marathonlist = marathonService.getMarathon();
		
		model.addAttribute( "marathonlist",marathonlist);
		
		
		return "marathon.jsp";
	}

}
