package com.kh.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.entity.usersDto;

@Repository
public class MypageDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public usersDto list() {
		int no = 1;
		usersDto user = sqlSession.selectOne("mypage.list", no);
		
		return user;
	}
	
	public void edit(usersDto user) {
		sqlSession.update("mypage.edit", user);
	}
	
	public void pw(usersDto user) {
		sqlSession.update("mypage.pw", user);
	}
	
	public void delete(int user_no) {
		sqlSession.delete("mypage.delete", user_no);
	}
}
