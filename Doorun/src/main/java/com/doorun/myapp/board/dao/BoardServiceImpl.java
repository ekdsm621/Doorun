package com.doorun.myapp.board.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doorun.myapp.board.vo.BoardVO;
import com.doorun.myapp.board.vo.ReplyVO;
import com.doorun.myapp.utils.PagingVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDAO dao;

	@Override
	public void insertBaord(BoardVO vo) {
		dao.insertBaord(vo);
	}
	
	@Override
	public void insertReply(ReplyVO vo) {
		dao.insertReply(vo);
	}

	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		return dao.getBoardList(vo);
	}
	
	@Override
	public List<ReplyVO> getReply(ReplyVO vo) {
		return dao.getReply(vo);
	}

	@Override
	public BoardVO detailBoard(BoardVO vo) {
		return dao.detailBoard(vo);
	}

	@Override
	public void updateBaord(BoardVO vo) {
		dao.updateBaord(vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		dao.deleteBoard(vo);
	}

	@Override
	public void deleteReply(ReplyVO vo) {
		dao.deleteReply(vo);
	}
	
	@Override
	public int countBoard(PagingVO vo) {
		return dao.countBoard(vo);
	}
	
	@Override
	public int countBoardT(PagingVO vo) {
		return dao.countBoardT(vo);
	}
	
	@Override
	public int countBoardW(PagingVO vo) {
		return dao.countBoardT(vo);
	}

	@Override
	public List<BoardVO> selectBoard(PagingVO vo) {
		return dao.selectBoard(vo);
	}
	
	@Override
	public List<BoardVO> selectBoardW(PagingVO vo) {
		return dao.selectBoardW(vo);
	}
}
