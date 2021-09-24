package com.spring.wefit.market.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.wefit.command.marketBoardVO;
import com.spring.wefit.commons.PageVO;
import com.spring.wefit.market.mapper.IMarketBoardMapper;

@Service
public class marketBoardService implements IMarketBoardService {
	
	@Autowired
	private IMarketBoardMapper mapper;

	@Override
	public void regist(marketBoardVO vo) {
		mapper.regist(vo);

	}

	@Override
	public List<marketBoardVO> getList(PageVO vo) {
		
		return mapper.getList(vo);
	}

	@Override
	public int getTotal(PageVO vo) {
		return mapper.getTotal(vo);
	}

	@Override
	public marketBoardVO getContent(int mbNum) {
		return mapper.getContent(mbNum);
	}

	@Override
	public void update(marketBoardVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(int mbNum) {
		mapper.delete(mbNum);
	}

	@Override
	public void updateViewCount(int mbNum) {

		mapper.updateViewCount(mbNum);
	}

	@Override
	public int checkLovely(marketBoardVO vo) {
		return mapper.checkLovely(vo);
	}

	@Override
	public void insertLovely(marketBoardVO vo) {
		mapper.insertLovely(vo);
	}

	@Override
	public int checkReport(marketBoardVO vo) {
		return mapper.checkReport(vo);
	}

	@Override
	public void insertReport(marketBoardVO vo) {
		mapper.insertReport(vo);
	}

}
