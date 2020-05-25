package com.kh.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class boardDto {
	private int board_no, user_no, board_replycount, board_readcount;
	private String  board_title, board_wdate, board_content;
	
}
