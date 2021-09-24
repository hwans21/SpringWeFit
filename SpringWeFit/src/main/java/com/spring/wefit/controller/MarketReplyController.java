package com.spring.wefit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.wefit.command.MarketReplyVO;
import com.spring.wefit.commons.PageVO;
import com.spring.wefit.market.service.IMarketReplyService;
import com.spring.wefit.market.service.MarketReplyService;

@RestController
@RequestMapping("/marketReply")
public class MarketReplyController {
	
	@Autowired
	private IMarketReplyService service;
	
	//댓글 등록
	@PostMapping("/regist")
	public String regist(@RequestBody MarketReplyVO vo) {
		service.replyRegist(vo);
		
		return "regSuccess";
	}
	
	@GetMapping("/marketReplyList/{mbNum}/{pageNum}")
	public Map<String, Object> marketReplyList(@PathVariable int mbNum, @PathVariable int pageNum){
		PageVO vo = new PageVO();
		vo.setPageNum(pageNum);
		vo.setCountPerPage(10);
		
		List<MarketReplyVO> list = service.getList(vo, mbNum); 
		int total = service.getTotal(mbNum); // 댓글 개수
		Map<String, Object> map = new HashMap<>();
		map.put("list",list);
		map.put("total",total);
		
		return map;
	}
	
	@GetMapping("/marketReplyCount")
	public String marketReplyCount(HttpServletRequest request) {
		int mbNum = Integer.parseInt(request.getParameter("mbNum"));
		return Integer.toString(service.getTotal(mbNum));
	}
	
	

}
