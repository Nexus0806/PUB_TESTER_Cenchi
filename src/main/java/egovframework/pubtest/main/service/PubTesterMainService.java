package egovframework.pubtest.main.service;

import java.util.List;

public interface PubTesterMainService {
	
	public abstract List<PubTesterMainVO> getPopularCampaign();
	public abstract List<PubTesterMainVO> getNewCampaign();
	public abstract List<PubTesterMainVO> getDeadlineCampaign();
}
