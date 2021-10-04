package com.spring.wefit.noticeboard.mapper;

import java.util.List;

import com.spring.wefit.command.NoticeBoardVO;
import com.spring.wefit.commons.PageVO;


public interface INoticeBoardMapper {
	
	//공지 글 등록
	void regist(NoticeBoardVO vo);
	
	//공지 글 목록
	List<NoticeBoardVO> getList(PageVO vo);
	
	//공지글 상세
	NoticeBoardVO getContent(int nbNum);
	
	//공지 글 수정
	void update(NoticeBoardVO vo);
	
	//공지 글 삭제
	void delete (int nbNum);
	
	//공지 총 게시글 수
	int getTotal(PageVO vo);
	
	//조회수 수정
	void updateViewCount(int nbNum);
		
	//좋아요 여부체크
	int checkLovely(NoticeBoardVO vo);
		
	//좋아요테이블 처리
	void insertLovely(NoticeBoardVO vo);
		
	//신고 여부 확인
	int checkReport(NoticeBoardVO vo);
		
	//신고 처리
	void insertReport(NoticeBoardVO vo);
	
	
	
}