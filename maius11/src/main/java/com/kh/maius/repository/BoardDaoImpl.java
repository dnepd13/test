package com.kh.maius.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.maius.entity.BoardDto;
import com.kh.maius.entity.BoardUserVO;


@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BoardUserVO> getList() {
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

	@Override
	public void delete(int board_no) {
		sqlSession.delete("board.delete", board_no);
		
	}

	@Override
	public int boardCount() {
		return sqlSession.selectOne("board.boardCount");
	}

	@Override
	public List<BoardUserVO> getList(Map<String, Integer> param) {
		
		return sqlSession.selectList("board.list", param);
	}

	@Override
	public void readCount(int board_no) {
		sqlSession.update("board.readCount", board_no);		
		
	}
	
	
}
