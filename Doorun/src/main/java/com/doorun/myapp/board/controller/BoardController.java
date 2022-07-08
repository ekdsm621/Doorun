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
	
	@RequestMapping (value="/insertBoard.do")
	public String insertBoard(PostVO vo) {
		dao.insertBaord(vo);
		return "getBoardList.do";
	}
	
	@RequestMapping (value="/getBoardList.do")
	public String getBoardList(PostVO vo, Model model) {
		vo.setBoard_id(1);
		model.addAttribute("boardList", dao.getBoardList(vo)); 
		return "board.jsp"; 
	}
	
	@RequestMapping (value="/detailBoard.do")
	public String detailBoard(PostVO vo, Model model) {
		model.addAttribute("board", dao.detailBoard(vo));
		return "detail_board.jsp";
	}
	
	@RequestMapping (value="/updateBoardView.do")
	public String updateBoardView(PostVO vo, Model model) {
		model.addAttribute("board", dao.detailBoard(vo));
		return "update_board.jsp";
	}
	
	@RequestMapping (value="/updateBoard.do")
	public String updateBoard(PostVO vo) {
		dao.updateBaord(vo);
		return "getBoardList.do";
	}

	@RequestMapping (value="/deleteBoard.do")
	public String deleteBoard(PostVO vo) {
		dao.deleteBoard(vo);
		return "getBoardList.do";
	}
	
}
