package com.spring.wefit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.wefit.command.NoticeBoardVO;
import com.spring.wefit.commons.PageCreator;
import com.spring.wefit.commons.PageVO;
import com.spring.wefit.noticeboard.service.INoticeBoardService;

@Controller
@RequestMapping("/noticeBoard")
public class NoticeBoardController {
	
	@Autowired
	private INoticeBoardService service;
	
	 @GetMapping("/")
	   public String noticeList(Model model, PageVO vo) {
	      
	      model.addAttribute("noticeList", service.getList(vo));
	      return "board/notice/notice_board";
	      
	   }
	//글쓰기 화면 이동처리
	@GetMapping("/noticeWrite")
	public String noticeWrite() {
		System.out.println("/notice_Write 글쓰기 화면 이동!!");
		return "/board/notice/notice_write";
	}
	
	//글 등록
	@PostMapping("/noticeWrite")
	public String noticeWrite(MultipartHttpServletRequest request, NoticeBoardVO vo, RedirectAttributes ra) {
		System.out.println("/board/noticeWrite: POST 등록하기!!");
		service.regist(vo);
		
		System.out.println("제목: " + request.getParameter("nbTitle"));
		System.out.println("내용: " + request.getParameter("nbContent"));
		
		ra.addFlashAttribute("msg", "게시물이 등록되었습니다.");
		return "redirect:/noticeBoard/noticeList";
	}
	
	//글 상세
	@GetMapping("/noticeDetail")
	public String noticeContent(@RequestParam int nbNum, Model model) {
		System.out.println("/board/noticeDatail: GET 상세보기!!");
		System.out.println("요청된 글 번호: " + nbNum);
//		model.addAttribute("noticeList", service.getList(nbNum));
		return "/board/notice/notice_detail";
	}
	
	//글 수정화면 요청
	@GetMapping("/noticeModify")
	public String dietModify(@RequestParam int nbNum, Model model) {
		System.out.println("/board/notice/notice_modify: GET 글 수정목록 요청!");
//		model.addAttribute("noticeList", service.getList(nbNum));
		System.out.println("수정할 글 번호: " + nbNum);
		return "/board/notice/notice_modify";
	}
	
	//글 수정
	@PostMapping("/noticeModify")
	public String noticeModify(MultipartHttpServletRequest request, NoticeBoardVO vo, RedirectAttributes ra) {
		System.out.println("수정할 내용: " + vo);
		service.update(vo);
		
		ra.addFlashAttribute("msg", "updateSuccess");
		System.out.println("board/notice/notice_modify: POST 글 수정 요청!");
		
		return "redirect:/noticeBoard/noticeDetail?nbNum=" + vo.getNbNum();
	}
	
	//글 삭제
	@PostMapping("/noticeDelete")
	public String dietDelete(NoticeBoardVO vo, RedirectAttributes ra) {
		service.delete(vo.getNbNum());
		ra.addFlashAttribute("msg", "게시글이 정상 삭제되었습니다.");
		System.out.println("삭제완료");
		return "redirect:/noticeBoard/noticeList";
	}
}