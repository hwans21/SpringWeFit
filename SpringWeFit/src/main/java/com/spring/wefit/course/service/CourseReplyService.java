package com.spring.wefit.course.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.wefit.command.CourseBoardVO;
import com.spring.wefit.command.CourseReplyVO;
import com.spring.wefit.commons.PageVO;
import com.spring.wefit.course.mapper.ICourseReplyMapper;

@Service
public class CourseReplyService implements ICourseReplyService {
	
	@Autowired
	private ICourseReplyMapper mapper;

	@Override
	public void regist(CourseReplyVO vo) {
		mapper.regist(vo);		
	}

	@Override
	public List<CourseReplyVO> getList(@Param("vo") PageVO vo, @Param("cbNum") int cbNum) {
		return mapper.getList(vo, cbNum);
	}

	@Override
	public int getTotal(int cbNum) {
		return mapper.getTotal(cbNum);
	}

	@Override
	public int pwCheck(CourseBoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void update(CourseReplyVO vo) {
		mapper.update(vo);		
	}

	@Override
	public void delete(int crNum) {
		mapper.delete(crNum);		
	}

}
