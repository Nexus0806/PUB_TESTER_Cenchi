package egovframework.pubtest.board.service.impl;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;
import java.util.List;
import egovframework.pubtest.board.service.BoardCommentDTO;

@Repository("boardCommentDAO")
public class BoardCommentDAO extends EgovAbstractMapper{

	public List<BoardCommentDTO> selectBoardCommentList(int pstIdx) {
		return selectList("boardDAO.selectBoardCommmentList", pstIdx); 
	}
	
}
