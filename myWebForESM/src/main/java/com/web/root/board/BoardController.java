package com.web.root.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.root.board.service.BoardService;


@Controller
@RequestMapping("board")
public class BoardController {

	@Autowired
	BoardService bs;
	
	// ESM 페이지로 이동
	@RequestMapping("eSMForm")
	public String eSMForm() {
		System.out.println("eSMForm 작동하는지 모르겠따..");
		
		// return 값이 문제네?
		
		return "board/esmboardform";
		//return "board/anything";
		
	}
	
	
}
