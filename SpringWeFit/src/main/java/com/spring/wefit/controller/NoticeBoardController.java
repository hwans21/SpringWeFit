package com.spring.wefit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.wefit.command.NoticeBoardVO;
import com.spring.wefit.command.NoticeReplyVO;
import com.spring.wefit.commons.PageCreator;
import com.spring.wefit.commons.PageVO;
import com.spring.wefit.noticeboard.service.INoticeBoardService;
import com.spring.wefit.noticeboard.service.INoticeReplyService;

@Controller
@RequestMapping("/noticeBoard")
public class NoticeBoardController<CustomFileUpload> {
	
	@Autowired
	private INoticeBoardService service;
	
	@Autowired
	private INoticeReplyService replyService;
	
	
	//목록 페이지 이동
		@GetMapping("/") 
		public String noticeBoardListPage(Model model, PageVO vo) {
			System.out.println("/noticeBoard/:GET");
			
			// 페이지 버튼 계산하기
			PageCreator pc = new PageCreator();
			pc.setPaging(vo);
			pc.setArticleTotalCount(service.getTotal(vo));
			vo.setCountPerPage(20);
			
			
			// 총 게시물 개수
			int contentTotal = service.getTotal(vo);
			System.out.println("총 게시글 수 : "+contentTotal );
			
			// 게시글 리스트 뽑기
			List<NoticeBoardVO> list = service.getList(vo);
			
			//jsp에 전달할 값들
			model.addAttribute("noticeList", list);
			model.addAttribute("page",pc.getPaging());
			model.addAttribute("pc",pc);	
			
			
			return "board/notice/notice_board";
		}
	///////////////////////////////////////////////////////////	
		
	//글쓰기 화면 이동처리
	@GetMapping("/noticeWrite")
	public String noticeWritePage() {
		System.out.println("/notice_Write 글쓰기 화면 이동!!");
		return "/board/notice/notice_write";
	}
	////////////////////////////////////////
	//글 등록
//	@PostMapping("/freeWrite")
//	public String freeBoardWrite(MultipartFile[] fileName, HttpServletRequest request, NoticeBoardVO vo, RedirectAttributes ra) {
//	
//		CustomFileUpload fileUp = new CustomFileUpload();
//		String rootPath = request.getServletContext().getRealPath(""); 
//		rootPath = rootPath + "resources\\..\\..\\..\\upload\\board\\notice\\"+vo.getMemberNick()+"\\"; 
//		List<String> fileNameList = ((Object) fileUp).fileUpload(fileName, 1, rootPath);
//		
//		// 파일이름 받기
//		vo.setNbImage1(fileNameList.get(0));
//		vo.setNbRealImage1(fileNameList.get(1));
//		
//		System.out.println(vo.toString());
//		service.regist(vo);
//		
//		ra.addFlashAttribute("msg","정상 등록 되었습니다.");
//		return "redirect:/noticeBoard/?pageNum=1";
//	}
	//////////////////////////////////////////////////////
	//글 상세
//	@GetMapping("/noticeDetail")
//	public String noticeContent(@RequestParam int nbNum, PageVO page, Model model) {
//		System.out.println("/board/noticeDatail: GET 상세보기!!");
//		System.out.println("요청된 글 번호: " + nbNum);
//		model.addAttribute("noticeList", service.getList(nbNum));
//		model.addAttribute("pc", page);
//		return "/board/notice/notice_detail";
//	}
//	////////////////////////////////////////
//	//글 수정화면 요청
//	@GetMapping("/noticeModify")
//	public String dietModifyPage(@RequestParam int nbNum, PageVO page, Model model) {
//		System.out.println("/board/notice/notice_modify: GET 글 수정목록 요청!");
//		model.addAttribute("noticeList", service.getList(nbNum));
//		model.addAttribute("pc", page);
//		System.out.println("수정할 글 번호: " + nbNum);
//		
//		return "/board/notice/notice_modify";
//	}
	////////////////////////////////////
	//글 수정
//	@PostMapping("/noticeModify")
//	public String freeBoardModify(MultipartFile[] fileName, HttpServletRequest request, NoticeBoardVO vo, RedirectAttributes ra) {
//		System.out.println("/noticeBoard/noticeModify: POST");
//		
//		
//		CustomFileUpload fileUp = new CustomFileUpload();
//		String rootPath = request.getServletContext().getRealPath(""); 
//		rootPath = rootPath + "resources\\..\\..\\..\\upload\\board\\notice\\"+vo.getMemberNick()+"\\"; 
//		
//		NoticeBoardVO origin = service.getContent(vo.getNbNum());
//		
//		if(origin.getNbRealImage1() != null) {
//			fileUp.delete(origin.getNbRealImage1(), rootPath);
//			System.out.println(origin.getNbRealImage1()+"삭제 완료");
//		}
//		
//		
//		List<String> fileNameList = fileUp.fileUpload(fileName, 1, rootPath);
//		
//		// 파일이름 받기
//		vo.setNbImage1(fileNameList.get(0));
//		vo.setNbRealImage1(fileNameList.get(1));
//		
//		
//		service.update(vo);
//		
//		ra.addFlashAttribute("msg", "수정 완료되었습니다.");
//		return "redirect:/noticeBoard/noticeDetail?nbNum="+vo.getNbNum();
//	}
//	////////////////////////////////////////
//	//글 삭제
//	@PostMapping("/noticeDelete")
//	public String noticeDelete(NoticeBoardVO vo, RedirectAttributes ra) {
//		service.delete(vo.getNbNum());
//		ra.addFlashAttribute("msg", "게시글이 정상 삭제되었습니다.");
//		System.out.println("삭제완료");
//		return "redirect:/noticeBoard/noticeList";
//	}
//	/////////////////////////////////////
//	// 글 좋아요 처리하기
//		@PostMapping("/noticeLikely")
//		@ResponseBody
//		public String noticeBoardLikely(@RequestBody NoticeBoardVO vo) {
//			System.out.println("글 번호:"+vo.getNbNum());
//			System.out.println("유저 번호"+vo.getMemberNum());
//			if(service.checkLovely(vo) == 1) {
//				return "duplicate";
//			} else {
//				service.insertLovely(vo);
//				return "success";
//			}
//		}
		
		// 글 신고 처리하기
		@PostMapping("/noticeReport")
		@ResponseBody
		public String freeBoardReport(@RequestBody NoticeBoardVO vo) {
			System.out.println("글 번호:"+vo.getNbNum());
			System.out.println("유저 번호"+vo.getMemberNum());
			if(service.checkReport(vo) == 1) {
				return "duplicate";
			} else {
				service.insertReport(vo);
				return "success";
			}
		}


//		//댓글 등록
//		@PostMapping("/noticeReplyRegist")
//		@ResponseBody
//		public String noticeReplyRegist(@RequestBody NoticeReplyVO vo) {
//			System.out.println(vo.toString());
//			replyService.regist(vo);
//			return "success";
//		}
//		//댓글 목록
//		@GetMapping("/noticeReplyList/{nbNum}/{pageNum}")
//		@ResponseBody
//		public Map<String, Object> noticeReplyList(@PathVariable int nbNum, @PathVariable int pageNum){
//			PageVO vo = new PageVO();
//			vo.setPageNum(pageNum);
//			vo.setCountPerPage(10);
//			
//				List<NoticeReplyVO> list = replyService.getList(vo, nbNum); 
//				int total = replyService.getTotal(nbNum); // 댓글 개수
//			Map<String, Object> map = new HashMap<>();
//			map.put("list",list);
//			map.put("total",total);
//			
//			
//			
//			
//			return map;
//		}
		
//		//댓글 수정
//		@PostMapping("/noticeReplyModify")
//		@ResponseBody
//		public String noticeReplyModify(@RequestBody Map<String, Object> map) {
//			System.out.println(map.get("memberNum").getClass().getName());
//			System.out.println(map.get("noticeContent").getClass().getName());
//			System.out.println(map.get("noticeNum").getClass().getName());
//			int memberNum = (int) map.get("memberNum");
//			String noticeContent = (String) map.get("noticeContent");
//			int noticeNum = Integer.parseInt(((String) map.get("noticeNum")).substring(11));
//			
//			if(replyService.getContent(noticeNum).getMemberNum() == memberNum) {
//				NoticeReplyVO vo = new NoticeReplyVO();
//				vo.setNoticeContent(noticeContent);
//				vo.setNoticeNum(noticeNum);
//				replyService.update(vo);
//				return "success";
//			}
//			
//			return "noAuth";
//		}
//		
//		//댓글 삭제
//		@PostMapping("/noticeReplyDelete")
//		@ResponseBody
//		public String noticeReplyDelete(@RequestBody Map<String, Object> map) {
//			
//			int memberNum = (int) map.get("memberNum");
//			int noticeNum = Integer.parseInt(((String) map.get("noticeNum")).substring(11));
//			
//			if(replyService.getContent(noticeNum).getMemberNum() == memberNum) {
//				replyService.delete(noticeNum);
//				return "success";
//			}
//			
//			return "noAuth";
//		}
	}
