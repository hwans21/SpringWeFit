package com.spring.wefit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/freeBoard")
public class FreeBoardController {
	@GetMapping("/list")
	public String freeBoardListView() {
		System.out.println("/freeBoard/list:GET");
		return "board/free/free_board";
	}
	@GetMapping("/writePage")
	public String freeBoardWriteView() {
		System.out.println("/freeBoard/writePage:GET");
		return "board/free/free_write";
	}
}
