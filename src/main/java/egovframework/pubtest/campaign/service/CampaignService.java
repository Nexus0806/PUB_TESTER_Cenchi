package egovframework.pubtest.campaign.service;

import java.util.List;

public interface CampaignService {
	
	public List<CampaignVO> selectCampaignList();
	
	public CampaignVO selectCampaignDetail(int campIdx);
	
	public void insertCampaignSubmit(CampaignSubmitVO submitVO);
}
