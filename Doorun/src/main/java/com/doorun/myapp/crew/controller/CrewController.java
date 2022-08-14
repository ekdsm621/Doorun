package com.doorun.myapp.crew.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.doorun.myapp.board.dao.BoardService;
import com.doorun.myapp.crew.dao.CrewService;
import com.doorun.myapp.crew.vo.CrewJoinVO;
import com.doorun.myapp.crew.vo.CrewVO;
import com.doorun.myapp.run.vo.RunVO;
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
		
		// 지역
		String area = vo.getTemp_area()+" "+vo.getTemp_area2();
		vo.setArea(area);
		
		// 설명 - 줄바꿈 처리
		vo.setDescribe(vo.getDescribe().replace("\r\n", "<br>"));
		
		// 이미지 파일 처리
		MultipartFile upload_file1 = vo.getUploadFile1();
		
		if(!upload_file1.isEmpty()) {
			String fileName1 = upload_file1.getOriginalFilename();
			upload_file1.transferTo(new File("C:/git/Doorun/Doorun/src/main/webapp/upload_img/crew_img/"+fileName1));
			vo.setImage_file(fileName1);
		}else {
			vo.setImage_file("");
		}
		
		MultipartFile upload_file2 = vo.getUploadFile2();
		
		if(!upload_file2.isEmpty()) {
			String fileName2 = upload_file2.getOriginalFilename();
			upload_file2.transferTo(new File("C:/git/Doorun/Doorun/src/main/webapp/upload_img/crew_img/"+fileName2));
			vo.setBackground_img(fileName2);
		}else {
			vo.setBackground_img("");
		}
		
		// 크루장 처리
		vo.setMaster((String)session.getAttribute("id"));
		
		// insert
		crewService.insertCrew(vo);
		int crew_ID = crewService.getMaxCrewID();
		
		CrewJoinVO joinVO = new CrewJoinVO();
		joinVO.setCrew_id(crew_ID);
		joinVO.setMember_id(vo.getMaster());
		crewService.crew_Join(joinVO);
		return "redirect:getCrewList.do";
		
	}
	
	@RequestMapping("/getCrewList.do")
	public String getCrewList(HttpServletRequest request, CrewVO vo, Model model) {
		if(vo.getName() == null) {
			vo.setName("");
		}
		
		if(request.getParameter("temp_area") != null) {
			if(request.getParameter("temp_area2").equals("전체")) {
				vo.setArea(request.getParameter("temp_area"));			
			}else {
				vo.setArea(request.getParameter("temp_area") + " " + request.getParameter("temp_area2"));			
			}
		}else {
			vo.setArea("");
		}
		
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
		List<String> total_durationList = new ArrayList<String>();
		List<String> paceList = new ArrayList<String>();
		for(UserVO run:crewMemberList) {
			
			// 2. 시간
			double duration = run.getTotal_duration();
			int totalHour = (int)(duration / 3600);
			duration -= totalHour * 3600;
			int totalMin = (int)(duration / 60);
			duration -= totalMin * 60;
			int totalSec = (int)(duration);
			
			String totalHour_str = Integer.toString(totalHour);
			if(totalHour_str.length()==1) {
				totalHour_str= "0"+totalHour_str;
			}
			String totalMin_str = Integer.toString(totalMin);
			if(totalMin_str.length()==1) {
				totalMin_str= "0"+totalMin_str;
			}
			String totalSec_str = Integer.toString(totalSec);
			if(totalSec_str.length()==1) {
				totalSec_str= "0"+totalSec_str;
			}
			
			String total_druation = totalHour_str+":"+totalMin_str+":"+totalSec_str;
			
			total_durationList.add(total_druation);
			
			// 3. 페이스
			double pace = run.getTotal_duration() / run.getTotal_distance();
			int paceMin = (int)(pace / 60);
			int paceSec = (int)(pace % 60);
			
			String paceSec_str = Integer.toString(paceSec);
			if(paceSec_str.length()==1) {
				paceSec_str= "0"+paceSec_str;
			}
			
			String pace_str = paceMin+"'"+paceSec_str+"'";
			paceList.add(pace_str);
			
		}
		
		List<RunVO> getCrewRecentRecord = crewService.getCrewRecentRecord(vo);
		for(RunVO run:getCrewRecentRecord) {
			// 시간
			int runDuration = Integer.parseInt(run.getDuration());
			
			int tempDuration = runDuration;
			int runHour = (int)(tempDuration / 3600);
			tempDuration -= runHour * 3600;
			int runMin = (int)(tempDuration / 60);
			tempDuration -= runMin * 60;
			
			String runHour_str = Integer.toString(runHour);
			if(runHour_str.length()==1) {
				runHour_str= "0"+runHour_str;
			}
			String runMin_str = Integer.toString(runMin);
			if(runMin_str.length()==1) {
				runMin_str= "0"+runMin_str;
			}
			
			String tempDuration_str = Integer.toString(tempDuration);
			if(tempDuration_str.length()==1) {
				tempDuration_str= "0"+tempDuration_str;
			}
			
			String strDuration = runHour_str + ":" + runMin_str + ":" + tempDuration_str;
			run.setDuration(strDuration);
			
			// 페이스
			double runDistance = Double.parseDouble(run.getDistance());
			double runPace = runDuration / runDistance;
			int runPaceMin = (int)(runPace / 60);
			int runPaceSec = (int)(runPace % 60);
			
			String runPaceSec_str = Integer.toString(runPaceSec);
			if(runPaceSec_str.length()==1) {
				runPaceSec_str= "0"+runPaceSec_str;
			}
			
			String strRunPace = runPaceMin + "'" + runPaceSec_str + "''";
			run.setAvg_speed(strRunPace);
		}
		
		model.addAttribute("crewMemberList", crewMemberList);
		
		model.addAttribute("total_durationList",total_durationList);
		model.addAttribute("paceList", paceList);
		
		model.addAttribute("getCrewRecentRecord",getCrewRecentRecord);
		
		// 寃뚯떆�뙋
		pagingVO.setBoard_id(Integer.parseInt(id));
		int total = boardService.countBoard(pagingVO);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), Integer.parseInt(id),"title","");
		model.addAttribute("paging", pagingVO);
		model.addAttribute("viewAll", boardService.selectBoard(pagingVO));
		
		return "crew_detail.jsp";
	}
	
	@RequestMapping("/joinCrew.do")
	public String joinCrew(CrewJoinVO vo) {
		System.out.println("crew_id"+vo.getCrew_id());
		System.out.println("member_id"+vo.getMember_id());
		int check = crewService.crew_Join(vo);
		if(check == 1) {
			crewService.plusCrewMember(vo);
		}else {
		}
		
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
