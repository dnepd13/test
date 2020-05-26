package com.kh.maius.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.maius.entity.BoardReplyDto;

@Repository
public class BoardReplyDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public void replyInsert(BoardReplyDto replydto) {
		sqlSession.insert("boardreply.insert", replydto);
	}
	
	public List<BoardReplyDto> replyList(int no) {
		 List<BoardReplyDto> list = sqlSession.selectList("boardreply.select",no);
		 return list;
	}
}
