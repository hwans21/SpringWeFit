package com.spring.wefit.placeboard.service;

import java.util.List;

import com.spring.wefit.command.PlaceReplyVO;
import com.spring.wefit.commons.PageVO;
public interface IPlaceReplyService {

	//댓글 등록
	void replyRegist(PlaceReplyVO vo); 
	
	//목록 요청
	List<PlaceReplyVO> replyGetList(PageVO vo, int pbNum); 
		
	//페이징 추가
	List<PlaceReplyVO> getList(int pbNum);
	
	//댓글 개수
	int replyGetTotal(int pbNum); 
	
	//댓글 수정
	void replyUpdate(PlaceReplyVO vo); 
	
	//댓글 삭제
	void replyDelete(int prNum);

}
