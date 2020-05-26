package com.kh.maius.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.maius.entity.BoardReplyDto;
import com.kh.maius.entity.BoardUserVO;
import com.kh.maius.repository.BoardDetailDao;
import com.kh.maius.repository.BoardReplyDao;

@Controller
@RequestMapping("/board")
public class BoardDetailController {
	
	@Autowired
	BoardDetailDao detailDao;
	
	@Autowired
	BoardReplyDao replyDao;
	
	@GetMapping("/detail")
	public String detail(Model model) {
		BoardUserVO vo = detailDao.detail();
		model.addAttribute("detail", vo);
		
		model.addAttribute("reply", replyDao.replyList(vo.getBoard_no()));
		
		detailDao.readcountup();
		return "board/detail";
	}
	
	@RequestMapping("/replyinsert")
	@ResponseBody
	public String ajax_replyInsert(
				@ModelAttribute BoardReplyDto replyDto,
				HttpSession session
			) {
		int user_no = (int)session.getAttribute("user_no");
		
		BoardReplyDto boardReplyDto = BoardReplyDto.builder().
				board_no(replyDto.getBoard_no()).
				user_no(user_no).
				reply_content(replyDto.getReply_content()).
				build();
		
		replyDao.replyInsert(boardReplyDto);
		
		return "success";
	}
}
