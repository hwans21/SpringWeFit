package com.spring.wefit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.wefit.command.CourseBoardVO;
import com.spring.wefit.course.service.ICourseBoardService;

@Controller
@RequestMapping("/courseBoard")
public class CourseBoardController {
   
   @Autowired
   private ICourseBoardService service;
   
   
   @GetMapping("/")
   public String courseList(Model model) {
      
      model.addAttribute("courseList", service.getList());
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
      ra.addFlashAttribute("msg", "registSuccess");
      
      return "redirect:/courseBoard/";
   }
   
   
   @GetMapping("/detail")
   public String courseDetail(@RequestParam int cbNum, Model model) {
      
	  service.upHit(cbNum);
	  
	  CourseBoardVO vo = service.getContent(cbNum);
	  
	  //cbContent부분(textarea) 줄개행은 db에 \r\n으로 저장이 된다.
	  //그걸 <br>로 바꿔야 화면에 줄개행이되어서 출력이된다. (html은 줄개행이 <br>인가봄)
	  String newContent = vo.getCbContent().replace("\r\n","<br>");
	  vo.setCbContent(newContent);
	  
      model.addAttribute("article", vo);
      
      return "board/course/course_detail";
      
   }
   
   
   @GetMapping("/modify")
   public String courseModify(@RequestParam int cbNum, Model model) {
      
	  CourseBoardVO vo = service.getContent(cbNum);
  
      model.addAttribute("article2", vo);
      return "board/course/course_modify";
   }
   
   
   @PostMapping("/modify")
   public String courseModify(CourseBoardVO vo, RedirectAttributes ra) {
      
      System.out.println(vo);
      
      service.update(vo);
      ra.addFlashAttribute("msg", "modifySuccess");
      
      return "redirect:/courseBoard/detail?cbNum=" + vo.getCbNum();
   
   }
   
   @PostMapping("/delete")
   public String courseDelete(@RequestParam int cbNum, RedirectAttributes ra) {
      
      service.delete(cbNum);
      ra.addFlashAttribute("msg", "deleteSuccess");
      
      return "redirect:/courseBoard/";
   }
   

}