package com.web.root.board.service;

import javax.servlet.http.HttpServletRequest;

public interface BoardService {
	
	// 메신저 삽입
	public String getMessage(HttpServletRequest request, String msg, String url);
	
	// 삽입
	public String insertESM(HttpServletRequest request);
	
	
}
