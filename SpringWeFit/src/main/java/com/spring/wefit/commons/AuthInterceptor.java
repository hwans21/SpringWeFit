package com.spring.wefit.commons;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.spring.wefit.command.UserVO;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("로그인 인터셉터 발동");
		HttpSession session = request.getSession();
		UserVO login = (UserVO) session.getAttribute("loginuser");
		
		if(login == null) {
			msgreturn(response, request, "로그인 후 이용해주세요");
			return false;
		} else if(login.getMemberManagerYN().equals("YES")) {
			System.out.println("관리자 권한으로 접근했습니다.");
			return true;
		} else if(request.getParameter("memberNum") == null && request.getParameter("memberNick") == null) {
			System.out.println("새 글 쓰기 접근");
			return true;
		} else {
			if(request.getParameter("memberNum")!=null) {
				if(login.getMemberNum() == Integer.parseInt(request.getParameter("memberNum"))) {
					System.out.println("수정권한 맞음");
					return true;
				} else {
					msgreturn(response, request, "권한이 맞지 않습니다.");
					return false;
				}
			} else {
				if(login.getMemberNick().equals(request.getParameter("memberNick"))) {
					System.out.println("수정권한 맞음");
					return true;
				} else {
					msgreturn(response, request, "권한이 맞지 않습니다.");
					return false;
				}
			}
			
		}
//		} else if(login.getMemberNum() == Integer.parseInt(request.getParameter("memberNum")) ||
//				login.getMemberNick().equals(request.getParameter("memberNick"))) {
//			System.out.println("수정권한 맞음");
//			return true;
//		} else {
//			msgreturn(response, request, "권한이 맞지 않습니다.");
//			return false;
//		}
	}
	private void msgreturn(HttpServletResponse response, HttpServletRequest request, String msg) {
		FlashMap flashMap = new FlashMap();
		flashMap.put("msg", msg);
		FlashMapManager flashMapManager = RequestContextUtils.getFlashMapManager(request);
		flashMapManager.saveOutputFlashMap(flashMap, request, response);
		
		String referer = (String)request.getHeader("REFERER"); // 이전페이지 url 가져오기
		System.out.println(referer);
		if(referer!=null) {
			try {
				response.sendRedirect(referer);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				response.sendRedirect("/wefit");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
}
