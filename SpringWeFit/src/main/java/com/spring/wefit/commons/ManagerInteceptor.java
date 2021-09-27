package com.spring.wefit.commons;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.spring.wefit.command.UserVO;

public class ManagerInteceptor extends HandlerInterceptorAdapter{
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("관리자 인터셉션 발동");
		HttpSession session = request.getSession();
		UserVO login = (UserVO) session.getAttribute("loginuser");
		
		FlashMap flashMap = new FlashMap();
		
		
		if(!login.getMemberManagerYN().equals("YES")) {
			
			flashMap.put("msg", "관리자만 접근 가능합니다!");
			FlashMapManager flashMapManager = RequestContextUtils.getFlashMapManager(request);
			flashMapManager.saveOutputFlashMap(flashMap, request, response);
			System.out.println("관리자 계정이 아닙니다.");
			String referer = (String)request.getHeader("REFERER"); // 이전페이지 url가져오기
			if(referer!=null) {
				response.sendRedirect(referer);
			} else {
				response.sendRedirect("/wefit");
			}
			return false;
		}
		return true;
	}
}
