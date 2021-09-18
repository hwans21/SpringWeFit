package com.spring.wefit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.wefit.command.marketBoardVO;
import com.spring.wefit.market.service.IMarketBoardService;

@Controller
@RequestMapping("/marketBoard")
public class marketBoardController {

	@Autowired
	private IMarketBoardService service;

	// 장터 게시판으로
	@GetMapping("/market_board")
	public String marketList(marketBoardVO vo, Model model) {

		List<marketBoardVO> list = service.getList();
		model.addAttribute("product", list);

		return "/board/market/market_board";
	}

	// 글 등록페이지로
	@GetMapping("/market_write")
	public String market_write() {
		return "/board/market/market_write";
	}

	@PostMapping("/regist")
	public String regist(marketBoardVO vo, RedirectAttributes ra) {

		service.regist(vo);

		return "redirect:/marketBoard/market_board";
	}



	@GetMapping("/market_detail")
	public String detail(@RequestParam int mbNum, Model model,
					   @ModelAttribute("p") marketBoardVO vo) {

		model.addAttribute("detail",service.getContent(mbNum));

		return "/board/market/market_detail";
	}
	
	@GetMapping("/modify")
	public String modify(@RequestParam int mbNum, Model model) {
		model.addAttribute("content", service.getContent(mbNum));
		return "/board/market/market_modify";
	}

}
