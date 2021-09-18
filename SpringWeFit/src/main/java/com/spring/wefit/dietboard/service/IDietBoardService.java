package com.spring.wefit.dietboard.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.wefit.command.DietBoardVO;
import com.spring.wefit.commons.PageVO;

@Service
public interface IDietBoardService {
	
	//식단 글 등록
	void regist(DietBoardVO vo);
	
	//식단 글 목록
	List<DietBoardVO> getList();
	
	//식단 총 게시물 수 (페이징 할 때)
	int getTotal(PageVO vo);
	
	//식단 글 상세보기
	DietBoardVO getContent(int dbNum);
	
	//식단 글 수정
	void update(DietBoardVO vo);
	
	//식단 글 삭제
	void delete (int dbNum);
	
	
	
}
