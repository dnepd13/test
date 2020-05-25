package com.kh.maius.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor @NoArgsConstructor @Data @Builder
public class boardReplyDto {
	private int reply_no;
	private int board_no;
	private int user_no;
	private String reply_content;
	private String reply_wdate;
}
