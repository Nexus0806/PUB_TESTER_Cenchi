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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.pubtest.campaign.service.CampaignService;
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
    
	@Resource(name = "campaignService")
	private CampaignService campaignService;
	
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
    
    @GetMapping("mycampaignEdit.do")
    public String editMyCampaignForm(@RequestParam("campIdx") int campIdx,
            @SessionAttribute(name = "LOGIN_USER", required = false) SessionUser loginUser,
            Model model, RedirectAttributes redirect) {
    	
    	if (loginUser == null) {
            redirect.addFlashAttribute("msg", "로그인이 필요합니다.");
            return "redirect:/preuser/member/login.do";
        }
    	
    	Map<String, Object> chkIdx = new HashMap<>();
    	chkIdx.put("userIdx", loginUser.getIdx());
    	chkIdx.put("campIdx", campIdx);
    	
    	CampaignSubmitVO info = mypageService.getUserCampSumitInfo(chkIdx);
    	CampaignVO campVo = campaignService.selectCampaignDetail(campIdx);
        String addr1 = "";	// 기본주소
        String addr2 = "";	// 상세 주소
    	
    	if(campVo.getCampStartdate() != null) // 체험단 모집 마감일 계산
		{
			long dDay = PubTestUtil.calcDday(campVo.getCampStartdate());
			campVo.setdDay(dDay);
		}
    	
    	// 주소 문자열 슬라이싱
    	if (info != null && info.getSumAddress() != null) {
            String sumAddress = info.getSumAddress();
            // 예시: "서울시 강남구 테헤란로 123 | 101동 202호"
            if (sumAddress.contains("|")) {
                String[] parts = sumAddress.split("\\|", 2);
                addr1 = parts[0].trim();
                addr2 = parts[1].trim();
            } else {
                addr2 = sumAddress; // 혹시 구분자가 없는 경우 전체를 기본주소로
            }
    	}
    	
    	model.addAttribute("submitInfo",info);
    	model.addAttribute("campVo", campVo);
    	model.addAttribute("addr1", addr1);
        model.addAttribute("addr2", addr2);
    	
    	return "/preuser/mypage/mycampaignEdit";
    }
    
    @PostMapping("mycampaignEdit.do")
    public String updateMyCampaignForm(@RequestParam("sumIdx") int sumIdx,
    		@ModelAttribute CampaignSubmitVO submitVo,
    		@SessionAttribute(name = "LOGIN_USER", required = false) SessionUser loginUser,
    		Model model, RedirectAttributes redirect) {
    	
    	if (loginUser == null) {
            redirect.addFlashAttribute("msg", "로그인이 필요합니다.");
            return "redirect:/preuser/member/login.do";
        }
    	
    	submitVo.setUserIdx(loginUser.getIdx());
    	
    	// 3) DB 업데이트 (WHERE 에 sum_idx + user_idx 로 소유자 검증)
        int updated = mypageService.updateMyCampaignSubmit(submitVo);

        if (updated != 1) {
            redirect.addFlashAttribute("msg", "수정 실패 또는 권한이 없습니다.");
            return "redirect:/preuser/mypage/mycampaign.do";
        }

        redirect.addFlashAttribute("msg", "신청 정보가 수정되었습니다.");
        return "redirect:/preuser/mypage/mycampaign.do";
    }
}
