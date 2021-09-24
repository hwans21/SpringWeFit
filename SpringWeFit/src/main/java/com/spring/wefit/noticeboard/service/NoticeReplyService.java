package com.spring.wefit.noticeboard.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.wefit.command.NoticeReplyVO;
import com.spring.wefit.noticeboard.mapper.INoticeReplyMapper;

@Service
public class NoticeReplyService implements INoticeReplyService {
	
	@Autowired
	private INoticeReplyMapper mapper;

	@Override
	public void replyRegist(NoticeReplyVO vo) {

	}

	@Override
	public List<NoticeReplyVO> getList(int nbNum) {
		return null;
	}

	@Override
	public void update(NoticeReplyVO vo) {

	}

	@Override
	public void delete(int nrNum) {

	}

	@Override
	public int getTotal(int nbNum) {
		return 0;
	}

	@Override
	public int pwCheck(NoticeReplyVO vo) {
		return 0;
	}

}
