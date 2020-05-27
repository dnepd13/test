package com.kh.maius.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.HashSet;
import java.util.Set;

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
import com.kh.maius.repository.BoardDao;
import com.kh.maius.repository.BoardDetailDao;
import com.kh.maius.repository.BoardReplyDao;
import com.kh.maius.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardDetailController {
	
	@Autowired
	BoardDetailDao detailDao;
	
	@Autowired
	BoardReplyDao replyDao;
	
	@Autowired
	BoardDao boardDao;
	
	@Autowired
	BoardService BoardService;
	
	@GetMapping("/detail")
	public String detail(Model model,@RequestParam int board_no,HttpServletRequest request,
			HttpSession session) {
		BoardUserVO vo = detailDao.detail(board_no);/////조인다시!!
		
		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(cal.YEAR);
		model.addAttribute("year", year);
		
		//추가 : 이미 읽은 글은 조회수 증가를 방지
		//[1] 세션에 있는 저장소를 꺼내고 없으면 신규 생성한다
		@SuppressWarnings("unchecked")
		Set<Integer> attribute = (Set<Integer>) session.getAttribute("memory");
		Set<Integer> memory = attribute;
		
		//memory가 없는 경우에는 null 값을 가진다
	if(memory == null){
			memory = new HashSet<>();	//세션에 저장소가 없으면 저장소를 1번 생성한다.
		}
		
//		String user_name = (String) session.getAttribute("user_name");
		String user_id = (String) session.getAttribute("user_id");
		
		
		
		if(user_id != null) {
//			System.out.println(memory);
			boolean isMine = user_id.equals(vo.getUser_id()); //사용자아이디 == 작성자아이디 라고 물어보는것
			boolean isFirst = memory.add(board_no); //배열에 조회한 글번호를 넣어서 처음 들어가면 true, 재조회라면 false임 

			//[3] 처리를 마치고 저장소를 다시 세션에 저장한다
			session.setAttribute("memory", memory); //세션에 저장소가 들어간다.

			//남의 글이라면 == !isMine  조회수를 증가시킨다.
			//처음읽는 글이라면 == isFirst
			if(!isMine && isFirst){		
				vo.setBoard_readcount(vo.getBoard_readcount()+1); //의도적으로 화면에 표시되는 조회수를 1 증가시킨다.
				BoardService.readCount(board_no);	//조회수 증가
			}
			model.addAttribute("detail", vo);	
		}
		else {
			model.addAttribute("detail", vo);
		}
		
		/* model.addAttribute("reply", replyDao.replyList(vo.getBoard_no())); */
		
//		detailDao.readcountup();
		
		return "board/detail";
	}
	
	@RequestMapping("/replyinsert")
	@ResponseBody
	public String ajax_replyInsert(
				@ModelAttribute BoardReplyDto replyDto,
				HttpSession session
			) {
		
		BoardReplyDto boardReplyDto = BoardReplyDto.builder().
				board_no(replyDto.getBoard_no()).
				user_no(replyDto.getUser_no()).
				reply_content(replyDto.getReply_content()).
				build();
		
		replyDao.replyInsert(boardReplyDto);
		
		//리플라이 증가
		boardDao.boardReplyCountUp(replyDto.getBoard_no());
		
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
				hm.put("user_birth", reply.get(i).getUser_birth());
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
		
		//리플라이 감소
		boardDao.boardReplyCountDown(vo.getBoard_no());
		
		return "success";
	}
	
	
}
