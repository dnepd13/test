package com.kh.maius.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.maius.entity.BoardDto;
import com.kh.maius.repository.BoardDao;




@Service
public class BoardService {
	@Autowired
	private BoardDao boardDao;	
//	
//	
//public void regist(BoardDto boardDto) {
//	int board_no=boardDao.getsequence();
//	
//	boardDto.setBoard_no(board_no);
//	boardDao.regist(boardDto);
//	
//}
	
	public void edit(BoardDto boardDto) {
		boardDao.edit(boardDto);
	}
	
	

	public void readCount(int board_no) {
		boardDao.readCount(board_no);	//조회수 증가
	}
	
}
