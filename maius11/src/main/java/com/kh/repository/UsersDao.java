package com.kh.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class UsersDao {

	
	@Autowired
	private SqlSession sqlSession;
}
