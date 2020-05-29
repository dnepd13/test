package com.kh.maius.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.kh.maius.entity.BoardUserVO;
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
	
	
////////////////////전체 목록 조회///////////////////
	@GetMapping("/list")
	public String list(Model model,HttpServletRequest request) {
		
		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(cal.YEAR);
		model.addAttribute("year", year);
		
		//페이지 크기
		int pagesize = 10;
		//네비게이터 크기
		int navsize = 5;
		
		//페이징 추가
		int pno;
		try{
			pno = Integer.parseInt(request.getParameter("pno"));
			if(pno <= 0) throw new Exception(); //음수를 입력하면 예외를 발생시킨다
		}
		catch(Exception e){
			pno = 1;
		}
			
		int finish = pno * pagesize;
		int start = finish - (pagesize - 1);			
	//**************************************************************************************
	//			 		하단 네비게이터 계산하기
	//					- 시작블록 = (현재페이지-1) / 네비게이터크기 * 네비게이터크기 +1	
	//**************************************************************************************
		int count = boardDao.boardCount(); //전체글 개수를 구하는 메소드 
		
		int pagecount = (count + pagesize) / pagesize; //전체 페이지 수
		
		int startBlock = (pno -1) / navsize * navsize + 1;
		int finishBlock = startBlock + (navsize -1);
		
		//만약 마지막 블록이 페이지 수보다 크다면 수정 처리
		if(finishBlock > pagecount){
			finishBlock = pagecount;
		}
		
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("finish", finish);
		
		model.addAttribute("list", boardDao.getList(param));
		
		request.setAttribute("pno", pno);
		request.setAttribute("count", count);
		request.setAttribute("pagesize", pagesize);
		request.setAttribute("navsize", navsize);
		
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
		return "redirect:detail?board_no="+board_no;			
	}
	
	
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
return "redirect:detail?board_no="+no;		
}




///////////////글 삭제/////////////
@GetMapping("/delete")
public String delete(@RequestParam int board_no) {


//DB에서 게시글 삭제
boardDao.delete(board_no); 			

return "redirect:list";
}	


////////////////////게시글검색///////////////////
@GetMapping("/search")
public String search(
		@RequestParam(required = false) String type,//
		@RequestParam(required = false) String keyword,//
		Model model,HttpServletRequest request) {

Calendar cal = Calendar.getInstance();

int year = cal.get(cal.YEAR);
model.addAttribute("year", year);

//페이지 크기
int pagesize = 10;
//네비게이터 크기
int navsize = 5;

//페이징 추가
int pno;
try{
pno = Integer.parseInt(request.getParameter("pno"));
if(pno <= 0) throw new Exception(); //음수를 입력하면 예외를 발생시킨다
}
catch(Exception e){
pno = 1;
}

int finish = pno * pagesize;
int start = finish - (pagesize - 1);			
//**************************************************************************************
//			 		하단 네비게이터 계산하기
//					- 시작블록 = (현재페이지-1) / 네비게이터크기 * 네비게이터크기 +1	
//**************************************************************************************




Map<String, String> param = new HashMap<>();
param.put("start", String.valueOf(start));
param.put("finish", String.valueOf(finish));
param.put("type", type);
param.put("keyword", keyword);


int count = boardDao.boardSearchCount(param); //검색결과 전체글 개수를 구하는 메소드

int pagecount = (count + pagesize) / pagesize; //전체 페이지 수

int startBlock = (pno -1) / navsize * navsize + 1;
int finishBlock = startBlock + (navsize -1);

//만약 마지막 블록이 페이지 수보다 크다면 수정 처리
if(finishBlock > pagecount){
	finishBlock = pagecount;
}

model.addAttribute("search", BoardService.search(param));

request.setAttribute("pno", pno);
request.setAttribute("count", count);
request.setAttribute("pagesize", pagesize);
request.setAttribute("navsize", navsize);
request.setAttribute("type", type);
request.setAttribute("keyword", keyword);
return "board/search";


}



}
