package egovframework.pubtest.main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.pubtest.main.service.PubTesterMainService;
import egovframework.pubtest.main.service.PubTesterMainVO;

@Service("pubTesterMainService")
public class PubTesterMainServiceImpl implements PubTesterMainService{
	
	@Resource(name = "pubTesterMainDAO")
	private PubTesterMainDAO pubTesterMainDAO;

	@Override
	public List<PubTesterMainVO> getPopularCampaign() {
		return pubTesterMainDAO.getPopularCampaign();
	}

	@Override
	public List<PubTesterMainVO> getNewCampaign() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PubTesterMainVO> getDeadlineCampaign() {
		// TODO Auto-generated method stub
		return null;
	}
}
