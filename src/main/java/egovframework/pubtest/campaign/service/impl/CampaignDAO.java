package egovframework.pubtest.campaign.service.impl;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import egovframework.pubtest.campaign.service.CampaignSubmitVO;
import egovframework.pubtest.campaign.service.CampaignVO;


@Repository("campaignDAO")
public class CampaignDAO extends EgovAbstractMapper {
	
	public List<CampaignVO> selectCampaignList(){
		return selectList("campaignDAO.selectCampaignList");
	}
	
	public CampaignVO selectCampaignDetail(int campIdx) {
		return selectOne("campaignDAO.selectCampaignDetail", campIdx);
	}
	
	public void insertCampaignSubmit(CampaignSubmitVO submitVO) {
		insert("campaignDAO.insertCampaignSubmit", submitVO);
	}
	
	public List<CampaignVO> selectSerachCampaignList(Map param) {
		return selectList("campaignDAO.selectSerchCampaignList", param);
	}
}
