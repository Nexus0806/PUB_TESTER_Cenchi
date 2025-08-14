package egovframework.pubtest.mypage.serivce.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.pubtest.campaign.service.CampaignVO;
import egovframework.pubtest.mypage.service.MypageService;

@Service("mypageService")
public class MypageServiceImpl implements MypageService {

	@Resource(name = "mypageDAO")
	private MypageDAO mypageDAO;
	
	public List<CampaignVO> getUserCampList (int idx) {
		return mypageDAO.getUserCampList(idx);
	}
}
