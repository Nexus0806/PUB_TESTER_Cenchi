package egovframework.pubtest.mypage.serivce.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.pubtest.mypage.service.MypageService;

@Service("mypageService")
public class MypageServiceImpl implements MypageService {

	@Resource(name = "mypageDAO")
	private MypageDAO mypageDAO;
}
