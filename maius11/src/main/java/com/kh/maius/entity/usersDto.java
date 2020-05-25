package com.kh.maius.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class usersDto {
	private int user_no;
	private String user_name;
	private String user_id;
	private String user_pw;
	private String user_birth;
}
