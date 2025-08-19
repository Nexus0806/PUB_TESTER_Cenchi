package egovframework.pubtest.board.service;

import java.util.Map;

public interface BoardService {
	
    Map<String, Object> selectBoardList(BoardSearchDTO searchDTO);
	
	BoardDetailDTO selectBoardDetail(int pstIdx, int loginUserIdx);
	
	void insertBoardComment(BoardCommentDTO comment);
	
    void updateBoardComment(BoardCommentDTO comment);
    
    void deleteBoardComment(int cmtIdx);
    
	void insertBoard(BoardWriteDTO board);

    void toggleLike(int pstIdx, int loginUserIdx);
    
    Map<String, Object> getLikeInfo(int pstIdx, int loginUserIdx);
    
}
