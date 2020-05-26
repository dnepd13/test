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
//		int board_no = 1; //바꿔야 할것
		BoardUserVO boardUserDto = sqlSession.selectOne("boarddetail.detail", board_no);
		return boardUserDto;
	}
	
	public void  readcountup(int board_no) {
//		int board_no = 1; //바꿔야 할것
		sqlSession.update("boarddetail.up", board_no);
	}
}
