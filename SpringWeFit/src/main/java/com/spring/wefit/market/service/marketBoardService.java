package com.spring.wefit.market.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.spring.wefit.command.marketBoardVO;
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
	public List<marketBoardVO> getList() {
		
		return mapper.getList();
	}

	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public marketBoardVO getContent(int mbNum) {
		return mapper.getContent(mbNum);
	}

	@Override
	public void update(marketBoardVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int mbNum) {
		// TODO Auto-generated method stub

	}

}
