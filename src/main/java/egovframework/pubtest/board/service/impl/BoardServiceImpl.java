package egovframework.pubtest.board.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.pubtest.board.service.BoardService;
import egovframework.pubtest.board.service.BoardVO;
import egovframework.pubtest.board.service.BoardWriteDTO;
import egovframework.pubtest.board.service.BoardListDTO;
import egovframework.pubtest.board.service.BoardDetailDTO;
import egovframework.pubtest.board.service.BoardCommentDTO;

@Service("boardService")
@Transactional
public class BoardServiceImpl implements BoardService {

	@Resource(name = "boardDAO")
	private BoardDAO boardDAO;
	
	@Resource(name = "boardCommentDAO")
	private BoardCommentDAO boardCommentDAO; 
	
	@Override
	public List<BoardListDTO> selectBoardList(){
		return boardDAO.selectBoardList();
	}

	@Override
	public BoardDetailDTO selectBoardDetail(int pstIdx) {
		
		BoardDetailDTO detail = boardDAO.selectBoardDetail(pstIdx); 
	    if (detail != null) {
	        List<BoardCommentDTO> commentList = boardCommentDAO.selectBoardCommentList(pstIdx);
	        detail.setComments(commentList);
	    }
		return detail;
	}
	
	@Override
	public void insertBoardComment(BoardCommentDTO comment) {
		boardCommentDAO.insertBoardComment(comment);
	}
	
	@Override
	public void insertBoard(BoardWriteDTO board) {
		boardDAO.insertBoard(board);
	}

	
}
