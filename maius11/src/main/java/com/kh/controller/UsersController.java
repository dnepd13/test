package com.kh.controller;




import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.entity.usersDto;
import com.kh.repository.UsersDao;


@Controller
public class UsersController {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private UsersDao userDao;
	
	@Autowired
	private usersDto usersDto;
	
}
