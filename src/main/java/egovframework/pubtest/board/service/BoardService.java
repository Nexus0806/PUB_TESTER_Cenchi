package egovframework.pubtest.board.service;

import java.util.List;

public interface BoardService {
	
	List<BoardListDTO> selectBoardList();
	
	BoardDetailDTO selectBoardDetail(int pstIdx);
	
}
