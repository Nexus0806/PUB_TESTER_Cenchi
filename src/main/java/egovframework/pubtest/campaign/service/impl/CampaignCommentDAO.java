package egovframework.pubtest.campaign.service.impl;

import java.util.List;
import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import egovframework.pubtest.campaign.service.CampaignCommentDTO;

@Repository("campaignCommentDAO")
public class CampaignCommentDAO extends EgovAbstractMapper{
	
	public List<CampaignCommentDTO> selectCampaignCommentList(int campIdx){
		return selectList("campaignCommentDAO.selectCampaignCommentList", campIdx);
	}
	
	public void insertCampaignComment(CampaignCommentDTO comment) {
		insert("campaignCommentDAO.insertCampaignComment", comment);
	}
}
