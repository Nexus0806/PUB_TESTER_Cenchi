package egovframework.pubtest.board.web;

import java.util.List;
import java.util.Map;

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
import egovframework.pubtest.board.service.BoardSearchDTO;

@Controller
@RequestMapping("/preuser/board")
public class BoardController {
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@GetMapping("/boardList.do")
	public String boardList(
			@ModelAttribute("search") BoardSearchDTO searchDTO,
			@SessionAttribute(name = "LOGIN_USER", required = false) SessionUser loginUser,
			Model model) {
		
		searchDTO.setLoginUserIdx(loginUser.getIdx());
		
        Map<String, Object> resultMap = boardService.selectBoardList(searchDTO);
		
		model.addAttribute("boardList",  resultMap.get("boardList"));
        model.addAttribute("paginationInfo", resultMap.get("paginationInfo")); 
		
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
		
		//사진 저장 방법 미구현. 고치길 바람.
		
		if (loginUser == null) {
			return "redirect:/preuser/login.do"; 
		}
		
		if("inf".equals(loginUser.getType())) {
			board.setUserIdx(loginUser.getIdx());
		} else {
			board.setBussIdx(loginUser.getIdx());
		}
		if(board.getPstImg().equals("")) {
			board.setPstImg(null);
		}
			
		boardService.insertBoard(board);
		
		
		return "redirect:/preuser/board/boardList.do";
	}

}
