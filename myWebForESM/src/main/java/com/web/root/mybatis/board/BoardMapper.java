package com.web.root.mybatis.board;

import com.web.root.board.dto.ESMBoardDTO;

public interface BoardMapper {

	// ESM Board 삽입
	public int insertESM(ESMBoardDTO eSMBoardDTO);
	
}
