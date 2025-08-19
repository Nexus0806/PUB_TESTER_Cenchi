package egovframework.pubtest.mypage.service;

import java.util.List;
import java.util.Map;

import egovframework.pubtest.campaign.service.CampaignSubmitVO;
import egovframework.pubtest.campaign.service.CampaignVO;

public interface MypageService {

	public List<CampaignVO> getUserCampList (int idx);
	
	public CampaignSubmitVO getUserCampSumitInfo (Map param);
}
