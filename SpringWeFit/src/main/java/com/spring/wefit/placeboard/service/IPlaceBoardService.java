package com.spring.wefit.placeboard.service;

import java.util.List;

import com.spring.wefit.command.PlaceBoardVO;
import com.spring.wefit.commons.PageVO;

public interface IPlaceBoardService {

	//장소 글 등록
	void regist(PlaceBoardVO vo);

	//장소 글 목록
	List<PlaceBoardVO> getList(PageVO vo);

	//장소 총 게시물 수
	int getTotal(PageVO vo);

	//장소 글 상세보기
	PlaceBoardVO getContent(int pbNum);

	//장소 글 수정
	void update(PlaceBoardVO vo);

	//장소 글 삭제
	void delete(int pbNum);
	
	//조회수를 올려주는 메서드
	void upHit(int pbNum);
	   
	//좋아요를 올려주는 메서드
	void upLike(int pbNum);

	
	

}
