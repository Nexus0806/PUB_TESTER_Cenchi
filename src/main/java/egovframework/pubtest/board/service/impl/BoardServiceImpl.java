package egovframework.pubtest.board.service.impl;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.pubtest.board.service.BoardService;
import egovframework.pubtest.board.service.BoardVO;
import egovframework.pubtest.board.service.BoardWriteDTO;
import egovframework.pubtest.board.service.BoardListDTO;
import egovframework.pubtest.board.service.BoardSearchDTO;
import egovframework.pubtest.board.service.BoardDetailDTO;
import egovframework.pubtest.board.service.BoardCommentDTO;
import egovframework.pubtest.common.PaginationInfo;

@Service("boardService")
@Transactional
public class BoardServiceImpl implements BoardService {

	@Resource(name = "boardDAO")
	private BoardDAO boardDAO;
	
	@Resource(name = "boardCommentDAO")
	private BoardCommentDAO boardCommentDAO; 
	
	 @Override
	 public Map<String, Object> selectBoardList(BoardSearchDTO searchDTO) {
	        
	        // 1. 전체 게시물 수 조회 (Mapper에 추가한 COUNT 쿼리 호출)
		int totalCount = boardDAO.selectBoardListTotalCount(searchDTO);
	        
	        // 2. 페이징 정보 계산 객체 생성 및 값 설정
	    PaginationInfo paginationInfo = new PaginationInfo();
	    paginationInfo.setCurrentPageNo(searchDTO.getCurrentPageNo()); // 현재 페이지
	    paginationInfo.setRecordCountPerPage(searchDTO.getRecordCountPerPage()); // 페이지당 게시물 수
	    paginationInfo.setPageSize(searchDTO.getPageSize()); // 페이지 리스트 크기
	    paginationInfo.setTotalRecordCount(totalCount); // **전체 게시물 수**
	        
	        // 페이징 관련 모든 계산 실행
	    paginationInfo.init();
	        
	        // 3. SQL의 OFFSET에 사용할 값을 DTO에 설정 (계산된 값을 기반으로)
	        // DTO에 firstRecordIndex 필드와 setter가 있어야 합니다.
	    searchDTO.setFirstRecordIndex(paginationInfo.getFirstRecordIndex());
	        
	        // 4. 실제 목록 데이터 조회 (LIMIT, OFFSET이 적용된 쿼리 호출)
	    List<BoardListDTO> boardList = boardDAO.selectBoardList(searchDTO);
	        
	        // 5. 결과값을 Map에 담아 컨트롤러에 반환
	    Map<String, Object> resultMap = new HashMap<>();
	    resultMap.put("boardList", boardList);           // 실제 게시물 목록
	    resultMap.put("paginationInfo", paginationInfo); // 페이징 UI를 그릴 정보
	    
	    
	    return resultMap;
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
