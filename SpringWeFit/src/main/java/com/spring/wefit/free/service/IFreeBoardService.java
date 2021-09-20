package com.spring.wefit.free.service;

import java.util.List;

import com.spring.wefit.command.FreeBoardVO;
import com.spring.wefit.commons.PageVO;

public interface IFreeBoardService {
	
	
	//자유게시판  글 등록
	void regist(FreeBoardVO vo);
	
	//자유게시판 글 목록
	List<FreeBoardVO> getList(PageVO vo);
	
	//자유게시판 글 상세보기
	FreeBoardVO getContent(int fbNum);
	
	//자유게시판 글 수정
	void update(FreeBoardVO vo);
	
	//자유게시판 글 삭제
	void delete (int fbNum);
	
	//자유게시판 총 게시물 수
	int getTotal(PageVO vo);
	
	
}
