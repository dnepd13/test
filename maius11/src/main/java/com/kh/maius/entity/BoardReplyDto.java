package com.kh.maius.entity;

import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor @NoArgsConstructor @Data @Builder @Repository
public class BoardReplyDto {
	private int reply_no;
	private int board_no;
	private int user_no;
	private String reply_content;
	private String reply_wdate;
}
