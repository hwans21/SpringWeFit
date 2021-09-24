package com.spring.wefit.noticeboard.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.wefit.command.NoticeReplyVO;

@Service
public interface INoticeReplyService {

	//공지 댓 등록
	void replyRegist(NoticeReplyVO vo);
	
	//공지 댓 리스트
	List<NoticeReplyVO> getList(int nbNum);
	
	//공지 댓 수정
	void update(NoticeReplyVO vo);
	
	//공지 댓 삭제
	void delete(int nrNum);
	
	int getTotal(int nbNum);
		
	int pwCheck(NoticeReplyVO vo);
	
	
}