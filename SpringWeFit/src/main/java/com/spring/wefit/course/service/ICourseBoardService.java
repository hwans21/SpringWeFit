package com.spring.wefit.course.service;

import java.util.List;

import com.spring.wefit.command.CourseBoardVO;

public interface ICourseBoardService {
   
   //글 등록
   void regist(CourseBoardVO vo);
   
   //글 목록
   List<CourseBoardVO> getList();
   
   //총 게시물 수
   int getTotal();
   
   //상세보기
   CourseBoardVO getContent(int cbNum);
   
   //수정
   void update(CourseBoardVO vo);
   
   //삭제   
   void delete(int cbNum);
   
   //조회수를 올려주는 메서드
   void upHit(int cbNum);
   
   //좋아요를 올려주는 메서드
   void upLike(int cbNum);
   
}