package egovframework.pubtest.campaign.web;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import egovframework.pubtest.campaign.service.CampaignService;

@Controller
public class CampaignController {

	@Resource(name = "campaignService")
	private CampaignService campaignService;
	
	
	@RequestMapping("preuser")
	
}
