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
	
	@RequestMapping("/campaignList.do")
	public String CampaignList(Model model) {
		
		/*List<CampaignVO> list = campaignService.selectCampaignList();*/
		
		return "/preuser/campaign/campaignList";
	}
	
	//@GetMapping("/campaignView.do")
	@RequestMapping("/campaignView.do")
	public String Campaigndetail(Model model) {
		//@RequestParam int campIdx
		/*
		CampaignVO campvo = campaignService.selectCampaignDetail(campIdx);
		
		model.addAttribute(campvo);
		*/
		
		return "/preuser/campaign/campaignView";
	}
	
	
	/*
	@GetMapping("/campaignSubmit.do")
	public String CampaignSubmitForm(@RequestParam int campIdx, Model model) {
		
		
		CampaignVO campvo = campaignService.selectCampaignDetail(campIdx);
		
		model.addAttribute(campvo);
		 
		
		return "/preuser/campaign/campaignSubmit";
	}
	*/
	
	@RequestMapping("/campaignSubmit.do")
	public String CampaignSubmitForm(Model model) {
		
		/*
		CampaignVO campvo = campaignService.selectCampaignDetail(campIdx);
		
		model.addAttribute(campvo);
		 */
		
		return "/preuser/campaign/campaignSubmit";
	}


	@PostMapping("/campaignSubmit.do")
	public String CampaignSubmitProcess(
			@ModelAttribute CampaignSubmitVO submitVO, Model model, RedirectAttributes redirect) {
		
		/*
		 * 이 기능이 제대로 동작하려면, HTML <form> 안에 있는 <input> 태그의 name 속성이 CampaignSubmitVO의 필드명과 일치해야 합니다.
		 * @ModelAttribute
		 * 
		 */
		
		campaignService.insertCampaignSubmit(submitVO);
		
		redirect.addFlashAttribute("msg","신청되었습니다.");
		
		return "/preuser/campaign/campaignSubmit";
	}
	
}
