package com.web.root.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface BoardService {
	
	// 메신저 삽입
	public String getMessage(HttpServletRequest request, String msg, String url);
	
	// 삽입
	public String insertESM(HttpServletRequest request);
	
	// ESM 정보 불러오기 - by id
	public void getESMBoardById(HttpSession session, Model model);
	
}
