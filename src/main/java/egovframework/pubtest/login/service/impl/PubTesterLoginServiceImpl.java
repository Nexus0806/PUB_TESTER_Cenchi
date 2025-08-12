package egovframework.pubtest.login.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.pubtest.login.service.PubTesterLoginService;
import egovframework.pubtest.login.service.UserRegVO;
import egovframework.pubtest.main.service.impl.PubTesterMainDAO;

@Service("loginService")
public class PubTesterLoginServiceImpl implements PubTesterLoginService{

	@Resource(name = "loginDAO")
	private PubTesterLoginDAO pubTesterLoginDAO;
	
	@Override
	public void regUser(String type, UserRegVO vo) {
		if("inf".equals(type))
			pubTesterLoginDAO.regInfUser(vo);
		else if("bss".equals(type))
			pubTesterLoginDAO.regBssUser(vo);
	}
	
	@Override
	public boolean chkEmail(String type, String email){
		if("inf".equals(type))
			return pubTesterLoginDAO.chkInfEmail(email);
		else if("bss".equals(type))
			return pubTesterLoginDAO.chkBssEmail(email);
		
		return false;
	}
}
