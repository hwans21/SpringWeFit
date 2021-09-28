package com.spring.wefit.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.wefit.course.mapper.ICourseBoardMapper;
import com.spring.wefit.course.service.ICourseBoardService;
import com.spring.wefit.diet.service.IDietBoardService;
import com.spring.wefit.free.service.IFreeBoardService;
import com.spring.wefit.market.service.IMarketBoardService;
import com.spring.wefit.noticeboard.service.INoticeBoardService;
import com.spring.wefit.placeboard.service.IPlaceBoardService;
import com.spring.wefit.user.service.IUserService;



/**
 * Handles requests for the application home page.
 */


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private IUserService userservice;

	@Autowired
	private ICourseBoardService courseservice;
	
	@Autowired 
	private IDietBoardService dietservice;
	
	@Autowired
	private IFreeBoardService freeservice;
	
	@Autowired 
	private IMarketBoardService marketservice;
	
	@Autowired
	private INoticeBoardService noticeservice;
	
	@Autowired 
	private IPlaceBoardService placeservice;	
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		userservice.sleepUser(date);
		userservice.delete(date);
		
		
		
		return "home";
	}
	
}

