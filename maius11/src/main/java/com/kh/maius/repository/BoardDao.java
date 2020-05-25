package com.kh.maius.repository;

import java.util.List;
import java.util.Map;

import com.kh.maius.entity.BoardDto;

public interface BoardDao {
	//게시판 목록 조회기능
		List<BoardDto> getList();
}
