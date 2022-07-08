package com.doorun.myapp.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.doorun.myapp.board.vo.PostVO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate sst;
	
	public void insertBaord(PostVO vo) {
//		vo.setWriter(); -> session에서 작성자 아이디 가져와서 넣기
//		vo.setBoard_id(); -> Board_id 가져와서 넣기
//		넣은 후 board-mapping.xml도 수정 필요
		vo.setWriter("name");
		sst.insert("Board.insertBoard", vo);
	}
	
	public List<PostVO> getBoardList(PostVO vo){		
		return sst.selectList("Board.getBoardList",vo);
	}
	
	public PostVO detailBoard(PostVO vo) {
		return sst.selectOne("Board.detailBoard", vo);
	}

	public void updateBaord(PostVO vo) {
		sst.update("Board.updateBoard", vo);
	}
	
	public void deleteBoard(PostVO vo) {
		sst.delete("Board.deleteBoard", vo);
	}

}
