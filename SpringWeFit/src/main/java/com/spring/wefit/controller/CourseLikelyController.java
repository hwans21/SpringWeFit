package com.spring.wefit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.wefit.course.service.ICourseLikelyService;

@Controller
@RequestMapping("/courseLikely")
public class CourseLikelyController {
	
	@Autowired
	private ICourseLikelyService service;

}
