package com.spring.wefit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.wefit.course.service.ICourseReplyService;

@Controller
@RequestMapping("/courseReply")
public class CourseReplyController {
	
	@Autowired
	private ICourseReplyService service;

}
