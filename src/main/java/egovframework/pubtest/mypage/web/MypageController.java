package egovframework.pubtest.mypage.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.ui.Model;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.pubtest.mypage.service.MypageSearchDTO;

import egovframework.pubtest.campaign.service.CampaignSubmitVO;
import egovframework.pubtest.campaign.service.CampaignVO;
import egovframework.pubtest.login.web.PubTesterLoginController.SessionUser;
import egovframework.pubtest.mypage.service.MypageService;
import egovframework.pubtest.util.PubTestUtil;

@Controller
@RequestMapping("/preuser/mypage")
public class MypageController {

    @Resource(name = "mypageService")
    private MypageService mypageService;
	
    // SessionAttribute 어노테이션으로 현재 로그인한 사용자 객체를 가져옴
    @GetMapping("/mycampaign.do")
    public String loadMycampaign(
    		@ModelAttribute MypageSearchDTO mypageSearchDTO, 
    		@SessionAttribute(name = "LOGIN_USER", required = false) SessionUser loginUser,
    								Model model) {
    	
    	System.err.println(mypageSearchDTO.toString());
    	
    	if(loginUser == null) {
    		return "redirect:/preuser/member/login.do";
    	}
    	
    	List<CampaignVO> userCampList = mypageService.getUserCampList(loginUser.getIdx());
    	
    	for(CampaignVO row : userCampList)
		{			
			if(row.getCampStartdate() != null) // 체험단 모집 마감일 계산
			{
				long dDay = PubTestUtil.calcDday(row.getCampStartdate());
				row.setdDay(dDay);
			}
			
			if(row.getCampStartdate() != null)	// 체험단 리뷰 마감일 계산
			{
				long reviewDday = PubTestUtil.calcDday(row.getCampEnddate());
				row.setReviewDday(reviewDday);
			}
			
			if(row.getCampStartdate() != null)	// 체험단 발표일 계산
			{
				long selectDday = PubTestUtil.calcDday(row.getCampAnoDate());
				row.setSelectDday(selectDday);
			}
		}
    	
    	model.addAttribute("campList", userCampList);
    	
    	return "preuser/mypage/mycampaign";
    }
    
    @GetMapping("/filterMyCampaigns.do")
    @ResponseBody
    public List<CampaignVO> filterMyCampaigns(
    		@ModelAttribute MypageSearchDTO searchDTO,
            @SessionAttribute(name = "LOGIN_USER", required = false) SessionUser loginUser){
    	
    	/*
    	searchDTO.setUserId(loginUser.getUserId()); 

        // 3. Call the service to fetch the filtered campaign list from the database.
        List<CampaignVO> filteredCampaigns = mypageService.getFilteredMyCampaigns(searchDTO);
    	 */
        // 4. Return the list. Spring Boot will automatically convert it to a JSON array.
        return null;
    }
    
    @GetMapping("/mycampaignEdit.do")
    public String editMyCampaignForm(@RequestParam("campIdx") int campIdx,
            @SessionAttribute(name = "LOGIN_USER", required = false) SessionUser loginUser,
            Model model, RedirectAttributes redirect) {
    	
    	if (loginUser == null) {
            redirect.addFlashAttribute("msg", "로그인이 필요합니다.");
            return "redirect:/preuser/member/login.do";
        }
    	
    	Map<String, Object> chkIdx = new HashMap<>();
    	chkIdx.put("userIdx", loginUser.getIdx());
    	chkIdx.put(null, campIdx);
    	
    	CampaignSubmitVO info = mypageService.getUserCampSumitInfo(chkIdx);
    	model.addAttribute("submitInfo",info);
    	
    	return "/preuser/mypage/mycampaignEdit";
    }
    
    @PostMapping("")
    public String updateMyCampaignForm(Model model) {
    	
    	return "redirect:/preuser/mypage/mycampagin.do";
    }
}
