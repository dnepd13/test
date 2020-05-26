package com.kh.maius.repository;

import java.util.List;

import com.kh.maius.entity.BoardDto;

public interface BoardDao {
	//게시판 목록 조회기능
		List<BoardDto> getList();
		
		int getsequence();
		
		void regist(BoardDto boardDto);
		
		public BoardDto get(int board_no);

		void edit(BoardDto boardDto);
}
