package com.spring.wefit.user.mapper;

import java.sql.Timestamp;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.spring.wefit.command.UserVO;

public interface IUserMapper {
	
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
	void keepLogin(Map<String, Object> datas);
	
	//세션 아이디를 통한 회원 정보 조회 기능
	UserVO getUserWithSessionId(String sessionId);
	
	//인증 처리
	void authUser(@Param("nick")String nick, @Param("code")String code);
	
	//인증 처리 후  인증값 변경
	void codeChange(@Param("nick")String nick, @Param("code")String code);
	
	//유저 위치 정보 등록하기
	void geoRegist(UserVO vo);
	
	//닉네임이랑 코드 확인
	int codeCheck(UserVO vo);
	
	//관리자 여부 체크
	int isManager(String email);
}
