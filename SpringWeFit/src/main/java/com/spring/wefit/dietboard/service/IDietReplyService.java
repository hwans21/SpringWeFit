package com.spring.wefit.dietboard.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.wefit.command.DietBoardReplyVO;

@Service
public interface IDietReplyService {

	//댓글 등록
	void replyRegist(DietBoardReplyVO vo); 
	
	//페이징 추가
	List<DietBoardReplyVO> getList(int bno); 
	
	//댓글 개수
	int getTotal(int bno); 

	//비밀번호 확인
	int pwCheck(DietBoardReplyVO vo); 
	
	//댓글 수정
	void update(DietBoardReplyVO vo); 
	
	//댓글 삭제
	void delete(int rno); 
	
	
	
}





