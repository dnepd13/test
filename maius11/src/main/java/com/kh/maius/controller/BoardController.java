package com.kh.maius.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.maius.entity.BoardDto;
import com.kh.maius.repository.BoardDao;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private BoardDto boardDto;
	
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("list", boardDao.getList());
		List<BoardDto> board_list = new ArrayList<>();
		List<BoardDto> dto = boardDao.getList();
		for(int i = 0; i < dto.size(); i ++) {
			int user_no = dto.get(i).getUser_no();
			 
		}
		
		return "board/list";
	}
}
