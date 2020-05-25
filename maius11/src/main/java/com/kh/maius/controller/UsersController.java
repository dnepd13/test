package com.kh.maius.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.maius.entity.UsersDto;
import com.kh.maius.repository.UsersDao;

@Controller
public class UsersController {

	@Autowired
	private SqlSession SqlSession;
	
	
	@GetMapping("users/join")
	public String join() {		
		return "users/join";
	}
	
	
	@PostMapping("users/join")
	public String join(@ModelAttribute UsersDto usersDto){
		
//		UsersService.join(usersDto);
		
		int user_no = SqlSession.selectOne("users.getNo");
		usersDto.setUser_no(user_no);
		
		SqlSession.insert("users.join", usersDto);
		
		return "redirect:/";
	}
	
	@Autowired
	private UsersDao usersDao;
	
	//로그인
	@PostMapping("/login")
	public String login(@ModelAttribute UsersDto userdDto, HttpSession session,  Model model) {
		//입력된 아이디로 db에서 정보를 가져온다
		//맞으면 게시판목록으로
		//다르면 알림창 띄우기
		UsersDto find = usersDao.login(userdDto);
		System.out.println(find);
		if(find == null) {			//맞는 정보가 없다
			return "redirect:/?error=1";
		}
		else {
			session.setAttribute("user_id", find.getUser_id()); //세션에 찾아온 정보의 id를 저장함, 로그인 성공
			return "redirect:/board/list";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user_id");
		return "redirect:/";						//홈으로 이동
	}
}
