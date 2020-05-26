package com.kh.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.maius.entity.UsersDto;

@Repository
public class UsersDaoImpl implements UsersDao{

	
	@Autowired
	public SqlSession sqlSession;
	
	
	@Override
	public int getNo() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("users.getNo");
	}

	@Override
	public void regist(UsersDto usersDto) {
		sqlSession.insert("users.join", usersDto);		
		
	}

}
