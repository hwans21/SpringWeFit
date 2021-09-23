package com.spring.wefit.placeboard.service;




import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.wefit.command.PlaceReplyVO;
import com.spring.wefit.placeboard.mapper.IPlaceReplyMapper;
import com.spring.wefit.commons.PageVO;

@Service 
public class PlaceReplyService implements IPlaceReplyService {
	
	@Autowired
	private IPlaceReplyMapper mapper;
	
	//댓글 등록
	@Override
	public void replyRegist(PlaceReplyVO vo) {
		mapper.replyRegist(vo);
	}
	
	//목록 요청
	@Override
	public List<PlaceReplyVO> replyGetList(PageVO vo, int pbNum) {
		Map<String, Object> datas = new HashMap<>();
		datas.put("paging", vo);
		datas.put("pbNum", pbNum);
	
		return mapper.replyGetList(datas);
	}
	
	//댓글 개수
	@Override
	public int replyGetTotal(int pbNum) {
		return mapper.replyGetTotal(pbNum);
	}
	
	//댓글 수정
	@Override
	public void replyUpdate(PlaceReplyVO vo) {
		mapper.replyUpdate(vo);
	}

	//댓글 삭제
	@Override
	public void replyDelete(int prNum) {
		mapper.replyDelete(prNum);
	}

	@Override
	public List<PlaceReplyVO> getList(int pbNum) {
		// TODO Auto-generated method stub
		return null;
	}

}
