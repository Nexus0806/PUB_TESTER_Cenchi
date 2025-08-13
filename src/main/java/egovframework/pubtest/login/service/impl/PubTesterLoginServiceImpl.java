package egovframework.pubtest.login.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.pubtest.login.service.PubTesterLoginService;
import egovframework.pubtest.login.service.UserRegVO;
import egovframework.pubtest.main.service.impl.PubTesterMainDAO;

@Service("loginService")
public class PubTesterLoginServiceImpl implements PubTesterLoginService{

	@Resource(name = "loginDAO")
	private PubTesterLoginDAO pubTesterLoginDAO;
	
	// 회원가입
	@Override
	public void regUser(String type, UserRegVO vo) {
		if("inf".equals(type))
			pubTesterLoginDAO.regInfUser(vo);
		else if("bss".equals(type))
			pubTesterLoginDAO.regBssUser(vo);
	}
	
	// 이메일 중복 확인
	@Override
	public boolean chkEmail(String type, String email){
		if("inf".equals(type))
			return pubTesterLoginDAO.chkInfEmail(email);
		else if("bss".equals(type))
			return pubTesterLoginDAO.chkBssEmail(email);
		return false;
	}
	
	// 로그인 확인
	@Override
	public Integer chklogin(Map<String, Object> param) {
		if("inf".equals(param.get("type")))
			return pubTesterLoginDAO.chkInfLogin(param);
		else if ("bss".equals(param.get("type")))
			return pubTesterLoginDAO.chkBssLogin(param);
		return null;
	}
	
	// 사용자 이름 표시
	@Override
	public String getNickName(String type, int idx){
		if("inf".equals(type))
			return pubTesterLoginDAO.getInfNickName(idx);
		else if("bss".equals(type))
			return pubTesterLoginDAO.getBssNickName(idx);
		return null;
	}
}
