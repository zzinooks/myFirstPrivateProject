package com.web.root.member.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.web.root.member.dto.MemberDTO;

public interface MemberService {

	// 로그인Form에서 정보 받아와서 Login 하기
	public void memberLogin(Model model, HttpServletRequest request, HttpSession session);
	
	// 회원가입
	public int signIn(HttpServletRequest request);
	
	// 회원정보 수정
	public int memberModify(Model model, HttpServletRequest request, HttpSession session);
	
	// 회원정보 삭제
	public int memberDelete(MemberDTO memberDTO);
	
	// 카카오 로그인 2번 - code를 보내 access_Token 얻기
	public String getAccessToken(String authorize_code) throws Throwable;
	
	// 카카오 로그인 3번 - 받은 access_Token 을 보내 userInfo 얻기
	public HashMap<String, Object> getUserInfo(String access_Token) throws Throwable;
	
	
	
}
