package com.spring.wefit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.wefit.command.CourseBoardVO;
import com.spring.wefit.command.CourseReportVO;
import com.spring.wefit.commons.PageCreator;
import com.spring.wefit.commons.PageVO;
import com.spring.wefit.course.service.ICourseBoardService;
import com.spring.wefit.course.service.ICourseReplyService;

@Controller
@RequestMapping("/courseBoard")
public class CourseBoardController {
   
   @Autowired
   private ICourseBoardService service;
   @Autowired
   private ICourseReplyService service2;
   
   
   @GetMapping("/")
   public String courseList(PageVO vo, Model model) {
	   
	  //여기서 setCounterPerPage를 사용해서 9로 바꿔주기.
	  vo.setCountPerPage(9);
	  
	   
	  PageCreator pc = new PageCreator();   
	  pc.setPaging(vo);
	   
	  pc.setArticleTotalCount(service.getTotal(vo));
	  model.addAttribute("pc", pc);   
	   
	  System.out.println(vo);
      model.addAttribute("courseList", service.getList(vo));

      return "board/course/course_board";
      
   }
   
   
   @GetMapping("/write")
   public String courseWrite() {
      return "board/course/course_write";
   }
   
   
   @PostMapping("/regist")
   public String courseRegist(CourseBoardVO vo, RedirectAttributes ra) {
      
      System.out.println(vo);
          
      service.regist(vo);
      ra.addFlashAttribute("msg", "게시글이 등록되었습니다.");
      
      return "redirect:/courseBoard/?category=";
   }
   
   
   @GetMapping("/detail")
   public String courseDetail(@RequestParam int cbNum, Model model) {
      
	  //조회수 올려줌
	  service.upHit(cbNum);
	  
	  
	  CourseBoardVO vo = service.getContent(cbNum);

	  
	  //cbContent부분(textarea) 줄개행은 db에 \r\n으로 저장이 된다.
	  //그걸 <br>로 바꿔야 화면에 줄개행이되어서 출력이된다. (html은 줄개행이 <br>인가봄)
	  
	  if(vo.getCbContent() != null) {
		  String newBrContent = vo.getCbContent().replace("\r\n","<br>");
		  vo.setCbContent(newBrContent);
	  }
	  
  
      model.addAttribute("article", vo);
      
      System.out.println(vo);
      
      
/*      
	  댓글 개수 출력 + model로 담기 
      (이 방식으로 안하고 replyController + detail.jsp에서 비동기처리로 함..
      왜냐면 글 등록 후 바로 댓글 개수가 올라가지않는다. 얘는 비동기처리가 아니기 때문에..새로고침해야 올라감)
*/      
//    model.addAttribute("total", service2.getTotal(cbNum));
//    System.out.println(service2.getTotal(cbNum));
           
      return "board/course/course_detail";
      
   }
   
   
   @GetMapping("/modify")
   public String courseModify(@RequestParam int cbNum, Model model) {
      
	  CourseBoardVO vo = service.getContent(cbNum);
  
      model.addAttribute("article2", vo);
      return "board/course/course_modify";
   }
   
   
   @PostMapping("/modify")
   public String courseModify(CourseBoardVO vo, PageVO page, RedirectAttributes ra) {
      
      System.out.println(vo);
      
      service.update(vo);
      ra.addFlashAttribute("msg", "수정이 완료되었습니다.");
      
      return "redirect:/courseBoard/detail?cbNum=" + vo.getCbNum() + "&pageNum=" + page.getPageNum() + "&category=" + page.getCategory() + "&condition=" + page.getCondition() + "&keyword=" + page.getKeyword();
   
   }
   
   @PostMapping("/delete")
   public String courseDelete(@RequestParam int cbNum, RedirectAttributes ra) {
      
      service.delete(cbNum);
      ra.addFlashAttribute("msg", "삭제가 완료되었습니다.");
      
      return "redirect:/courseBoard/?category=";
   }
   


   
   
   // 좋아요, 신고 비동기 처리
   
   @PostMapping("/like")
   @ResponseBody
   public String courseLike(@RequestBody CourseBoardVO vo) {
	   
	   System.out.println("글번호: " + vo.getCbNum());
	   System.out.println("좋아요 누른 유저번호: " + vo.getMemberNum());
	   
	   if(service.checkLike(vo) == 1) {
		   service.deleteLike(vo);
		   return "likeDelete";   
	   } else {
		   service.insertLike(vo);
		   return "likeSuccess"; 
	   }
	   
   }
   
   
   //좋아요 개수 출력
   @GetMapping("/{cbNum}")
   @ResponseBody
   public Map<String, Object> courseCountLike(@PathVariable int cbNum) {
	   
	   int count = service.countLike(cbNum);
	   
	   Map<String, Object> map = new HashMap<>();
	   map.put("count", count);
	   return map;
   }
   
   
   
   
   @PostMapping("/report")
   @ResponseBody							//신고 이유까지 처리안하면...변수가 courseBoardVO와 겹치기때문에 걍 courseBoardVO로 뜯어와도됨.
   public String courseReport(@RequestBody CourseReportVO vo) { //비동기로 값 가져올때 requestbody..
	   
	   System.out.println("글번호: " + vo.getCbNum());
	   System.out.println("신고한 유저번호: " + vo.getMemberNum());
	   
	   if(service.checkReport(vo) == 1) {		   
		   return "reportFail";
	   } else {   
		   service.insertReport(vo);
		   return "reportSuccess";
	   }
   
   }
   
   

}