package egovframework.pubtest.signin.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.pubtest.signin.service.UserService;
import egovframework.pubtest.signin.service.UserVO;

@Controller
public class UserController {

	// Service 호출을 위한 의존성 주입
	@Resource(name="userService")
	private UserService userService;

	/**
     * 회원가입 화면 이동
     * URL: /signupForm.do
     */
	@RequestMapping("/signup.do")
	public String signinForm() {
		return "signin/userJoin";
	}
	
	
	/**
	 * 회원가입 처리
	 * URL: /signup.do(POST 방식)
	 */
	@PostMapping("/signup.do")
	public String signup(UserVO userVO) throws Exception {
		userService.insertUser(userVO); //회원가입 처리
		return "redirect:/signupSuccess.do";
	}
	

}
