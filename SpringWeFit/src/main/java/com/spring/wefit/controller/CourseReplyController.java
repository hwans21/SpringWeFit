package com.spring.wefit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.wefit.command.CourseReplyVO;
import com.spring.wefit.command.UserVO;
import com.spring.wefit.course.service.ICourseBoardService;
import com.spring.wefit.course.service.ICourseReplyService;

@RestController
@RequestMapping("/courseReply")
public class CourseReplyController {
	
	@Autowired
	private ICourseReplyService service;
	@Autowired
	private ICourseBoardService service2;
	
	
	@PostMapping("/regist")
	public String replyRegist(@RequestBody CourseReplyVO vo) {
		
		System.out.println(vo);
		service.regist(vo);
		return "registSuccess";
	
	}
	
	@GetMapping("/{cbNum}") //pathVariable 뭔지 생각안남..
	public Map<String, Object> replyList(@PathVariable int cbNum) {
				
		List<CourseReplyVO> list = service.getList(cbNum);	
		int total = service.getTotal(cbNum); //해당 글의 총 댓글 개수!! (CourseReply 테이블에서 조회함)		
		service2.updateCrCount(cbNum, total); //CourseBoard테이블 update시키기.(= CourseBoard테이블에 해당 글의 댓글개수(crCount 컬럼) 저장함)
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("total", total);
		
		System.out.println(map);
		
		return map;
	}
	
	
	@PostMapping("/modify")
	public String replyModify(@RequestBody CourseReplyVO vo) {
		
		service.update(vo);		
		return "modifySuccess";
	
	}
	
	

	@PostMapping("/delete")
	public String replyDelete(@RequestBody int crNum) {
		
		service.delete(crNum);
		return "deleteSuccess";
	
	}
	
	

}
