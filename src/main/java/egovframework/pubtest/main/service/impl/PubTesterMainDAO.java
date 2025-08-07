package egovframework.pubtest.main.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import egovframework.pubtest.main.service.PubTesterMainVO;

@Repository("pubTesterMainDAO")
public class PubTesterMainDAO extends EgovAbstractMapper{

	public List<PubTesterMainVO> getPopularCampaign(){
		return selectList("pubTesterMainDAO.selectPopularCampaignList");
	}
	
	public List<PubTesterMainVO> getNewCampaign() {
		return selectList("pubTesterMainDAO.selectNewCampaignList");
	}
	
	public List<PubTesterMainVO> getDeadlineCampaign() {
		return selectList("pubTesterMainDAO.selectDeadlineCampaignList");
	}
}
