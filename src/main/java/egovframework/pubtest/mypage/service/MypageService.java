package egovframework.pubtest.mypage.service;

import java.util.List;

import egovframework.pubtest.campaign.service.CampaignVO;

public interface MypageService {

	public List<CampaignVO> getUserCampList (int idx);
}
