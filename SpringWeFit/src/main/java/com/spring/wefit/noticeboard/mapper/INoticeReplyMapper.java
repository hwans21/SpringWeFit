package com.spring.wefit.noticeboard.mapper;

import java.util.List;

import com.spring.wefit.command.NoticeReplyVO;

public interface INoticeReplyMapper {
	
		//댓글 등록
		void replyRegist(NoticeReplyVO vo); 
		
		//페이징 추가
		List<NoticeReplyVO> getList(int nbNum);
		
		//댓글 개수
		int getTotal(int nbNum); 
		
		//비밀번호 확인
		int pwCheck(NoticeReplyVO vo); 
		
		//댓글 수정
		void update(NoticeReplyVO vo); 
		
		//댓글 삭제
		void delete(int nrNum); 
	

}
