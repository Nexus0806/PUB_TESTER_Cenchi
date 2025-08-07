package egovframework.pubtest.campaign.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.pubtest.campaign.service.CampaignService;
import egovframework.pubtest.campaign.service.CampaignVO;

@Controller
public class CampaignController {

    @Resource(name = "campaignService")
    private CampaignService campaignService;

    @RequestMapping("/campaign/list.do")
    public String campaignList(CampaignVO searchVO, Model model) throws Exception {
        List<CampaignVO> campaignList = campaignService.selectCampaignList(searchVO);
        model.addAttribute("campaignList", campaignList);
        return "campaign/campaignList";
    }
}
