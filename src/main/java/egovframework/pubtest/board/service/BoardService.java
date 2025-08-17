package egovframework.pubtest.board.service;

import java.util.List;

public interface BoardService {
	
	List<BoardListDTO> selectBoardList(String category);
	
	BoardDetailDTO selectBoardDetail(int pstIdx);
	
	void insertBoardComment(BoardCommentDTO comment);
	
	void insertBoard(BoardWriteDTO board);
}
