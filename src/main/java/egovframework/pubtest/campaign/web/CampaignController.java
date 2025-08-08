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

import egovframework.pubtest.campaign.service.CampaignService;
import egovframework.pubtest.campaign.service.CampaignVO;
import egovframework.pubtest.campaign.service.CampaignSubmitVO;

@Controller
@RequestMapping("/preuser/campaign")
public class CampaignController {

	@Resource(name = "campaignService")
	private CampaignService campaignService;
	
	@RequestMapping("/list.do")
	public String CampaignList(Model model) {
		
		List<CampaignVO> list = campaignService.selectCampaignList();
		
		return "/preuser/campaign/list";
	}
	
	@GetMapping("detail.do")
	public String Campaigndetail(@RequestParam int campIdx, Model model) {
		
		CampaignVO campvo = campaignService.selectCampaignDetail(campIdx);
		
		model.addAttribute(campvo);
		
		//return "/preuser/campaign/detail";
		return "/preuser/campaign/list";
	}
	
	
	@GetMapping("submit.do")
	public String CampaignSubmitForm(@RequestParam int campIdx, Model model) {
		
		CampaignVO campvo = campaignService.selectCampaignDetail(campIdx);
		
		model.addAttribute(campvo);
		//return "/preuser/campaign/submit";
		return "/preuser/campaign/list";
	}
	
	@PostMapping("submit.do")
	public String CampaignSubmitProcess(
			@ModelAttribute CampaignSubmitVO submitVO, Model model, RedirectAttributes redirect) {
		
		/*
		 * 이 기능이 제대로 동작하려면, HTML <form> 안에 있는 <input> 태그의 name 속성이 CampaignSubmitVO의 필드명과 일치해야 합니다.
		 * @ModelAttribute
		 * 
		 */
		campaignService.insertCampaignSubmit(submitVO);
		
		redirect.addFlashAttribute("msg","신청되었습니다.");
		
		//return "/preuser/campaign/submit"; 리다이렉트 만들기 
		return "/preuser/campaign/list";
	}
	
}
