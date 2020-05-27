package com.kh.maius.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.maius.entity.BoardReplyDto;
import com.kh.maius.entity.ReplyUserVO;

@Repository
public class BoardReplyDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public void replyInsert(BoardReplyDto replydto) {
		sqlSession.insert("boardreply.insert", replydto);
	}
	
	public List<ReplyUserVO> replyList(int no) {
		 List<ReplyUserVO> list = sqlSession.selectList("boardreply.select",no);
		 return list;
	}
	
	public void replyUpdate(ReplyUserVO vo) {
		sqlSession.update("boardreply.edit", vo);
	}
	
	public void replyDelete(ReplyUserVO vo) {
		sqlSession.delete("boardreply.del", vo);
	}
}
