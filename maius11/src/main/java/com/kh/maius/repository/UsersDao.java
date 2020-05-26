package com.kh.maius.repository;

import com.kh.maius.entity.UsersDto;

public interface UsersDao {
	UsersDto login(UsersDto userdDto);
	
	
	int getNo();
	void regist(UsersDto usersDto);
}
