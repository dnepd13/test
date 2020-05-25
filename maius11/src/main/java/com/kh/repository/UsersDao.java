package com.kh.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.maius.entity.usersDto;

public interface UsersDao {

	int getNo();
	void regist(usersDto usersDto);
}
