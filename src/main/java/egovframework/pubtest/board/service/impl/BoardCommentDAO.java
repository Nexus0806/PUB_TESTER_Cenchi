package egovframework.pubtest.board.service.impl;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;
import java.util.List;
import egovframework.pubtest.board.service.BoardCommentDTO;

@Repository("boardCommentDAO")
public class BoardCommentDAO extends EgovAbstractMapper{

	public List<BoardCommentDTO> selectBoardCommentList(int pstIdx) {
		return selectList("boardCommentDAO.selectBoardCommentList", pstIdx); 
	}
	
	public void insertboardComment(BoardCommentDTO comment) {
		insert("boardCommentDAO.insertboardComment", comment);
	}
	
}
