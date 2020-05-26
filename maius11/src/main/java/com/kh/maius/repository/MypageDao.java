package com.kh.maius.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.maius.entity.UsersDto;

@Repository
public class MypageDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public UsersDto list() {
		int no = 1;
		UsersDto user = sqlSession.selectOne("mypage.list", no);
		
		return user;
	}
	
	public void edit(UsersDto user) {
		sqlSession.update("mypage.edit", user);
	}
	
	public void pw(UsersDto user) {
		sqlSession.update("mypage.pw", user);
	}
	
	public void delete(int user_no) {
		sqlSession.delete("mypage.delete", user_no);
	}
}
