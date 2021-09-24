package com.spring.wefit.noticeboard.mapper;

import java.util.List;

import com.spring.wefit.command.NoticeBoardVO;
import com.spring.wefit.commons.PageVO;


public interface INoticeBoardMapper {
	
	//공지 글 등록
	void regist(NoticeBoardVO vo);
	
	//공지 글 목록
	List<NoticeBoardVO> getList(PageVO vo);
	
	//공지글 상세
	NoticeBoardVO getContent(int nbNum);
	
	//공지 글 수정
	void update(NoticeBoardVO vo);
	
	//공지 글 삭제
	void delete (int nbNum);
	
	//공지 총 게시글 수
	int getTotal(PageVO vo);
	
	
	
}