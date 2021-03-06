package com.kh.maius.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.maius.entity.BoardUserVO;

@Repository
public class BoardDetailDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public BoardUserVO detail(int board_no) {
		BoardUserVO boardUserDto = sqlSession.selectOne("boarddetail.detail", board_no);
		return boardUserDto;
	}
	
	public void  readcountup(int board_no) {
		sqlSession.update("boarddetail.up", board_no);
	}
}
