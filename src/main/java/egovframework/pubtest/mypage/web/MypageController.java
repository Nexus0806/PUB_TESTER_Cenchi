package egovframework.pubtest.mypage.web;

import javax.annotation.Resource;
import org.springframework.ui.Model;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.pubtest.mypage.service.MypageService;

@Controller
@RequestMapping("/preuser/mypage")
public class MypageController {

    @Resource(name = "mypageService")
    private MypageService mypageService;
	
    @RequestMapping("/mycampaign.do")
    public String loadMycampaign(Model model) {
    	
    	return "preuser/mypage/mycampaign";
    }
}
