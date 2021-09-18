package com.spring.wefit.course.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.wefit.course.mapper.ICourseReplyMapper;

@Service
public class CourseReplyService implements ICourseReplyService {
	
	@Autowired
	private ICourseReplyMapper mapper;

}
