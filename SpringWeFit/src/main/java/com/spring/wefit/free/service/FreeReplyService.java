package com.spring.wefit.free.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.wefit.command.FreeReplyVO;
import com.spring.wefit.commons.PageVO;
import com.spring.wefit.free.mapper.IFreeReplyMapper;

@Service
public class FreeReplyService implements IFreeReplyService {

	@Autowired
	private IFreeReplyMapper mapper;

	@Override
	public void regist(FreeReplyVO vo) {
		// TODO Auto-generated method stub
		mapper.regist(vo);
	}

	@Override
	public List<FreeReplyVO> getList(PageVO vo) {
		// TODO Auto-generated method stub
		return mapper.getList(vo);
	}

	@Override
	public void update(FreeReplyVO vo) {
		// TODO Auto-generated method stub
		mapper.update(vo);
	}

	@Override
	public void delete(int frNum) {
		// TODO Auto-generated method stub
		mapper.delete(frNum);
	}

	@Override
	public int getTotal(int fbNum) {
		// TODO Auto-generated method stub
		return mapper.getTotal(fbNum);
	}
	
	

}
