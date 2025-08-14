package egovframework.pubtest.campaign.web;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.SessionAttribute;

import egovframework.pubtest.campaign.service.CampaignService;
import egovframework.pubtest.campaign.service.CampaignVO;
import egovframework.pubtest.util.PubTestUtil;
import egovframework.pubtest.campaign.service.CampaignSubmitVO;

import egovframework.pubtest.login.web.PubTesterLoginController.SessionUser;
import egovframework.pubtest.mypage.service.MypageService;

@Controller
@RequestMapping("/preuser/campaign")
public class CampaignController {
	
	@Resource(name = "campaignService")
	private CampaignService campaignService;
	
	@RequestMapping("/campaignList.do")
	public String CampaignList(Model model) {
		
		List<CampaignVO> list = campaignService.selectCampaignList();
		
		model.addAttribute("popCampList", list);
		
		return "/preuser/campaign/campaignList";
	}
	
	@GetMapping("/campaignView.do")
	public String Campaigndetail(@RequestParam int campIdx, Model model) {
		
		
		CampaignVO campVo = campaignService.selectCampaignDetail(campIdx);
			
			// date 날자 검증. null 혹은 비어있는지 확인.
		    String recStartDateStr = campVo.getCampRecStartdate(); 

		    if (recStartDateStr != null && !recStartDateStr.isEmpty()) {
		        model.addAttribute("baseDate", PubTestUtil.datetimeToDate(recStartDateStr));
		    } 
		    if (recStartDateStr != null && !recStartDateStr.isEmpty()) {
		        model.addAttribute("recStartDate", PubTestUtil.datetimeToDate(recStartDateStr));
		    }
		    
		    String recEndDateStr = campVo.getCampRecEnddate();
		    if (recEndDateStr != null && !recEndDateStr.isEmpty()) {
		        model.addAttribute("recEndDate", PubTestUtil.datetimeToDate(recEndDateStr));
		    }
		    
		    String reviewerDateStr = campVo.getCampAnoDate();
		    if (reviewerDateStr != null && !reviewerDateStr.isEmpty()) {
		        model.addAttribute("reviewerDate", PubTestUtil.datetimeToDate(reviewerDateStr));
		    }
		    
		    String expStartDateStr = campVo.getCampStartdate();
		    if (expStartDateStr != null && !expStartDateStr.isEmpty()) {
		        model.addAttribute("expStartDate", PubTestUtil.datetimeToDate(expStartDateStr));
		        model.addAttribute("campStartTime", PubTestUtil.datetimeToTime(expStartDateStr));
		    }
		    
		    String expEndDateStr = campVo.getCampEnddate();
		    if (expEndDateStr != null && !expEndDateStr.isEmpty()) {
		        model.addAttribute("expEndDate", PubTestUtil.datetimeToDate(expEndDateStr));
		        model.addAttribute("campEndTime", PubTestUtil.datetimeToTime(expEndDateStr));
		    }
		    
		String campStartTime = PubTestUtil.datetimeToTime(campVo.getCampStartdate());
		String campEndTime = PubTestUtil.datetimeToTime(campVo.getCampEnddate());
		
		String[] keyArray = campVo.getCampKeyword().split(",");
		
		model.addAttribute("campStartTime",campStartTime);
		model.addAttribute("campEndTime",campEndTime);
		model.addAttribute("keywordList", keyArray);
		model.addAttribute("campVo",campVo);
		
		
		
		return "/preuser/campaign/campaignView";
	}
	
	@GetMapping("/campaignSubmit.do")
	public String CampaignSubmitForm(@RequestParam int campIdx, Model model) {
		
		
		CampaignVO campVo = campaignService.selectCampaignDetail(campIdx);
		model.addAttribute("campVo",campVo);
		
		return "/preuser/campaign/campaignSubmit";
	}

	@PostMapping("/campaignSubmit.do")
	public String CampaignSubmitProcess(
			@ModelAttribute CampaignSubmitVO submitVo, 
			@SessionAttribute(name = "LOGIN_USER", required = false) SessionUser loginUser,
			Model model, RedirectAttributes redirect) {
		
		/* 현재 <input type="hidden" name="userIdx" value="${sessionScope.loginUser.userIdx}"> <%-- 예시: 세션에 저장된 사용자 정보 --%>
		 * 위의 세션 정보가 없어, userIdx가 비어있는 "" string 데이터를 사용하기 때문에 사용 불가. 
		 * 
		 * 이 기능이 제대로 동작하려면, HTML <form> 안에 있는 <input> 태그의 name 속성이 CampaignSubmitVO의 필드명과 일치해야 합니다.
		 * @ModelAttribute
		 * 
		 */
	    submitVo.setUserIdx(loginUser.getIdx());
	    
		System.err.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.err.println("sumIdx" + submitVo.getSumIdx());
		System.err.println("sumCont" + submitVo.getSumCont());
		System.err.println("sumAddress" + submitVo.getSumAddress());
		System.err.println("campIdx : " + submitVo.getCampIdx());
		System.err.println("userIdx : " + submitVo.getUserIdx());
	    
		//campaignService.insertCampaignSubmit(submitVo);
		redirect.addFlashAttribute("msg","신청되었습니다.");
		
	    return "redirect:/preuser/campaign/campaignView.do?campIdx=" + submitVo.getCampIdx();
	}
	
	@PostMapping("/campaignEdit.do")
	public String CampaignEditProcess(
			@ModelAttribute CampaignSubmitVO submitVo, 
			@SessionAttribute(name = "LOGIN_USER", required = false) SessionUser loginUser,
			Model model, RedirectAttributes redirect) {
		
		/* 현재 <input type="hidden" name="userIdx" value="${sessionScope.loginUser.userIdx}"> <%-- 예시: 세션에 저장된 사용자 정보 --%>
		 * 위의 세션 정보가 없어, userIdx가 비어있는 "" string 데이터를 사용하기 때문에 사용 불가. 
		 * 
		 * 이 기능이 제대로 동작하려면, HTML <form> 안에 있는 <input> 태그의 name 속성이 CampaignSubmitVO의 필드명과 일치해야 합니다.
		 * @ModelAttribute
		 * 
		 */
	    submitVo.setUserIdx(loginUser.getIdx());
	    
		System.err.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.err.println("sumIdx" + submitVo.getSumIdx());
		System.err.println("sumCont" + submitVo.getSumCont());
		System.err.println("sumAddress" + submitVo.getSumAddress());
		System.err.println("campIdx : " + submitVo.getCampIdx());
		System.err.println("userIdx : " + submitVo.getUserIdx());
	    
		//campaignService.insertCampaignSubmit(submitVo);
		redirect.addFlashAttribute("msg","신청되었습니다.");
		
	    return "redirect:/preuser/campaign/campaignView.do?campIdx=" + submitVo.getCampIdx();
	}
	
	
}
