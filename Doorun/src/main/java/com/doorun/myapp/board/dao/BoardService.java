package com.doorun.myapp.board.dao;

import java.util.List;

import com.doorun.myapp.board.vo.BoardVO;
import com.doorun.myapp.board.vo.ReplyVO;

public interface BoardService {

	void insertBaord(BoardVO vo);
	
	void insertReply(ReplyVO vo);

	List<BoardVO> getBoardList(BoardVO vo);
	
	List<ReplyVO> getReply(ReplyVO vo);

	BoardVO detailBoard(BoardVO vo);

	void updateBaord(BoardVO vo);

	void deleteBoard(BoardVO vo);

}