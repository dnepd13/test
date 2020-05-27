package com.kh.maius.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.kh.maius.entity.BoardReplyDto;
import com.kh.maius.entity.BoardUserVO;
import com.kh.maius.entity.ReplyUserVO;
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
	public String detail(Model model,@RequestParam int board_no) {
		BoardUserVO vo = detailDao.detail(board_no);
		model.addAttribute("detail", vo);
		
		model.addAttribute("reply", replyDao.replyList(vo.getBoard_no()));
		
		detailDao.readcountup(board_no);
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
	
	@GetMapping("/replylist")
	@ResponseBody
	public ArrayList<HashMap> replylist(@ModelAttribute ReplyUserVO replyVO
			) {
		
		int board_no = replyVO.getBoard_no();
		
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
		List<ReplyUserVO> reply = replyDao.replyList(board_no);
		
		if(reply.size() > 0) {
			for(int i=0; i<reply.size(); i++){
				HashMap hm = new HashMap();
				hm.put("reply_no", reply.get(i).getReply_no());
				hm.put("user_name", reply.get(i).getUser_name());
				hm.put("reply_content", reply.get(i).getReply_content());
				hm.put("reply_wdate", reply.get(i).getReply_wdate());
				hm.put("user_no", reply.get(i).getUser_no());
				hm.put("board_no", reply.get(i).getBoard_no());
				hmlist.add(hm);
			}
		}
		
		return hmlist;
		
		
	}
	
	@RequestMapping("/replyedit")
	@ResponseBody
	public String replyedit(@ModelAttribute ReplyUserVO vo) {
		
		replyDao.replyUpdate(vo);
		
		return "success";
	}
	
	@RequestMapping("/replydel")
	@ResponseBody
	public String replydel(@ModelAttribute ReplyUserVO vo) {
		
		replyDao.replyDelete(vo);
		
		return "success";
	}
	
	
}
