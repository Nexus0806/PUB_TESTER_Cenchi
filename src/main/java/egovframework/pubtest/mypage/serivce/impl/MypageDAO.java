package egovframework.pubtest.mypage.serivce.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import egovframework.pubtest.campaign.service.CampaignVO;

@Repository("mypageDAO")
public class MypageDAO extends EgovAbstractMapper{

	public List<CampaignVO> getUserCampList (int idx) {
		return selectList("mypageDAO.getUserCampList", idx);
	}
}
