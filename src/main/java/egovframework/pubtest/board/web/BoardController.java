package egovframework.pubtest.board.web;

import java.util.Map;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.pubtest.board.service.BoardCommentDTO;
import egovframework.pubtest.board.service.BoardDetailDTO;
import egovframework.pubtest.board.service.BoardSearchDTO;
import egovframework.pubtest.board.service.BoardService;
import egovframework.pubtest.board.service.BoardWriteDTO;
import egovframework.pubtest.login.web.PubTesterLoginController.SessionUser;

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
	public String boardView(@RequestParam int pstIdx,
			@SessionAttribute(name = "LOGIN_USER", required = false) SessionUser loginUser,
			Model model) {

		BoardDetailDTO board = boardService.selectBoardDetail(pstIdx, loginUser.getIdx());
		
		model.addAttribute("board", board);
		
		
		model.addAttribute("loginUserIdx", loginUser.getIdx());
		model.addAttribute("loginUserType", loginUser.getType());
		
		System.err.println(loginUser.getType());
		
		return "/preuser/board/boardView";
	}
	
	@PostMapping("/updateComment.do")
	@ResponseBody
	public String updateComment(@ModelAttribute BoardCommentDTO comment, 
			@SessionAttribute(name = "LOGIN_USER", required = false) SessionUser loginUser) {


        return "";
    }
	
    @PostMapping("/deleteComment.do")
    @ResponseBody
    public String deleteComment(@RequestParam("cmtIdx") int cmtIdx, 
    		@SessionAttribute(name = "LOGIN_USER", required = false) SessionUser loginUser) {
    	
    	
    	return "";
    }
	
	
	
	@PostMapping("/toggleLike.do")
	@ResponseBody 
	public Map<String, Object> toggleLike(@RequestParam int pstIdx,
	            @SessionAttribute(name = "LOGIN_USER", required = false) SessionUser loginUser) {

	        Map<String, Object> response = new HashMap<>();

	        if (loginUser == null) {
	            response.put("error", "로그인이 필요합니다.");
	            return response;
	        }

	        // Service에 좋아요 처리 요청
	        boardService.toggleLike(pstIdx, loginUser.getIdx());
	        
	        // 최신 좋아요 정보 조회
	        Map<String, Object> likeInfo = boardService.getLikeInfo(pstIdx, loginUser.getIdx());

	        return likeInfo; // { "isLiked": true, "likeCount": 13 } 와 같은 JSON 데이터로 변환되어 반환됩니다.
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
