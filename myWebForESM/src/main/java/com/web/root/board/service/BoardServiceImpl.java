package com.web.root.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.root.board.dto.ESMBoardDTO;
import com.web.root.mybatis.board.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardMapper boardMapper;
	
	// 메신저 삽입
	public String getMessage(HttpServletRequest request, String msg, String url) {
		String message = null;
		String path = request.getContextPath();
		message = "<script>alert('" + msg + "');";
		message += "location.href='"+ path + url + "';</script>";
		return message;
	}

	// ESM Board 삽입
	@Override
	public String insertESM(HttpServletRequest request) {
		
		// 정보 받기
		ESMBoardDTO eSMBoardDTO = new ESMBoardDTO();
		eSMBoardDTO.setSavetime(request.getParameter("savetime"));
		eSMBoardDTO.setPlace(request.getParameter("place"));
		eSMBoardDTO.setCompany(request.getParameter("company"));
		eSMBoardDTO.setEmotion(request.getParameter("emotion"));
		eSMBoardDTO.setReason(request.getParameter("reason"));
		eSMBoardDTO.setContent(request.getParameter("content"));
		eSMBoardDTO.setHappiness(Integer.parseInt(request.getParameter("happiness")));
		eSMBoardDTO.setConcentration(Integer.parseInt(request.getParameter("concentration")));
		eSMBoardDTO.setActiveness(Integer.parseInt(request.getParameter("activeness")));
		eSMBoardDTO.setPower(Integer.parseInt(request.getParameter("power")));
		eSMBoardDTO.setSavedate(request.getParameter("savedate"));
		eSMBoardDTO.setId(request.getParameter("id"));
		
		// DB 처리하기
		int su = boardMapper.insertESM(eSMBoardDTO);
		
				
		// 메신저 보내기 및 url 요청 처리
		String message, path;
		
		if(su == 1) {
			message = "ESM 처리 성공~!";
			path = "/member/index";
		} else {
			message = "ESM 처리 실패~ ㅜㅜ";
			path = "/board/eSMForm";
		}
		return getMessage(request, message, path);
		
	}

	
	
}
