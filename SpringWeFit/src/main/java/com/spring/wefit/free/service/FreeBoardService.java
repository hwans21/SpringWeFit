package com.spring.wefit.free.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.wefit.command.FreeBoardVO;
import com.spring.wefit.commons.PageVO;
import com.spring.wefit.free.mapper.IFreeBoardMapper;

public class FreeBoardService implements IFreeBoardService {

	@Autowired
	private IFreeBoardMapper mapper;
	
	@Override
	public void regist(FreeBoardVO vo) {
		// TODO Auto-generated method stub
		mapper.regist(vo);
	}

	@Override
	public List<FreeBoardVO> getList(PageVO vo) {
		// TODO Auto-generated method stub
		return mapper.getList(vo);
	}

	@Override
	public int getTotal(PageVO vo) {
		// TODO Auto-generated method stub
		return mapper.getTotal(vo);
	}

	@Override
	public FreeBoardVO getContent(int bno) {
		// TODO Auto-generated method stub
		return mapper.getContent(bno);
	}

	@Override
	public void update(FreeBoardVO vo) {
		// TODO Auto-generated method stub
		mapper.update(vo);
	}

	@Override
	public void delete(int bno) {
		// TODO Auto-generated method stub
		mapper.delete(bno);
	}
	
}
