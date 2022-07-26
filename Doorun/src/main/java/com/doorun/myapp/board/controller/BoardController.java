package com.doorun.myapp.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.doorun.myapp.board.dao.BoardService;
import com.doorun.myapp.board.vo.BoardVO;
import com.doorun.myapp.board.vo.ReplyVO;

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
		vo.setBoard_id(1);
		dao.insertBaord(vo);
		return "getBoardList.do";
	}
	
	@RequestMapping(value="/reply.do")
	public String insertReply(ReplyVO vo) {
		vo.setContent(vo.getContent().replace("\r\n", "<br>"));
		dao.insertReply(vo);
		String returnDetail = "redirect:detailBoard.do?id="+vo.getBoard_id();
		return returnDetail;
	}
	
	//R
	@RequestMapping (value="/getBoardList.do")
	public String getBoardList(BoardVO vo, Model model) {
		model.addAttribute("boardList", dao.getBoardList(vo)); 
		return "board.jsp"; 
	}
	
	@RequestMapping (value="/detailBoard.do", method=RequestMethod.GET)
	public String detailBoard(BoardVO boardVO, ReplyVO replyVO, Model model) {
		// 1. detail
		model.addAttribute("board", dao.detailBoard(boardVO));
		// 2. reply
		replyVO.setBoard_id(boardVO.getId());
		model.addAttribute("reply",dao.getReply(replyVO));
		return "detail_board.jsp";
	}
	
	
	//U
	@RequestMapping (value="/updateBoard.do", method=RequestMethod.GET)
	public String updateBoardView(BoardVO vo, Model model) {
		BoardVO board = dao.detailBoard(vo);
		board.setContent(board.getContent().replace("<br>", "\r\n"));
		model.addAttribute("board", board);
		return "update_board.jsp";
	}
	
	@RequestMapping (value="/updateBoard.do", method=RequestMethod.POST)
	public String updateBoard(BoardVO vo) {
		String returnBoard = "redirect:detailBoard.do?id="+vo.getId();
		vo.setContent(vo.getContent().replace("\r\n", "<br>"));
		dao.updateBaord(vo);
		return returnBoard;
	}

	//D
	@RequestMapping (value="/deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		String returnBoard = "getBoardList.do?board_id="+dao.detailBoard(vo).getBoard_id();
		dao.deleteBoard(vo);
		return returnBoard;
	}
	
}
