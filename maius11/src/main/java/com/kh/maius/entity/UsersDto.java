package com.kh.maius.entity;

import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder @Repository
public class UsersDto {
	private int user_no;
	private String user_name;
	private String user_id;
	private String user_pw;
	private String user_birth;
}
