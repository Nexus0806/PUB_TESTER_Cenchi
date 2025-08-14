package egovframework.pubtest.mypage.web;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.ui.Model;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import egovframework.pubtest.campaign.service.CampaignVO;
import egovframework.pubtest.login.web.PubTesterLoginController.SessionUser;
import egovframework.pubtest.main.service.PubTesterMainVO;
import egovframework.pubtest.mypage.service.MypageService;
import egovframework.pubtest.util.PubTestUtil;

@Controller
@RequestMapping("/preuser/mypage")
public class MypageController {

    @Resource(name = "mypageService")
    private MypageService mypageService;
	
    // SessionAttribute 어노테이션으로 현재 로그인한 사용자 객체를 가져옴
    @RequestMapping("/mycampaign.do")
    public String loadMycampaign(@SessionAttribute(name = "LOGIN_USER", required = false) SessionUser loginUser,
    								Model model) {
    	if(loginUser == null) {
    		return "redirect:/preuser/member/login.do";
    	}
    	
    	List<CampaignVO> userCampList = mypageService.getUserCampList(loginUser.getIdx());
    	
    	for(CampaignVO row : userCampList)
		{			
			if(row.getCampStartdate() != null)
			{
				// localdate 이용하여 체험단까지 남은 D-Day 계산
				long dDay = PubTestUtil.calcDday(row.getCampStartdate());
				row.setdDay(dDay);
			}
		}
    	
    	model.addAttribute("campList", userCampList);
    	
    	return "preuser/mypage/mycampaign";
    }
}
