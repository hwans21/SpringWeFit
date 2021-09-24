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

	//장소 글 등록
	@Override
	public void regist(PlaceBoardVO vo) {
		mapper.regist(vo);
	}

	//장소 글 목록
	@Override
	public List<PlaceBoardVO> getList(PageVO vo) {
		List<PlaceBoardVO> list = mapper.getList(vo);
		return list;
	}
	
	//장소 총 게시물 수
	@Override
	public int getTotal(PageVO vo) {
		return mapper.getTotal(vo);
	}
	
	//장소 글 상세보기
	@Override
	public PlaceBoardVO getContent(int pbNum) {
		return mapper.getContent(pbNum);
	}
	
	//장소 글 수정
	@Override
	public void update(PlaceBoardVO vo) {
		mapper.update(vo);
	}
	
	//장소 글 삭제
	@Override
	public void delete(int pbNum) {
		mapper.delete(pbNum);
	}

	//조회수를 올려주는 메서드
	@Override
	   public void upHit(int pbNum) {
	      mapper.upHit(pbNum);
	}

	//좋아요를 올려주는 메서드
	@Override
	public int checkLovely(PlaceBoardVO vo) {
		return mapper.checkLovely(vo);
	}

	//자유게시판 좋아요 처리
	@Override
	public void insertLovely(PlaceBoardVO vo) {
		mapper.insertLovely(vo);
	}

	//자유게시판 신고 했는지 확인
	@Override
	public int checkReport(PlaceBoardVO vo) {
		return mapper.checkReport(vo);
	}

	//자유게시판 신고 처리
	@Override
	public void insertReport(PlaceBoardVO vo) {
		mapper.insertReport(vo);
	}

}
