package com.spring.wefit.course.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.wefit.command.CourseBoardVO;
import com.spring.wefit.command.CourseReplyVO;
import com.spring.wefit.commons.PageVO;

public interface ICourseReplyMapper {
	
	//댓글 등록
	void regist(CourseReplyVO vo);
	
	//목록 요청
	List<CourseReplyVO> getList(@Param("vo") PageVO vo, @Param("cbNum") int cbNum);
	
	//댓글 개수
	int getTotal(int cbNum);
	
	//비밀번호 확인
	int pwCheck(CourseBoardVO vo);
	
	//댓글 수정
	void update(CourseReplyVO vo);
	
	//댓글 삭제
	void delete(int crNum);

}
