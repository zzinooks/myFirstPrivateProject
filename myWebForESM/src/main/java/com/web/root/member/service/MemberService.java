package com.web.root.member.service;

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
	
	
}
