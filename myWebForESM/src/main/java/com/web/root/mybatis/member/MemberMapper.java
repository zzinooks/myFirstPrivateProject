package com.web.root.mybatis.member;

import com.web.root.member.dto.MemberDTO;

public interface MemberMapper {

	// 회원 정보 존재유무 확인 ( 1: 존재, 0: 없음)
	public int existaceOfUser(MemberDTO memberDTO);
	
	// 로그인
	public MemberDTO getUser(MemberDTO memberDTO);
	
	// 회원가입
	public int signIn(MemberDTO memberDTO);
	
	// 회원 정보 수정
	public int memberModify(MemberDTO memberDTO);
	
	// 회원 정보 삭제
	public int memberDelete(MemberDTO memberDTO);
	
	
}
