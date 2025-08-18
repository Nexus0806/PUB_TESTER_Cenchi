package egovframework.pubtest.campaign.service.impl;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import egovframework.pubtest.campaign.service.CampaignService;
import egovframework.pubtest.campaign.service.CampaignSubmitVO;
import egovframework.pubtest.campaign.service.CampaignVO;
import egovframework.pubtest.util.NumFomatter;
import egovframework.pubtest.util.PubTestUtil;

@Service("campaignService")
public class CampaignServiceImpl implements CampaignService{
	
    @Resource(name = "campaignDAO")
	private CampaignDAO campaignDAO;
    
    @Override
	public List<CampaignVO> selectCampaignList(){
    	List<CampaignVO> campaignList = campaignDAO.selectCampaignList();
    	for(CampaignVO row : campaignList) {
			if(row.getCampStartdate() != null)
			{
				long dDay = PubTestUtil.calcDday(row.getCampRecEnddate());
				row.setdDay(dDay);
			}
    	}
		return campaignList;
	}
    
    @Override 
    public CampaignVO selectCampaignDetail(int campIdx) {
    	
    	CampaignVO campVo = campaignDAO.selectCampaignDetail(campIdx);
    	
    	String reward = campVo.getCampReward();
    	String fomattedReward = NumFomatter.rewardFommatter(reward);
    	campVo.setCampReward(fomattedReward);
  
    	return campVo;
    }
    
    @Override
    public void insertCampaignSubmit(CampaignSubmitVO submitVO) {
    	campaignDAO.insertCampaignSubmit(submitVO);
    }
    
    @Override
    public List<CampaignVO> selectSerachCampaignList(Map map) {
    	return campaignDAO.selectSerachCampaignList(map);
    }
    
}
