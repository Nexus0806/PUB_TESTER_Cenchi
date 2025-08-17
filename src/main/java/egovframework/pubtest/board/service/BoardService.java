package egovframework.pubtest.board.service;

import java.util.Map;

public interface BoardService {
	
    Map<String, Object> selectBoardList(BoardSearchDTO searchDTO);
	
	BoardDetailDTO selectBoardDetail(int pstIdx);
	
	void insertBoardComment(BoardCommentDTO comment);
	
	void insertBoard(BoardWriteDTO board);
	
}
