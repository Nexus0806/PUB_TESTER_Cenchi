package egovframework.pubtest.board.web;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.pubtest.board.service.BoardService;
import egovframework.pubtest.login.web.PubTesterLoginController.SessionUser;
import egovframework.pubtest.board.service.BoardDetailDTO;
import egovframework.pubtest.board.service.BoardListDTO;
import egovframework.pubtest.board.service.BoardCommentDTO;
import egovframework.pubtest.board.service.BoardWriteDTO;

@Controller
@RequestMapping("/preuser/board")
public class BoardController {
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@RequestMapping("/boardList.do")
	public String boardList(Model model) {
		
		List<BoardListDTO> boardList = boardService.selectBoardList();
		model.addAttribute("boardList", boardList);
		
		return "/preuser/board/boardList";
	}
	
	@GetMapping("/boardView.do")
	public String boardView(@RequestParam int pstIdx, Model model) {
		
		BoardDetailDTO board = boardService.selectBoardDetail(pstIdx);
		model.addAttribute("board", board);
		
		return "/preuser/board/boardView";
	}
	
	@PostMapping("/addComment.do")
	public String addComment(BoardCommentDTO comment,
			@SessionAttribute(name = "LOGIN_USER", required = false) SessionUser loginUser) {
		
		if(loginUser.getType().equals("inf")) {
			comment.setUserIdx(loginUser.getIdx());
		}
		else {
			comment.setBussIdx(loginUser.getIdx());
		}
		
		boardService.insertBoardComment(comment);
		
        return "redirect:/preuser/board/boardView.do?pstIdx=" + comment.getPstIdx();
	}
	
	@GetMapping("/boardWrite.do")
	public String boardWrite(Model model, @SessionAttribute(name = "LOGIN_USER", required = false) SessionUser loginUser) {
		
		return "/preuser/board/boardWrite";
	}
	
	@PostMapping("/addBoard.do")
	public String addBoard(@ModelAttribute BoardWriteDTO board,
			@SessionAttribute(name = "LOGIN_USER", required = false) SessionUser loginUser) {
		
		// 비로그인 사용자가 POST 요청을 보낼 경우 대비
		if (loginUser == null) {
			return "redirect:/preuser/login.do"; 
		}
		
		// DTO에 작성자 정보(세션) 설정
		if("inf".equals(loginUser.getType())) {
			board.setUserIdx(loginUser.getIdx());
		} else {
			board.setBussIdx(loginUser.getIdx());
		}

		// 파일 처리 로직은 여기에 추가해야 합니다.
		// (예: MultipartFile을 받아서 서버에 저장하고, 파일 정보를 board DTO에 설정)
		
		// 서비스를 호출하여 게시글 DB에 저장
		boardService.insertBoard(board);
		
		// 글 등록 후 목록 페이지로 리다이렉트
		return "redirect:/preuser/board/boardList.do";
	}

}
