package com.web.root.mybatis.board;

import java.util.List;

import com.web.root.board.dto.ESMBoardDTO;

public interface BoardMapper {

	// ESM Board 삽입
	public int insertESM(ESMBoardDTO eSMBoardDTO);
	
	// ESM List 받아오기 - by id
	public List<ESMBoardDTO> getESMBoardById(String id);
	
}
