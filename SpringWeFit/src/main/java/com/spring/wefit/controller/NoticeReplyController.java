package com.spring.wefit.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.wefit.noticeboard.service.NoticeReplyService;

@Controller
@RequestMapping("/noticeReply/*")
public class NoticeReplyController {
	
	@Inject
	private NoticeReplyService service;
	

}
