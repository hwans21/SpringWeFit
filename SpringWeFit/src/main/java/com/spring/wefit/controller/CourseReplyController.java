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
import com.spring.wefit.commons.PageVO;
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
	
	@GetMapping("/{cbNum}/{pageNum}") //pathVariable 뭔지 생각안남..
	public Map<String, Object> replyList(@PathVariable String cbNum, @PathVariable String pageNum) {
		
		System.out.println(cbNum);
		System.out.println(pageNum);
		
		int bNum=Integer.parseInt(cbNum);
		int pNum=Integer.parseInt(pageNum);
		
		
		//페이징 처리
		PageVO vo = new PageVO();
		vo.setPageNum(pNum);
		vo.setCountPerPage(10);
		
		List<CourseReplyVO> list = service.getList(vo, bNum);	
		int total = service.getTotal(bNum); //해당 글의 총 댓글 개수!! (CourseReply 테이블에서 조회함)		
		//service2.updateCrCount(cbNum, total); //CourseBoard테이블 update시키기.(= CourseBoard테이블에 해당 글의 댓글개수(crCount 컬럼) 저장함)--> CourseBoard 테이블에 crCount컬럼 지움. 그러고 mapper에서 getList할 때 SELECT COUNT(*) FROM CourseReply...이런식으로 해서 댓글개수 가져옴)
		
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
	public String replyDelete(@RequestBody CourseReplyVO vo) {
		
		if(service.memberCheck(vo) == 1) {
			service.delete(vo.getCrNum());
			return "deleteSuccess";
		} else {
			return "noAuth";
		}
		
	}
	
	

}
