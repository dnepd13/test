package com.kh.maius.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class BoardUserVO {
	private int board_no, user_no, board_replycount, board_readcount;
	private String  board_title, board_wdate, board_content;
	private String user_name;
	private String user_id;
	private String user_pw;
	private String user_birth;
}
