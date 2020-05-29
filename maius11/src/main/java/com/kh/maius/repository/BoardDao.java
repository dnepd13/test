package com.kh.maius.repository;

import java.util.List;
import java.util.Map;

import com.kh.maius.entity.BoardDto;
import com.kh.maius.entity.BoardUserVO;


public interface BoardDao {
	//게시판 목록 조회기능
		List<BoardUserVO> getList();
		
		int getsequence();
		
		void regist(BoardDto boardDto);
		
		public BoardDto get(int board_no);

		void edit(BoardDto boardDto);

		void delete(int board_no);

		int boardCount();

		List<BoardUserVO> getList(Map<String, Integer> param);

		void readCount(int board_no);
		
		void boardReplyCountUp(int board_no);
		
		void boardReplyCountDown(int board_no);

		List<BoardDto> search(Map<String, String> param);

		int boardSearchCount(Map<String, String> param);
}
