package egovframework.pubtest.campaign.service;

import java.util.List;
import java.util.Map;


public interface CampaignService {
	
	List<CampaignVO> selectCampaignList();
	
	CampaignVO selectCampaignDetail(int campIdx);
	
	List<CampaignCommentDTO> selectCampaignCommentList(int campIdx);
	
	void insertCampaignComment(CampaignCommentDTO comment);
	
	void insertCampaignSubmit(CampaignSubmitVO submitVO);
	
	List<CampaignVO> selectSerachCampaignList(Map param);
	
}
