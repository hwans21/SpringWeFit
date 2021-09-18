package com.spring.wefit.controller;

import java.sql.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.wefit.command.UserVO;
import com.spring.wefit.user.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private IUserService service;
	
	
	@PostMapping("/join")
	public String join(UserVO vo,RedirectAttributes ra) {
		System.out.println("회원가입 컨트롤러 요청"+vo.toString());
		service.join(vo);
		service.mailSendWithUserKey(vo);
		ra.addFlashAttribute("msg","메일함을 확인해주세요");
		return "redirect:/";
	}
	
	@PostMapping("/recovery")
	public String recovery(UserVO vo,RedirectAttributes ra) {
		System.out.println("/user/recovery: POST");
		System.out.println(vo.toString());
		service.recovery(vo.getMemberEmail());
		ra.addFlashAttribute("msg","복구가 완료되었습니다.");
		return "redirect:/";
	}
	
	@GetMapping("/auth/{nick}/{code}")
	public String auth(@PathVariable String nick, @PathVariable String code) {
		System.out.println("GET: 인증요청");
		System.out.println(nick);
		System.out.println(code);
		service.authUser(nick,code);
		
		return "redirect:/";
	}
	
	
	@PostMapping("/emailChk")
	@ResponseBody
	public String emailChk(@RequestBody String email) {
		System.out.println(service.emailCheck(email));
		if((service.emailCheck(email) == 0)) {
			return "success";
		}
		return "duplicate";
	}
	
	@PostMapping("/nickChk")
	@ResponseBody
	public String nickChk(@RequestBody String nick) {
		if(service.nickCheck(nick) == 0) {
			return "success";
		}
		return "duplicate";
		
	}
	
	
	
	@PostMapping("/login")
	public ModelAndView login(UserVO vo,
			HttpSession session, 
			HttpServletResponse response,
			RedirectAttributes ra) {
		
		System.out.println("/user/login:POST");
		System.out.println("param:"+vo.toString());
		
		UserVO login = service.getInfo(vo.getMemberEmail());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();	
	
		if(login != null) {
			if(encoder.matches(vo.getMemberPasswd(), login.getMemberPasswd())) {
				if(login.getMemberEmailYN().equals("N")) {
					ra.addFlashAttribute("msg", "이메일 확인 필요");
					return new ModelAndView("redirect:/");
				} else if(login.getMemberHumanYN().equals("Y")||!(login.getMemberDelDate() == null)) {
					ra.addFlashAttribute("msg", "복구 필요");
					ra.addFlashAttribute("login", login);
					return new ModelAndView("redirect:/");
				}
				session.setAttribute("loginuser", login);
				long limitTime = 7*24*60*60; //7일동안 자동로그인
				if(vo.isAutoLoginCheck()) {
					Cookie logincookie = new Cookie("loginCookie", session.getId());
					logincookie.setPath("/");
					logincookie.setMaxAge((int) limitTime);
					response.addCookie(logincookie);
					
					long currentTime = System.currentTimeMillis() + (limitTime*1000);
					Date limitDate = new Date(currentTime);
					service.keepLogin(session.getId(), limitDate, login.getMemberEmail());
				}
				ra.addFlashAttribute("msg","로그인 성공!");
				return new ModelAndView("redirect:/");
			}
			
		}
		ra.addFlashAttribute("msg", "이메일 또는 비밀번호가 맞지 않습니다.");
		return new ModelAndView("redirect:/");
		
	}
	
	
	
}
