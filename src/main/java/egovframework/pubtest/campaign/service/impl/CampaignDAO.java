package egovframework.pubtest.campaign.service.impl;

import java.util.List;
import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import egovframework.pubtest.campaign.service.CampaignVO;


@Repository("campaignDAO")
public class CampaignDAO extends EgovAbstractMapper {
	
	public List<CampaignVO> selectCampaignList(){
		return selectList("campaignDAO.selectCampaignList");
	}
	
}
