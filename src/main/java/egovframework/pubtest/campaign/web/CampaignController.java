package egovframework.pubtest.campaign.web;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.pubtest.campaign.service.CampaignService;
import egovframework.pubtest.campaign.service.CampaignVO;
import egovframework.pubtest.util.PubTestUtil;
import egovframework.pubtest.campaign.service.CampaignSubmitVO;
import egovframework.pubtest.campaign.service.CampaignSearchDTO;

import egovframework.pubtest.login.web.PubTesterLoginController.SessionUser;
import egovframework.pubtest.main.service.PubTesterMainVO;
import egovframework.pubtest.mypage.service.MypageService;

@Controller
@RequestMapping("/preuser/campaign")
public class CampaignController {
	
	@Resource(name = "campaignService")
	private CampaignService campaignService;
	
	@GetMapping("/campaignList.do")
	public String CampaignList(
			@ModelAttribute CampaignSearchDTO campaignSearchDTO,
			Model model) {
		
		List<CampaignVO> list = campaignService.selectCampaignList();
		
		System.err.println(campaignSearchDTO.toString());
		
		model.addAttribute("popCampList", list);
		
		return "/preuser/campaign/campaignList";
	}
	
	// 검색어 설정해서 체험단 검색시, 이쪽 컨트롤러로
	@GetMapping("/filterCampaigns.do")
	@ResponseBody	// 필터링 결과를 JSON 타입으로 반환, 필터링 할 정보는 campaignDTO 에 넣어서 전달(jsp 에서 처리함)
	public List<CampaignVO> filterCampaigns(@ModelAttribute CampaignSearchDTO campaignSearchDTO) {
		System.err.println(campaignSearchDTO.toString());
		
		Map<String, Object> filter = new HashMap<>();
		filter.put("region", campaignSearchDTO.getRegion());
		filter.put("category", campaignSearchDTO.getCategory());
		filter.put("channel", campaignSearchDTO.getChannel());
		filter.put("keyword", campaignSearchDTO.getSearchKeyword());
		filter.put("adtype", campaignSearchDTO.getType());
		filter.put("sort", campaignSearchDTO.getSort());
		
		List<CampaignVO> filteredList = campaignService.selectSerachCampaignList(filter);
		
		for(CampaignVO row : filteredList)
		{			
			if(row.getCampRecEnddate() != null)
			{
				// localdate 이용하여 체험단까지 남은 D-Day 계산
				long dDay = PubTestUtil.calcDday(row.getCampRecEnddate());
				row.setdDay(dDay);
			}
		}

		return filteredList;
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
