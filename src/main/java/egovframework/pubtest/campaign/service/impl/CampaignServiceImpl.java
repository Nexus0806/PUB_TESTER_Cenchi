package egovframework.pubtest.campaign.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.pubtest.campaign.service.CampaignService;
import egovframework.pubtest.campaign.service.CampaignVO;

@Service("campaignService")
public class CampaignServiceImpl implements CampaignService {

    @Resource(name = "campaignDAO")
    private CampaignDAO campaignDAO;

    @Override
    public List<CampaignVO> selectCampaignList(CampaignVO vo) {
        return campaignDAO.selectCampaignList(vo);
    }

    @Override
    public CampaignVO selectCampaignView(CampaignVO vo) {
        return campaignDAO.selectCampaign(vo.getCampIdx());
    }

    @Override
    public void updatecampaignHits(String campaignNo) {
        campaignDAO.updateCampaignHits(Integer.parseInt(campaignNo));
    }

    @Override
    public void updatecampaign(CampaignVO vo) {
        campaignDAO.updateCampaign(vo);
    }

    @Override
    public void insertCampaign(CampaignVO vo) {
        campaignDAO.insertCampaign(vo);
    }

    @Override
    public void deleteCampaign(CampaignVO vo) {
        campaignDAO.deleteCampaign(vo.getCampIdx());
    }
}
