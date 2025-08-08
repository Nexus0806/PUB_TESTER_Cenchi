package egovframework.pubtest.campaign.service;

import java.util.List;

public interface CampaignService {
	
	List<CampaignVO> selectCampaignList();
	
	CampaignVO selectCampaignDetail(int campIdx);
	
	void insertCampaignSubmit(CampaignSubmitVO submitVO);
}
