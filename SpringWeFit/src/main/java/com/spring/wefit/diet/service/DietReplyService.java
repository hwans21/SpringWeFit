package com.spring.wefit.diet.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.wefit.command.DietBoardReplyVO;
import com.spring.wefit.command.DietBoardVO;
import com.spring.wefit.commons.PageVO;
import com.spring.wefit.diet.mapper.IDietReplyMapper;

@Service
public class DietReplyService implements IDietReplyService {

	@Autowired
	IDietReplyMapper mapper;
	
	
	@Override
	public void replyRegist(DietBoardReplyVO vo) {
		mapper.replyRegist(vo);

	}

	@Override
	public List<DietBoardReplyVO> getList(PageVO vo, int dbNum) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("paging", vo);
		map.put("dbNum",dbNum);
		return mapper.getList(map);
	}

	@Override
	public int getTotal(int dbNum) {
		return mapper.getTotal(dbNum);
	}


	@Override
	public void replyUpdate(DietBoardReplyVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void replyDelete(int drNum) {
		// TODO Auto-generated method stub

	}
	
	
	@Override
	public DietBoardReplyVO getContent(int drNum) {
		return mapper.getContent(drNum);
	}
	

}




