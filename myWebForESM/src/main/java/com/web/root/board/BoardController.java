package com.web.root.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.root.board.service.BoardService;


@Controller
@RequestMapping("board")
public class BoardController {

	@Autowired
	BoardService bs;
	
	// ESM form 페이지로 이동
	@RequestMapping("eSMForm")
	public String eSMForm() {
		return "board/esmboardform";
	}
	
	// ESM 삽입하기
	@PostMapping("insertESM")
	public void insertESM(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		// ESM 삽입 및 결과 메시지 출력
		String message = bs.insertESM(request);;
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
}
