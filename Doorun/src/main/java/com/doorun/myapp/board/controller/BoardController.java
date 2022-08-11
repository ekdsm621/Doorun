package com.doorun.myapp.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.doorun.myapp.board.dao.BoardService;
import com.doorun.myapp.board.vo.BoardVO;
import com.doorun.myapp.board.vo.ReplyVO;
import com.doorun.myapp.utils.PagingVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService dao;
	
	//C
	@RequestMapping (value="/insertBoard.do")
	public String insertBoard(HttpSession session, BoardVO vo) throws IOException {
		MultipartFile uploadFile = vo.getUploadFile();
		vo.setContent(vo.getContent().replace("\r\n", "<br>"));
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File("C:/git/Doorun/Doorun/src/main/webapp/upload_img/free_board/"+fileName));
			vo.setImage_file(fileName);
		}else {
			vo.setImage_file("");
		}
		vo.setWriter((String)session.getAttribute("id"));
		
		dao.insertBaord(vo);
		
		
		if(vo.getBoard_id() == 1) {
			return "redirect:boardList.do?id=1";
		}else {
			return "redirect:detailCrew.do?id="+vo.getBoard_id();
		}
	}
	
	@RequestMapping(value="/reply.do")
	public String insertReply(ReplyVO vo) {
		vo.setContent(vo.getContent().replace("\r\n", "<br>"));
		dao.insertReply(vo);
		String returnDetail = "redirect:detailBoard.do?id="+vo.getBoard_id();
		return returnDetail;
	}
	
	//R
	@RequestMapping (value="/detailBoard.do", method=RequestMethod.GET)
	public String detailBoard(BoardVO boardVO, ReplyVO replyVO, Model model) {
		// 1. detail
		model.addAttribute("board", dao.detailBoard(boardVO));
		// 2. reply
		replyVO.setBoard_id(boardVO.getId());
		model.addAttribute("reply",dao.getReply(replyVO));
		return "entire_getBoard.jsp";
	}
	
	
	//U
	@RequestMapping (value="/updateBoard.do", method=RequestMethod.GET)
	public String updateBoardView(BoardVO vo, Model model) {
		BoardVO board = dao.detailBoard(vo);
		board.setContent(board.getContent().replace("<br>", "\r\n"));
		model.addAttribute("board", board);
		return "entireBoard_update.jsp";
	}
	
	@RequestMapping (value="/updateBoard.do", method=RequestMethod.POST)
	public String updateBoard(BoardVO vo) {
		String returnBoard = "redirect:detailBoard.do?id="+vo.getId()+"&board_id="+vo.getBoard_id();
		
		vo.setContent(vo.getContent().replace("\r\n", "<br>"));
		dao.updateBaord(vo);
		return returnBoard;
	}

	//D
	@RequestMapping (value="/deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		String returnBoard;
		if(vo.getBoard_id() == 1) {
			returnBoard = "redirect:boardList.do?id=1";		
		}else {
			returnBoard = "redirect:detailCrew.do?id="+vo.getBoard_id();
		}
		dao.deleteBoard(vo);
		return returnBoard;
	}
	
	@RequestMapping (value="/deleteReply.do")
	public String deleteReply(ReplyVO vo) {
		String returnBoard = "redirect:detailBoard.do?id="+vo.getBoard_id();
		dao.deleteReply(vo);
		return returnBoard;
	}
	
	@RequestMapping(value="/boardList.do")
	public String boardList(PagingVO vo, Model model
			, @RequestParam(value="id", required=true)String id
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = dao.countBoard(Integer.parseInt(id));
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), Integer.parseInt(id));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", dao.selectBoard(vo));
		return "entire_board.jsp";
	}
}
