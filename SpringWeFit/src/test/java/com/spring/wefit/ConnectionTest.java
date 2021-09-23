package com.spring.wefit;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.spring.wefit.command.DietBoardVO;
import com.spring.wefit.command.FreeBoardVO;
import com.spring.wefit.command.FreeReplyVO;
import com.spring.wefit.dietboard.mapper.IDietBoardMapper;
import com.spring.wefit.free.mapper.IFreeBoardMapper;
import com.spring.wefit.free.mapper.IFreeReplyMapper;
import com.spring.wefit.test.ITestMapper;
import com.spring.wefit.command.UserVO;
import com.spring.wefit.commons.PageVO;
import com.spring.wefit.user.mapper.IUserMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/config/db-config.xml")
@Log4j
@WebAppConfiguration
public class ConnectionTest {
	
	@Autowired
	private IUserMapper usermapper;
	@Autowired
	private ITestMapper mapper;
	@Autowired
	private IFreeBoardMapper freemapper;
	@Autowired
	private IFreeReplyMapper freereplymapper;
	
	
	@Autowired
	private IDietBoardMapper dietMapper;
	
	@Test
	public void registTest() {
		for(int i=1; i<=10; i++) {
			DietBoardVO vo = new DietBoardVO();
			vo.setMemberNum(i);
			vo.setDbTitle("����" + i);
			vo.setDbContent("����" + i);
			vo.setDbLookCount(i);
			vo.setDbImageCount(i);
			
			dietMapper.regist(vo);
		}
	}
	
	@Test
	public void test(){
		double d = (double) mapper.test();
		System.out.println(d);
	}
	@Test
	public void updateTest() {
		UserVO vo = new UserVO();
		for(int i=2;i<51;i=i+2) {
			
			vo = usermapper.getInfo("test"+i+"@test.com");
			if(vo != null) {
				usermapper.authUser(vo.getMemberNick(), vo.getMemberCode());			
				
			}
		}
	}
	
	@Test
	public void test2() {
		System.out.println(usermapper.emailCheck("test@emi.com"));
	}
	
	@Test
	public void joinTest() {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		UserVO vo = new UserVO();
		for(int i=51;i<101;i++) {
			//vo.setMEmail("test"+i+"@test.com");
			vo.setMemberNick("test"+i);
			vo.setMemberPasswd(encoder.encode(Integer.toString(i)));
			vo.setMemberPhone("010111111"+(i<10?"0":"")+i);
			vo.setMemberHumanYN("N");
			vo.setMemberEmailYN("Y");
			vo.setMemberCode(UUID.randomUUID().toString().split("-")[0]);
			System.out.println(vo.toString());
			usermapper.join(vo);
		}
	}
	
	@Test
	public void boardInsertTest() {
		FreeBoardVO vo = new FreeBoardVO();
		for(int i=1;i<30;i++) {
			vo.setMemberNick("test");
			vo.setFbTitle("[자유글]테스트 제목입니다."+i);
			vo.setFbContent("테스트 내용입니다."+i);
			vo.setFbLookCount(0);
			vo.setFbImageCount(0);
			System.out.println(vo.toString());
			freemapper.regist(vo);
		}
		for(int i=1;i<30;i++) {
			vo.setMemberNick("test");
			vo.setFbTitle("[소식/정보]테스트 제목입니다."+i);
			vo.setFbContent("테스트 내용입니다."+i);
			vo.setFbLookCount(0);
			vo.setFbImageCount(0);
			System.out.println(vo.toString());
			freemapper.regist(vo);
		}
		for(int i=1;i<30;i++) {
			vo.setMemberNick("test");
			vo.setFbTitle("[홍보]테스트 제목입니다."+i);
			vo.setFbContent("테스트 내용입니다."+i);
			vo.setFbLookCount(0);
			vo.setFbImageCount(0);
			System.out.println(vo.toString());
			freemapper.regist(vo);
		}
		for(int i=1;i<30;i++) {
			vo.setMemberNick("test");
			vo.setFbTitle("[꿀팁]테스트 제목입니다."+i);
			vo.setFbContent("테스트 내용입니다."+i);
			vo.setFbLookCount(0);
			vo.setFbImageCount(0);
			System.out.println(vo.toString());
			freemapper.regist(vo);
		}
		for(int i=1;i<30;i++) {
			vo.setMemberNick("test");
			vo.setFbTitle("[기타]테스트 제목입니다."+i);
			vo.setFbContent("테스트 내용입니다."+i);
			vo.setFbLookCount(0);
			vo.setFbImageCount(0);
			System.out.println(vo.toString());
			freemapper.regist(vo);
		}
	}
	
	@Test
	public void replyInsertTest() {
		FreeReplyVO vo = new FreeReplyVO();
		vo.setFbNum(377);
		vo.setMemberNum(364);
		for(int i=1; i<30;i++) {
			vo.setFrContent("테스트 댓글입니다. "+i);
			freereplymapper.regist(vo);
		}
	}
	
	@Test
	public void replyTotal() {
		System.out.println("댓글 개수"+freereplymapper.getTotal(377));
	}
	
	@Test
	public void replyModify() {
		FreeReplyVO vo = new FreeReplyVO();
		vo.setFrNum(3);
		vo.setFrContent("수정 테스트입니다.");
		freereplymapper.update(vo);
	}
	
	@Test
	public void replyDelete() {
		freereplymapper.delete(28);
	}
	
	@Test
	public void replyList() {
		PageVO vo = new PageVO();
		vo.setPageNum(1);
		vo.setCountPerPage(20);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("paging", vo);
		map.put("fbNum", 377);
		System.out.println(map.toString());
		List<FreeReplyVO> list = freereplymapper.getList(map);
		System.out.println(list.size());
		for(FreeReplyVO reply : list) {
			System.out.println(reply.toString());
		}
	}
}
