package com.doorun.myapp.server.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doorun.myapp.run.vo.RunVO;
import com.doorun.myapp.server.dao.ServerService;
import com.doorun.myapp.user.vo.UserVO;

@Controller
public class ServerController {
	
	@Autowired
	private ServerService serverService;
	
	@RequestMapping("/app_login.do")
	public String app_login(UserVO vo, Model model) {
		
		model.addAttribute("check_id",serverService.login(vo) );
		
		return "connectApp.jsp";
	}
	
	@RequestMapping("/app_Kakaologin.do")
	public String app_KakaoLogin(UserVO vo, Model model) {
		
		model.addAttribute("check_id",serverService.login(vo) );
		
		return "connectApp.jsp";
	}
	
	@RequestMapping("/insertRecord.do")
	public void insertRecord(RunVO vo) {
		
		if(vo.getMember_id().contains("@")) {
			vo.setMember_id(serverService.getIdFromEmail(vo.getMember_id()));
			serverService.insertRecord(vo);
			serverService.updateMemberRecord(vo);
		}else {
			serverService.insertRecord(vo);
			serverService.updateMemberRecord(vo);
		}
		

	}
	@RequestMapping("/insertLocation.do")
	public void insertLocation(RunVO vo) {
		
		System.out.println("=======================================");
		
		vo.setId(Integer.toString(serverService.getJourneyMaxId()));
		System.out.println(vo.getId());
		System.out.println(vo.getLongitude());
		System.out.println(vo.getLatitude());
		System.out.println(vo.getMember_id());
		serverService.insertLocation(vo);
		
		
		
	}
	
	

}
