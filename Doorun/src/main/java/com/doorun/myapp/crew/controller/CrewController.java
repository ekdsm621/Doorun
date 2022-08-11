package com.doorun.myapp.crew.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.doorun.myapp.board.dao.BoardDAO;
import com.doorun.myapp.board.dao.BoardService;
import com.doorun.myapp.crew.dao.CrewService;
import com.doorun.myapp.crew.vo.CrewVO;
import com.doorun.myapp.user.vo.UserVO;
import com.doorun.myapp.utils.PagingVO;

@Controller
public class CrewController {
	
	@Autowired
	private CrewService crewService;
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/insertCrew.do")
	public String insertCrew(HttpSession session, CrewVO vo) throws Exception, IOException {
		
		String area = vo.getTemp_area()+" "+vo.getTemp_area2();
		
		vo.setArea(area);
		
		
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
		
		return "crew_join.jsp";
	}
	
	@RequestMapping("/detailCrew.do")
	public String detailCrew(CrewVO vo, Model model, PagingVO pagingVO
			,@RequestParam(value="id", required=true)String id
			,@RequestParam(value="nowPage", required=false)String nowPage
			,@RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		model.addAttribute("detailCrew", crewService.detailCrew(vo));
		model.addAttribute("masterImage", crewService.getCrewMasterImage(vo));
		
		List<UserVO> crewMemberList = crewService.getCrewMember(vo);
		
		model.addAttribute("crewMemberList", crewMemberList);
		
		model.addAttribute("getCrewRecentRecord",crewService.getCrewRecentRecord(vo));
		
		// 게시판
		int total = boardService.countBoard(Integer.parseInt(id));
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), Integer.parseInt(id));
		model.addAttribute("paging", pagingVO);
		model.addAttribute("viewAll", boardService.selectBoard(pagingVO));
		
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
