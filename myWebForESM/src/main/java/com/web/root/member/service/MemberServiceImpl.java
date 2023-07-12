package com.web.root.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.web.root.member.dto.MemberDTO;
import com.web.root.mybatis.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;
	
	
	// 로그인Form에서 정보 받아와서 Login 하기
	@Override
	public void memberLogin(Model model, HttpServletRequest request, HttpSession session) {
		
		// 정보 받기
		String id = request.getParameter("loginId");
		String pwd = request.getParameter("loginPassword");
		MemberDTO member = new MemberDTO();
		member.setId(id);
		member.setPwd(pwd);
		
		// id 존재 유무 확인
		int existaceOfUser = memberMapper.existaceOfUser(member);
		
		if( existaceOfUser == 1) { // 존재시 로그인
			MemberDTO loginMember = memberMapper.getUser(member);
			
			model.addAttribute("user", loginMember);
			session.setAttribute("user", loginMember);
			
		} else { // 비존재시 로그인 실패로 보내자
			
		}
		
	}


	// 회원가입
	@Override
	public int signIn(HttpServletRequest request) {
		
		// 정보 받기
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(request.getParameter("userId"));
		memberDTO.setPwd(request.getParameter("userPwd"));
		memberDTO.setNickname(request.getParameter("userNickName"));
		memberDTO.setPhone(request.getParameter("userPhone"));
		memberDTO.setEmail(request.getParameter("userEmail"));
		memberDTO.setAddr(request.getParameter("userAddr"));
		
		return memberMapper.signIn(memberDTO);
	}

	// 회원 정보 수정
	@Override
	public int memberModify(Model model, HttpServletRequest request, HttpSession session) {
		
		// 정보 받기
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(request.getParameter("userId"));
		memberDTO.setPwd(request.getParameter("userPwd"));
		memberDTO.setNickname(request.getParameter("userNickName"));
		memberDTO.setPhone(request.getParameter("userPhone"));
		memberDTO.setEmail(request.getParameter("userEmail"));
		memberDTO.setAddr(request.getParameter("userAddr"));
		
		// 성공 유무 확인
		int success = memberMapper.memberModify(memberDTO);
		if(success == 1) {
			session.setAttribute("user", memberMapper.getUser(memberDTO));
		}
		
		
		// success 돌려줄 필요없을듯...? (성공, 실패 맨트를 차후 추가하자)
		return success;
	}

	// 회원 정보 삭제// 회원 정보 삭제
	@Override
	public int memberDelete(MemberDTO memberDTO) {
		
		int success = memberMapper.memberDelete(memberDTO);
		
		// success 돌려줄 필요없을듯...? (성공, 실패 맨트를 차후 추가하자)
		return success;
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
