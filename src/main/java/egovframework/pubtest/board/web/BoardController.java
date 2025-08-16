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
		
		System.err.println(comment.toString());
		
		boardService.insertboardComment(comment);
		
        return "redirect:/preuser/board/boardView.do?pstIdx=" + comment.getPstIdx();
	}
	
	@RequestMapping("/boardWrite.do")
	public String boardWrite(Model model) {
		
		return "/preuser/board/boardWrite";
	}
	
}
