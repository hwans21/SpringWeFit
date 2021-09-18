package com.spring.wefit.market.mapper;

import java.util.List;

import com.spring.wefit.command.marketBoardVO;

public interface IMarketBoardMapper {
	
	//글 등록
	void regist(marketBoardVO vo);
	
	//글 목록
	List<marketBoardVO> getList();
	
	//총 게시물 수
	int getTotal();
	
	//상세보기
	marketBoardVO getContent(int mbNum);
	
	//수정
	void update(marketBoardVO vo);
	
	//삭제
	void delete(int mbNum);

}
