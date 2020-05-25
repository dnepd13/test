package com.kh.repository;


import com.kh.maius.entity.UsersDto;

public interface UsersDao {

	int getNo();
	void regist(UsersDto usersDto);
}
