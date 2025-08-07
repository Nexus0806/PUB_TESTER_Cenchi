package egovframework.pubtest.campaign.service;

import java.util.List;

public interface CampaignService {
	List<CampaignVO> selectCampaignList(CampaignVO vo);
	
	CampaignVO selectCampaignView(CampaignVO vo);
	void updatecampaignHits(String campaignNo);
	void updatecampaign(CampaignVO vo);
	void insertCampaign (CampaignVO vo);
	void deleteCampaign(CampaignVO vo);
	
}
