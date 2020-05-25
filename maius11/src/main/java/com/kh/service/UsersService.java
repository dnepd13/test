package com.kh.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.repository.UsersDao;

public class UsersService {

	
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private UsersDao userDao;
	
}
