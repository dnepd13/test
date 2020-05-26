package com.kh.maius.entity;

import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder@Repository
public class BoardDto {
	private int board_no, user_no, board_replycount, board_readcount;
	private String  board_title, board_wdate, board_content;
	
}
