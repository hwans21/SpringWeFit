package com.spring.wefit.market.service;

import java.util.List;

import com.spring.wefit.command.MarketBoardVO;
import com.spring.wefit.commons.PageVO;

public interface IMarketBoardService {
	
	//글 등록
	void regist(MarketBoardVO vo);
	
	//글 목록
	List<MarketBoardVO> getList(PageVO vo);
	
	//총 게시물 수
	int getTotal(PageVO vo);
	
	//상세보기
	MarketBoardVO getContent(int mbNum);
	
	//수정
	void update(MarketBoardVO vo);
	
	//삭제
	void delete(int mbNum);
	
	// 조회수 수정
	void updateViewCount(int mbNum);

	// 좋아요 
	int checkLovely(MarketBoardVO vo);

	// 좋아요테이블 처리
	void insertLovely(MarketBoardVO vo);

	// 신고확인
	int checkReport(MarketBoardVO vo);

	// 신고 처리
	void insertReport(MarketBoardVO vo);



}
