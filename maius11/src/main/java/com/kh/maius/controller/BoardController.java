package com.kh.maius.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.maius.entity.BoardDto;
import com.kh.maius.repository.BoardDao;
import com.kh.maius.service.BoardService;




@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Autowired
	private BoardService BoardService;
	
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("list", boardDao.getList());
		
		return "board/list";
	}
	
	
	@GetMapping("/regist")
	public String regist() {
		return "board/regist";
	}
	
	@PostMapping("/regist")
	public String regist(@ModelAttribute BoardDto boardDto,HttpSession session)  {		

		int user_no = (Integer)session.getAttribute("user_no");
		
		
		
		boardDto.setUser_no(user_no);

		int board_no=sqlSession.selectOne("board.getNo");
		
		boardDto.setBoard_no(board_no);
		sqlSession.insert("board.regist", boardDto);

//			int board_no = boardDto.getBoard_no();
		return "redirect:content?board_no="+board_no;			
	}
	
	
	
	
/////////////글 수정/////////
@GetMapping("/edit")
public String edit(@RequestParam int board_no,
							Model model) {


boardDao.get(board_no);
model.addAttribute("boardDto", boardDao.get(board_no));		

return "board/edit";
}

@PostMapping("/edit")
public String edit(@ModelAttribute BoardDto boardDto){

BoardService.edit(boardDto);

int no = boardDto.getBoard_no(); //게시글 번호 구해서 리다이렉트에 사용
return "redirect:content?board_no="+no;		
}
	
	
	
}
