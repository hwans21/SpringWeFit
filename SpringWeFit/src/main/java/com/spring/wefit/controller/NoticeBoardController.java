package com.spring.wefit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/noticeBoard")
public class NoticeBoardController {
	
	@GetMapping("/")
	public String noticeBoardList(Model model) {
		
		return "board/notice/notice_board";
	}
}
