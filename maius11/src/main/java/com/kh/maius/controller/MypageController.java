package com.kh.maius.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.maius.entity.UsersDto;
import com.kh.repository.MypageDao;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private MypageDao mypage;
	
	@GetMapping("/list")
	public String list(Model model) {
		
		model.addAttribute("my" ,mypage.list());
		
		return "mypage/list";
	}
	
	@GetMapping("/edit")
	public String edit(
			@RequestParam int user_no,
			Model model
			) {
		
		model.addAttribute("my" ,mypage.list());
		
		model.addAttribute("user_no", user_no);
		
		return "mypage/edit";
	}
	
	@PostMapping("/edit")
	public String edit_do(@ModelAttribute UsersDto user) {
		mypage.edit(user);
		return "redirect:/mypage/list?user_no="+user.getUser_no();
	}
	
	@GetMapping("/pw")
	public String pw(@RequestParam int user_no, Model model) {
		model.addAttribute("user_no", user_no);
		return "mypage/pw";
	}
	
	@PostMapping("/pw")
	public String pw_do(
			@RequestParam int user_no,
			@RequestParam String user_pw,
			@RequestParam String new_user_pw
				) {
		
		//현재 비밀번호가 맞다면
		if(mypage.list().getUser_pw().equalsIgnoreCase(user_pw)) {
			UsersDto user = new UsersDto().builder().user_pw(new_user_pw).user_no(user_no).build();
			mypage.pw(user);
			return "redirect:/mypage/list?user_no="+user_no;
		}
		else {
			return "redirect:/mypage/pw?error=1&user_no="+user_no;
		}
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam int user_no) {
		mypage.delete(user_no);
		return "redirect:/";
	}
}
