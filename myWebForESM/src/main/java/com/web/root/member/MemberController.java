package com.web.root.member;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
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
	
	@RequestMapping("toKakaoLoginTest")
	public String toKakaoLoginTest() {
		
		return "/member/kakaoLoginTest";
	}
	
	// kakaoLoginTest 페이지로 이동
	// 1번 카카오톡에 사용자 코드 받기(jsp의 a태그 href에 경로 있음)
	// 2번 Service.getAccessToken에 code값 보내기. 잘 진행 되면 3번으로
	// 3번 받은 access_Token을 Service.getuserInfo로 보냄. userInfo 받아옴.
	//     userInfo에 nickname, email 정보가 담겨있음
	@RequestMapping(value = "kakaoLoginTest", method = RequestMethod.GET)
	public ModelAndView kakaoLoginTest(@RequestParam(value = "code", required = false) String code) throws Throwable {
		
		// 1번
		System.out.println("code: " + code);
	
		// 2번
		String access_Token = ms.getAccessToken(code);
		System.out.println("\n\n access_Token : " + access_Token);
		// 위의 access_Token 받는 것을 확인한 후에 밑에 진행
		
		// 3번
		HashMap<String, Object> userInfo = ms.getUserInfo(access_Token);
		System.out.println("nickname : " + userInfo.get("nickname"));
		System.out.println("email : " + userInfo.get("email"));
		
		return null;
		// return에 페이지를 해도 되고, 여기서는 코드가 넘어오는지만 확인할 것이기 때문에 일단 return값이 없다.
		
	}
}
