package egovframework.pubtest.board.service.impl;

import java.util.List;
import java.util.Map;
import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import egovframework.pubtest.board.service.BoardListDTO;
import egovframework.pubtest.board.service.BoardSearchDTO;
import egovframework.pubtest.board.service.BoardWriteDTO;
import egovframework.pubtest.board.service.BoardDetailDTO;

@Repository("boardDAO")
public class BoardDAO extends EgovAbstractMapper{
	
	public List<BoardListDTO> selectBoardList(BoardSearchDTO searchDTO){
		return selectList("boardDAO.selectBoardList", searchDTO);
	}
	
	public BoardDetailDTO selectBoardDetail(Map<String, Object> params) {
		return selectOne("boardDAO.selectBoardDetail", params);
	}
	
	public void updateBoardHit(int pstIdx) {
		update("boardDAO.updateBoardHit", pstIdx);
	}
	
	public void insertBoard(BoardWriteDTO board) {
		insert("boardDAO.insertBoard", board);
	}
	
	public int selectBoardListTotalCount(BoardSearchDTO searchDTO) {
	    return selectOne("boardDAO.selectBoardListTotalCount", searchDTO);
	}
	
}
