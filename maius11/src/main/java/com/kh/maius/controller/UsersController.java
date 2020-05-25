package com.kh.maius.controller;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.maius.entity.usersDto;




@Controller
public class UsersController {
	
	


	@Autowired
	private SqlSession SqlSession;
	
	
	@GetMapping("users/join")
	public String join() {		
		return "users/join";
	}
	
	
	@PostMapping("users/join")
	public String join(@ModelAttribute usersDto usersDto){
		
//		UsersService.join(usersDto);
		
		int user_no = SqlSession.selectOne("users.getNo");
		usersDto.setUser_no(user_no);
		
		SqlSession.insert("users.join", usersDto);
		
		return "redirect:/";
	}
	
}
