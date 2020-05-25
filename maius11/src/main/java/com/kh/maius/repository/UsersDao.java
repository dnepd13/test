package com.kh.maius.repository;

import com.kh.maius.entity.UsersDto;

public interface UsersDao {
	UsersDto login(UsersDto userdDto);
}
