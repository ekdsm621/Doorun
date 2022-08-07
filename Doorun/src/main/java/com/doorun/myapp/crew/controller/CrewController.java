package com.doorun.myapp.crew.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.doorun.myapp.crew.dao.CrewService;
import com.doorun.myapp.crew.vo.CrewVO;
import com.doorun.myapp.user.vo.UserVO;

@Controller
public class CrewController {
	
	@Autowired
	private CrewService crewService;
	
	@RequestMapping("/insertCrew.do")
	public String insertCrew(HttpSession session, CrewVO vo) throws Exception, IOException {
		
		
		MultipartFile uploadFile = vo.getUploadFile();
		vo.setDescribe(vo.getDescribe().replace("\r\n", "<br>"));
		
		// 파일 업로드 처리
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			// 파일 경로는 각자 경로에 맞게 수정해서 테스트!
			uploadFile.transferTo(new File("C:/git/Doorun/Doorun/src/main/webapp/upload_img/crew_img/"+fileName));
			vo.setImage_file(fileName);
		}else {
			vo.setImage_file("");
		}
		vo.setMaster((String)session.getAttribute("id"));
		crewService.insertCrew(vo);
		int crew_ID = crewService.getMaxCrewID();
		crewService.crew_Join(crew_ID, vo.getMaster());
		return "/getCrewList.do";
		
	}
	
	@RequestMapping("/getCrewList.do")
	public String getCrewList(CrewVO vo, Model model) {
		
		
		model.addAttribute("crewList", crewService.getCrewList(vo));
		
		return "crew_list.jsp";
	}
	
	@RequestMapping("/detailCrew.do")
	public String detailCrew(CrewVO vo, Model model) {
		
		model.addAttribute("detailCrew", crewService.detailCrew(vo));
		model.addAttribute("masterImage", crewService.getCrewMasterImage(vo));
		
		List<UserVO> crewMemberList = crewService.getCrewMember(vo);
		
		model.addAttribute("crewMemberList", crewMemberList);
		
		model.addAttribute("getCrewRecentRecord",crewService.getCrewRecentRecord(vo));
		
		return "crew_detail.jsp";
	}
	
	@RequestMapping("/joinCrew.do")
	public String joinCrew(CrewVO vo, HttpSession session) {
		
		crewService.crew_Join(vo.getId(), (String)session.getAttribute("id"));
		crewService.plusCrewMember(vo);
		
		return "/getCrewList.do";
	}
	
	@RequestMapping("/updateCrew.do")
	public String updateCrew(CrewVO vo) {
		
		crewService.updateCrew(vo);
		
		return "/getCrewList.do";
	}
	
	@RequestMapping("/quitCrew.do")
	public String quitCrew(CrewVO vo, HttpSession session) {
		
		String id = (String)session.getAttribute("id");
		crewService.quitCrew(id);
		crewService.minusCrewMember(vo);
		return "/getCrewList.do";
	}
	
	

}
