package com.kh.maius.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.maius.entity.UsersDto;

@Repository
public class UsersDaoImpl implements UsersDao{
	
	@Autowired SqlSession sqlSession;

	//로그인
	@Override 
	public UsersDto login(UsersDto usersDto) {
		return sqlSession.selectOne("users.login", usersDto);
	}
	

	
}
