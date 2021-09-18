package com.spring.wefit.user.service;

import java.sql.Date;
import java.sql.Timestamp;


import org.apache.ibatis.annotations.Param;

import com.spring.wefit.command.UserVO;

public interface IUserService {

		// 이메일 중복 확인
		int emailCheck(String email);
		
		// 닉네임 중복 확인
		int nickCheck(String nick);
		
		//회원가입
		void join(UserVO vo);
		
		//회원정보 얻어오기
		UserVO getInfo(String email);
		
		//회원정보 수정하기
		void modify(UserVO vo);
		
		//회원탈퇴처리
		void withdrawal(String email);
		
		//회원삭제처리
		void delete(Timestamp date);
		
		//회원복구처리
		void recovery(String email);
		
		//자동 로그인 쿠키값DB저장 처리
		void keepLogin(String sessionId, Date limitTime, String account);
		
		//세션 아이디를 통한 회원 정보 조회 기능
		UserVO getUserWithSessionId(String sessionId);
		
		// 인증 이메일 전송
		public void mailSendWithUserKey(UserVO vo);
		
		//링크 클릭시 인증하기
		public void authUser(String nick, String code);
}
