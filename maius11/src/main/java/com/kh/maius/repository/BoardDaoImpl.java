package com.kh.maius.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.maius.entity.BoardDto;


@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BoardDto> getList() {
		return sqlSession.selectList("board.list");
	}

	public int getsequence() {
		return sqlSession.selectOne("board.getNo");
	}

	public void regist(BoardDto boardDto) {
		sqlSession.insert("board.regist", boardDto);		
	}
	
	public BoardDto get(int board_no) {		
		return sqlSession.selectOne("board.get", board_no); //board_no를 주고 단일조회한다.
	}

	@Override
	public void edit(BoardDto boardDto) {
		sqlSession.update("board.edit", boardDto);
	}
	
	
}
