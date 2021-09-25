package com.spring.wefit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.wefit.command.DietBoardReplyVO;
import com.spring.wefit.command.DietBoardVO;
import com.spring.wefit.commons.PageCreator;
import com.spring.wefit.commons.PageVO;
import com.spring.wefit.diet.service.IDietBoardService;
import com.spring.wefit.diet.service.IDietReplyService;

@Controller
@RequestMapping("/dietBoard")
public class DietController {
	
	@Autowired
	private IDietBoardService service;

	
	//글 목록전체보기
	@GetMapping("/dietList") 
	public String dietList(Model model, PageVO vo) {
		System.out.println("/board/dietList: GET 글 목록 전체보기!!");
		
		PageCreator dpc = new PageCreator();
		vo.setCountPerPage(9);
		dpc.setPaging(vo);
		dpc.setArticleTotalCount(service.getTotal(vo));
		
		model.addAttribute("dietList", service.getList(vo));
		System.out.println();
		model.addAttribute("dpc", dpc);
		return "/board/diet/diet_board";
	}

	//글쓰기 화면 이동처리
	@GetMapping("/dietWrite")
	public String dietWrite() {
		System.out.println("/diet_Write 글쓰기 화면 이동!!");
		return "/board/diet/diet_write";
	}
	
	//글 등록
	@PostMapping("/dietWrite")
	public String dietWrite(MultipartHttpServletRequest request, DietBoardVO vo, RedirectAttributes ra) {
		System.out.println("/board/dietWrite: POST 등록하기!!");
		service.regist(vo);
		
		System.out.println("제목: " + request.getParameter("dbTitle"));
		System.out.println("내용: " + request.getParameter("dbContent"));
		
		ra.addFlashAttribute("msg", "게시물이 등록되었습니다.");
		return "redirect:/dietBoard/dietList";
	}
	
	//글 상세보기
	@GetMapping("/dietDetail")
	public String dietContent(@RequestParam int dbNum, Model model) {
		System.out.println("/board/dietDatail: GET 상세보기!!");
		System.out.println("요청된 글 번호: " + dbNum);
		model.addAttribute("dietList", service.getContent(dbNum));
		return "/board/diet/diet_detail";
	}
	
	//글 수정화면 요청
	@GetMapping("/dietModify")
	public String dietModify(@RequestParam int dbNum, Model model) {
		System.out.println("/board/diet/diet_modify: GET 글 수정목록 요청!");
		model.addAttribute("dietList", service.getContent(dbNum));
		System.out.println("수정할 글 번호: " + dbNum);
		return "/board/diet/diet_modify";
	}
	
	//글 수정하기
	@PostMapping("/dietModify")
	public String dietModify(MultipartHttpServletRequest request, DietBoardVO vo, RedirectAttributes ra) {
		System.out.println("수정할 내용: " + vo);
		service.update(vo);
		
		ra.addFlashAttribute("msg", "updateSuccess");
		System.out.println("board/diet/diet_modify: POST 글 수정 요청!");
		
		return "redirect:/dietBoard/dietDetail?dbNum=" + vo.getDbNum();
	}
	
	//글 삭제하기
	@PostMapping("/dietDelete")
	public String dietDelete(DietBoardVO vo, RedirectAttributes ra) {
		service.delete(vo.getDbNum());
		ra.addFlashAttribute("msg", "게시글이 정상 삭제되었습니다.");
		System.out.println("삭제완료");
		return "redirect:/dietBoard/dietList";
	}
	
	//좋아요 처리
	@PostMapping("/dietLikely")
	@ResponseBody
	public String dietBoardLikely(@RequestBody DietBoardVO vo) {
		System.out.println("글 번호:"+vo.getDbNum());
		System.out.println("유저 번호"+vo.getMemberNum());
		if(service.checkLovely(vo) == 1) {
			return "duplicate";
		}else {
			service.insertLovely(vo);
			return "success";
		}
	}
	
	//신고 처리하기
	@PostMapping("/dietReport")
	@ResponseBody
	public String dietBoardReport(@RequestBody DietBoardVO vo) {
		if(service.checkReport(vo) == 1) {
			return "duplicate";
		} else {
			service.insertReport(vo);
			return "success";
		}
	}
	
	
	
	//다중 사진 업로드
	//@PostMapping("/upload")
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
