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
	
	
	@Override
	public int getNo() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("users.getNo");
	}

	@Override
	public void regist(UsersDto usersDto) {
		sqlSession.insert("users.join", usersDto);		
		
	}


	@Override
	public String getName(int no) {
		String name = sqlSession.selectOne("users.getName", no);
		return name;
	}

	
}
