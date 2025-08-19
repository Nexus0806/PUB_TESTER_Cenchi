package egovframework.pubtest.mypage.serivce.impl;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import egovframework.pubtest.campaign.service.CampaignSubmitVO;
import egovframework.pubtest.campaign.service.CampaignVO;

@Repository("mypageDAO")
public class MypageDAO extends EgovAbstractMapper{

	public List<CampaignVO> getUserCampList (int idx) {
		return selectList("mypageDAO.getUserCampList", idx);
	}
	
	public CampaignSubmitVO getUserCampSumitInfo(Map param) {
		return selectOne("mypageDAO.getUserCampSubmit", param);
	}
	
	public int updateMyCampaignSubmit(CampaignSubmitVO vo) {
		return update("mypageDAO.updateMyCampaignSubmit", vo);
	}
}
