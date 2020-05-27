package com.kh.maius.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ReplyUserVO {
	private int reply_no;
	private int board_no;
	private int user_no;
	private String reply_content;
	private String reply_wdate;
	private String user_name;
	private String user_id;
}
