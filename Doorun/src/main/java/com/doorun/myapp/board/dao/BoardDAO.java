package com.doorun.myapp.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.doorun.myapp.board.vo.BoardVO;
import com.doorun.myapp.board.vo.ReplyVO;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public void insertBaord(BoardVO vo) {
		vo.setBoard_id(1);
		sst.insert("Board.insertBoard", vo);
	}
	
	public void insertReply(ReplyVO vo) {
		sst.insert("Board.insertReply", vo);
	}
	
	public List<BoardVO> getBoardList(BoardVO vo){		
		return sst.selectList("Board.getBoardList",vo);
	}
	
	public List<ReplyVO> getReply(ReplyVO vo) {
		return sst.selectList("Board.getReply",vo);
	}
	
	public BoardVO detailBoard(BoardVO vo) {
		return sst.selectOne("Board.detailBoard", vo);
	}

	public void updateBaord(BoardVO vo) {
		sst.update("Board.updateBoard", vo);
	}
	
	public void deleteBoard(BoardVO vo) {
		sst.delete("Board.deleteBoard", vo);
	}

}
