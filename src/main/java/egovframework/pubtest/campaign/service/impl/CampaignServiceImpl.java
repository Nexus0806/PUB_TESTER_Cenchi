package egovframework.pubtest.campaign.service.impl;
import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import egovframework.pubtest.campaign.service.CampaignService;
import egovframework.pubtest.campaign.service.CampaignSubmitVO;
import egovframework.pubtest.campaign.service.CampaignVO;

@Service("campaignService")
public class CampaignServiceImpl implements CampaignService{
	
    @Resource(name = "campaignDAO")
	private CampaignDAO campaignDAO;
    
    @Override
	public List<CampaignVO> selectCampaignList(){
		return campaignDAO.selectCampaignList();
	}
    
    @Override 
    public CampaignVO selectCampaignDetail(int campIdx) {
    	return campaignDAO.selectCampaignDetail(campIdx);
    }
    
    @Override
    public void insertCampaignSubmit(CampaignSubmitVO submitVO) {
    	campaignDAO.insertCampaignSubmit(submitVO);
    }
    
}
