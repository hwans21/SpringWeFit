package com.spring.wefit.course.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.wefit.course.mapper.ICourseReportMapper;

@Service
public class CourseReportService implements ICourseReportService {

	@Autowired
	private ICourseReportMapper mapper;
}
