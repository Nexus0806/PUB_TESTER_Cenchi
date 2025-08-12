package egovframework.pubtest.login.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.pubtest.login.service.PubTesterLoginService;

@Controller
@RequestMapping("/preuser/member")
public class PubTesterLoginController {

	@Resource(name = "loginService")
	private PubTesterLoginService pubTesterLoginService;
	
	@RequestMapping("login.do")
	public String infLogin(Model model){
		
		
		
		return "/preuser/member/login";
	}
	
}
