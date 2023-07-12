package com.web.root.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.root.member.dto.MemberDTO;
import com.web.root.member.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	MemberService ms;
	

	// 로그인 페이지로 이동
	@RequestMapping("login")
	public String login() {
		
		return "member/login";
	}
	
	// 로그인 Form 정보 받아 로그인하기
	@RequestMapping("memberLogin")
	public String memberLogin(Model model, HttpServletRequest request, HttpSession session) {
		ms.memberLogin(model, request, session);
		return "/index";
	}
	
	// 로그아웃
	@RequestMapping("logOut")
	public String logOut(HttpSession session) {
		session.removeAttribute("user");
		return "/index";
	}
	
	// 회원가입 페이지 이동
	@RequestMapping("signInForm")
	public String signInForm() {
		return "member/signInForm";
	}
	
	// 회원 가입
	@RequestMapping("signIn")
	public String signIn(HttpServletRequest request) {
		ms.signIn(request);
		return "/index";
	}
	
	//회원 정보 수정 Form으로 이동
	@RequestMapping("memberModifyForm")
	public String memberModifyForm(Model model, HttpSession session) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("user");
		System.out.println(memberDTO.getId() + " 아이디 입니다~!");
		model.addAttribute("user", memberDTO);
		return "member/memberModifyForm";
	}
	
	// 회원 정보 수정
	@PostMapping("memberModify")
	public String memberModify(Model model, HttpServletRequest request, HttpSession session) {
		
		ms.memberModify(model, request, session);
		return "/index";
	}
	
	
	// 회원 정보 삭제
	@RequestMapping("memberDelete")
	public String memberDelete(HttpSession session) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("user");
		
		ms.memberDelete(memberDTO);
		session.removeAttribute("user");
		return "/index";
	}
	
	// 인덱스로 이동해봅니다
	@RequestMapping("index")
	public String index() {
		return "/index";
	}
	
}
