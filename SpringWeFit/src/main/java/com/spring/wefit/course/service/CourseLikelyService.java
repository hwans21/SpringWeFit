package com.spring.wefit.course.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.wefit.course.mapper.ICourseLikelyMapper;

@Service
public class CourseLikelyService implements ICourseLikelyService {
	
	@Autowired
	private ICourseLikelyMapper mapper;

}
