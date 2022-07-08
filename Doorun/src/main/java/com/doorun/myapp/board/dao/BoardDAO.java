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
	
	public List<PostVO> getBoardList(PostVO vo){		
		return sst.selectList("Board.getBoardList",vo);
	}

}
