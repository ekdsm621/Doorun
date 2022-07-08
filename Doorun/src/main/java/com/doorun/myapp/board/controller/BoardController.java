package com.doorun.myapp.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doorun.myapp.board.dao.BoardDAO;
import com.doorun.myapp.board.vo.PostVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardDAO dao;
	
	@RequestMapping ("/getBoardList.do")
	public String getBoardList(PostVO vo, Model model) {
		vo.setBoard_id(1);
		 model.addAttribute("boardList", dao.getBoardList(vo)); 
		 return "board.jsp"; 
	}
	
//	@RequestMapping("/insertInstant.do")
//	public String insertBoard(InstantBrdVO vo) {
//		
//		dao.insert(vo);
//		return "";
//	}
//	@RequestMapping("/updateInstant.do")
//	public String updateBoard(InstantBrdVO vo) {
//		dao.update(vo);
//		return "";
//	}
//	
//	@RequestMapping("/deleteInstant.do")
//	public String deleteBoard(InstantBrdVO vo) {
//		dao.delete(vo);
//		
//		return "";
//	}
//	
//	@RequestMapping ("/getInstantBoard.do")
//	public String getBoard(InstantBrdVO vo, Model model) {
//				 		 
//		 model.addAttribute("instantBrd", dao.getBoard(vo)); 
//		
//		 return ""; 
//	}
//	
//	@RequestMapping ("/getInstantBoardList.do")
//	public String getBoardList(InstantBrdVO vo, Model model) {
//				 		 
//		 model.addAttribute("instantBrdList", dao.getBoardList(vo)); 
//		
//		 return ""; 
//	}
//	
//	///////////////////////////////////////////////////////////////////////
//	
//	
//	@RequestMapping("/insertCrewBrd.do")
//	public String insertBoard(CrewBrdVO vo) {
//		
//		dao.insert(vo);
//		return "";
//	}
//	@RequestMapping("/updateCrewBrd.do")
//	public String updateBoard(CrewBrdVO vo) {
//		dao.update(vo);
//		return "";
//	}
//	
//	@RequestMapping("/deleteCrewBrd.do")
//	public String deleteBoard(CrewBrdVO vo) {
//		dao.delete(vo);
//		
//		return "";
//	}
//	
//	@RequestMapping ("/getCrewBrd.do")
//	public String getBoard(CrewBrdVO vo, Model model) {
//				 		 
//		 model.addAttribute("crewBrd", dao.getBoard(vo)); 
//		
//		 return ""; 
//	}
//	
//	@RequestMapping ("/getCrewBrdList.do")
//	public String getBoardList(CrewBrdVO vo, Model model) {
//				 		 
//		 model.addAttribute("crewBrdList", dao.getBoardList(vo)); 
//		
//		 return ""; 
//	}
//	
//	///////////////////////////////////////////////////////////////
//	
//	@RequestMapping("/insertFreeBrd.do")
//	public String insertBoard(FreeBrdVO vo) {
//		
//		dao.insert(vo);
//		return "";
//	}
//	@RequestMapping("/updateFreeBrd.do")
//	public String updateBoard(FreeBrdVO vo) {
//		dao.update(vo);
//		return "";
//	}
//	
//	@RequestMapping("/deleteFreeBrd.do")
//	public String deleteBoard(FreeBrdVO vo) {
//		dao.delete(vo);
//		
//		return "";
//	}
//	
//	@RequestMapping ("/getFreeBrd.do")
//	public String getBoard(FreeBrdVO vo, Model model) {
//				 		 
//		 model.addAttribute("freeBrd", dao.getBoard(vo)); 
//		
//		 return ""; 
//	}
//	
//	@RequestMapping ("/getFreeBrdList.do")
//	public String getBoardList(FreeBrdVO vo, Model model) {
//				 		 
//		 model.addAttribute("freeBrdList", dao.getBoardList(vo)); 
//		
//		 return ""; 
//	}
//	
//	/////////////////////////////////////////////////////////////////////
//	
//	@RequestMapping("/insertEventBrd.do")
//	public String insertBoard(EventBrdVO vo) {
//		
//		dao.insert(vo);
//		return "";
//	}
//	@RequestMapping("/updateEventBrd.do")
//	public String updateBoard(EventBrdVO vo) {
//		dao.update(vo);
//		return "";
//	}
//	
//	@RequestMapping("/deleteFreeBrd.do")
//	public String deleteBoard(EventBrdVO vo) {
//		dao.delete(vo);
//		
//		return "";
//	}
//	
//	@RequestMapping ("/getEventBrd.do")
//	public String getBoard(EventBrdVO vo, Model model) {
//				 		 
//		 model.addAttribute("eventwBrd", dao.getBoard(vo)); 
//		
//		 return ""; 
//	}
//	
//	@RequestMapping ("/getEventBrdList.do")
//	public String getBoardList(EventBrdVO vo, Model model) {
//				 		 
//		 model.addAttribute("eventBrdList", dao.getBoardList(vo)); 
//		
//		 return ""; 
//	}

}
