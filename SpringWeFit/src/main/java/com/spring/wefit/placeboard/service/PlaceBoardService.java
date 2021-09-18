package com.spring.wefit.placeboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.wefit.command.PlaceBoardVO;
import com.spring.wefit.commons.PageVO;
import com.spring.wefit.placeboard.mapper.IPlaceBoardMapper;


@Service
public class PlaceBoardService implements IPlaceBoardService{

	@Autowired
	private IPlaceBoardMapper mapper;

	
	@Override
	public void regist(PlaceBoardVO vo) {
		mapper.regist(vo);
	}

	@Override
	public List<PlaceBoardVO> getList(PageVO vo) {
		List<PlaceBoardVO> list = mapper.getList(vo);
		return list;
	}

	@Override
	public PlaceBoardVO getContent(int pbNum) {
		return mapper.getContent(pbNum);
	}
	
	@Override
	public int getTotal(PageVO vo) {
		return mapper.getTotal(vo);
	}
	
	@Override
	public void update(PlaceBoardVO vo) {
		mapper.update(vo);
	}
	
	@Override
	public void delete(int pbNum) {
		mapper.delete(pbNum);
	}

	@Override
	   public void upHit(int pbNum) {
	      mapper.upHit(pbNum);
	}

	@Override
		public void upLike(int pbNum) {
	    	mapper.upLike(pbNum);
	}


	
}
