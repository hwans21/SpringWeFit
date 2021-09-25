package com.spring.wefit.controller;

import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.wefit.command.PlaceBoardVO;
import com.spring.wefit.commons.PageVO;
import com.spring.wefit.placeboard.service.IPlaceBoardService;

@Controller
@RequestMapping("/placeBoard")
public class PlaceBoardController {

	@Autowired 
	private IPlaceBoardService service;
	

	//장소 목록 페이지 이동
		@GetMapping("/placeList")
		public String placeList(PageVO vo, Model model) {
			System.out.println("/placeBoard/placeList: GET");
			List<PlaceBoardVO> list = service.getList(vo);
			System.out.println(list);
			model.addAttribute("placeList", list);
			return "board/location/loc_board";
			
			
			// 페이지 버튼 계산하기
			// 총 게시물 개수
			// 게시글 리스트 뽑기
			// jsp에 전달할 값들
		}
	

	//장소 글쓰기 페이지 이동
	@GetMapping("/placeWrite")
	public String placeWrite() {
		System.out.println("/placeBoard/placeWrite: GET");
		return "board/location/loc_write";
	}
	
	
	//장소 글 등록 처리 >> 이미지 업로드 수정
		@PostMapping("/placeWrite")
		public String placeWrite(MultipartHttpServletRequest request, PlaceBoardVO vo, RedirectAttributes ra) {
			System.out.println("/placeBoard/placeWrite: POST");
			System.out.println("제목: " + request.getParameter("pbTitle"));
			System.out.println("내용: " + request.getParameter("pbContent"));
			System.out.println("카테고리: " + request.getParameter("pbCategory"));
			service.regist(vo);
			ra.addFlashAttribute("msg", "정상 등록 처리되었습니다.");
				
			return "redirect:/placeBoard/placeList"; //등록 후에 글 목록 요청으로 리다이렉트
		}

		
	//장소 글 상세 페이지 이동 
	@GetMapping("/placeDetail")
	public String placeContent(@RequestParam int pbNum, Model model) {
		
		System.out.println("/placeBoard/placeContent: GET");
		System.out.println("요청된 글 번호: " + pbNum);
		model.addAttribute("placeList", service.getContent(pbNum));
		
		service.upHit(pbNum);
		
		return "board/location/loc_detail";
	}
		
			
	//장소 수정 페이지 이동
	@GetMapping("/placeModify")
	public String placeModify(int pbNum, Model model) {
		System.out.println("수정 요청이 들어옴!");
		System.out.println("/placeBoard/placeModify: GET");
		System.out.println("수정 요청된 글 번호: " + pbNum);
		model.addAttribute("placeList", service.getContent(pbNum));
		
		return "board/location/loc_modify";
	}
	

	//장소 글 수정 처리 
	@PostMapping("/placeModify")
	public String placeUpdate(MultipartHttpServletRequest request, PlaceBoardVO vo, RedirectAttributes ra) {
		System.out.println("/placeBoard/placeUpdate: POST");
			
		service.update(vo);
		ra.addFlashAttribute("msg", "정상 수정 처리되었습니다.");
				
		return "redirect:/placeBoard/placeDetail?pbNum=" + vo.getPbNum();
	}
		

	//장소 글 삭제 처리
	@PostMapping("/placeDelete")
	public String placeDelete(PlaceBoardVO vo, RedirectAttributes ra) {
		System.out.println("/placeBoard/placeDelete: POST");
		service.delete(vo.getPbNum());
		ra.addFlashAttribute("msg", "게시글이 정상 삭제되었습니다.");
		
		return "redirect:/placeBoard/placeList";
	}
		
			
	//장소 글 좋아요 처리
	@PostMapping("/placeLikely")
	@ResponseBody
	public String freeBoardLikely(@RequestBody PlaceBoardVO vo) {
		System.out.println("글 번호:"+vo.getPbNum());
		System.out.println("유저 번호"+vo.getMemberNum());
		if(service.checkLovely(vo) == 1) {
			return "duplicate";
		} else {
			service.insertLovely(vo);
			return "success";
		}
	}
		
	
	//장소 글 신고 처리하기
	@PostMapping("/placeReport")
	@ResponseBody
	public String freeBoardReport(@RequestBody PlaceBoardVO vo) {
		System.out.println("글 번호:"+vo.getPbNum());
		System.out.println("유저 번호"+vo.getMemberNum());
		if(service.checkReport(vo) == 1) {
			return "duplicate";
		} else {
			service.insertReport(vo);
			return "success";
		}
	}
		
	
	
}
