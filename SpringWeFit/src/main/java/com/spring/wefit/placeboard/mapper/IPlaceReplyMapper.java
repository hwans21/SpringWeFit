package com.spring.wefit.placeboard.mapper;

import java.util.List;
import java.util.Map;

import com.spring.wefit.command.PlaceReplyVO;
public interface IPlaceReplyMapper {

	//댓글 등록
	void replyRegist(PlaceReplyVO vo); 
	
	//목록 요청
	List<PlaceReplyVO> replyGetList(Map<String, Object> datas);
		
	//페이징 추가
	List<PlaceReplyVO> getList(int pbNum);
	
	//댓글 개수
	int replyGetTotal(int pbNum); 
	
	//댓글 수정
	void replyUpdate(PlaceReplyVO vo); 
	
	//댓글 삭제
	void replyDelete(int prNum); 
	
	

}
