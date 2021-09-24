package com.spring.wefit.noticeboard.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.wefit.command.DietBoardVO;
import com.spring.wefit.command.NoticeBoardVO;
import com.spring.wefit.commons.PageVO;

public interface INoticeBoardService {
	

	

		void regist(NoticeBoardVO vo);
	
		int getTotal(PageVO vo);
		
		NoticeBoardVO getContent(int nbNum);
		
		void update(NoticeBoardVO vo);

		void delete(int nbNum);

		List<NoticeBoardVO> getList(PageVO vo);

		

	
	
}

