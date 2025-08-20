package egovframework.pubtest.board.web;

import java.util.Map;
import java.util.UUID;
import java.util.HashMap;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

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
		
		return "/preuser/board/boardView";
	}
	
	@PostMapping("/updateComment.do")
	@ResponseBody // 이 메서드는 JSP 같은 뷰를 찾지 말고, 반환하는 값을 그대로 응답으로 보내줘! (JSON으로) 라는 어노테이션 
	public Map<String, Object> updateComment(@ModelAttribute BoardCommentDTO comment, 
			@SessionAttribute(name = "LOGIN_USER", required = false) SessionUser loginUser) {
		
        Map<String, Object> response = new HashMap<>();
        
        try {
        	boardService.updateBoardComment(comment); 
	        response.put("status", "success"); 
	        response.put("message", "댓글이 성공적으로 수정되었습니다.");
        }
        catch (Exception e) {
	        response.put("status", "fail"); 
	        response.put("message", "오류가 발생했습니다.");
        }
        return response;
    }
	
    @PostMapping("/deleteComment.do")
    @ResponseBody
    public Map<String, Object> deleteComment(@RequestParam("cmtIdx") int cmtIdx, 
    		@SessionAttribute(name = "LOGIN_USER", required = false) SessionUser loginUser) {
    	
        Map<String, Object> response = new HashMap<>();
            	
        try {
            boardService.deleteBoardComment(cmtIdx);
	        response.put("status", "success"); 
	        response.put("message", "댓글이 성공적으로 삭제되었습니다.");
        }
        catch (Exception e) {
	        response.put("status", "fail"); 
	        response.put("message", "오류가 발생했습니다.");
        }

    	return response;
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
			HttpServletRequest request,
			@SessionAttribute(name = "LOGIN_USER", required = false) SessionUser loginUser) {

		MultipartFile file = board.getPstImg();

        if (file != null && !file.isEmpty()) {
            try {
                // 2. 웹 애플리케이션의 루트 경로를 기준으로 실제 저장될 경로를 찾음
                //    webapp 폴더 하위에 'uploads' 라는 폴더를 생성하여 관리하는 것을 추천합니다.
                String uploadPath = request.getSession().getServletContext().getRealPath("/uploads/");

                // 3. (중요) 업로드할 폴더가 존재하지 않으면 생성
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }
                
                String originalFilename = file.getOriginalFilename();
                UUID uuid = UUID.randomUUID();
                String savedFilename = uuid.toString() + "_" + originalFilename;

                // 4. 최종 경로와 파일명으로 파일을 서버에 저장
                File saveFile = new File(uploadPath, savedFilename);
                file.transferTo(saveFile);

                // DTO에는 전체 경로가 아닌, 나중에 웹에서 접근할 상대 경로와 파일명만 저장
                // 예: "/uploads/저장된파일명.jpg"
                board.setDbSavedImgName(savedFilename);

            } catch (Exception e) {
                e.printStackTrace(); // 개발 중에는 에러를 확인하는 것이 좋습니다.
            }
        }
        

		if("inf".equals(loginUser.getType())) {
			board.setUserIdx(loginUser.getIdx());
		} else {
			board.setBussIdx(loginUser.getIdx());
		}
		
		
		boardService.insertBoard(board);


		return "redirect:/preuser/board/boardList.do";
	}
	

}
