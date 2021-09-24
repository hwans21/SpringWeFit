package com.spring.wefit.course.service;

import java.util.List;

import com.spring.wefit.command.CourseBoardVO;
import com.spring.wefit.command.CourseReplyVO;

public interface ICourseReplyService {
	
	//댓글 등록
	void regist(CourseReplyVO vo);
	
	//목록 요청
	List<CourseReplyVO> getList(int cbNum);
	
	//댓글 개수
	int getTotal(int cbNum);
	
	//비밀번호 확인
	int pwCheck(CourseBoardVO vo);
	
	//댓글 수정
	void update(CourseReplyVO vo);
	
	//댓글 삭제
	void delete(int crNum);	

}
