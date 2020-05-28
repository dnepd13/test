package com.kh.maius.controller;



import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.maius.entity.UsersDto;
import com.kh.maius.repository.UsersDao;


@Controller
public class IndexController {
	
	@Autowired
	UsersDao userDao;
	
	@GetMapping("/")
	public String index() {		
		return "index";
	}
	
	@RequestMapping("/getname")
	@ResponseBody
	public ArrayList<HashMap> name(@ModelAttribute UsersDto dto) {
		
		int user_no = dto.getUser_no();
		
		String name = userDao.getName(user_no);
		
		HashMap hm = new HashMap();
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
		hm.put("user_name", name);
		hmlist.add(hm);
		return hmlist;
	}
}
