package egovframework.pubtest.campaign.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import egovframework.pubtest.campaign.service.CampaignVO;

@Repository("campaignDAO")
public class CampaignDAO extends EgovAbstractMapper {

    public List<CampaignVO> selectCampaignList(CampaignVO vo) {
        return selectList("campaignDAO.selectCampaignList", vo);
    }

    public CampaignVO selectCampaign(int campIdx) {
        return selectOne("campaignDAO.selectCampaign", campIdx);
    }

    public void insertCampaign(CampaignVO campaignVO) {
        insert("campaignDAO.insertCampaign", campaignVO);
    }

    public void updateCampaign(CampaignVO campaignVO) {
        update("campaignDAO.updateCampaign", campaignVO);
    }

    public void deleteCampaign(int campIdx) {
        delete("campaignDAO.deleteCampaign", campIdx);
    }

    public void updateCampaignHits(int campIdx) {
        update("campaignDAO.updateCampaignHits", campIdx);
    }
}
