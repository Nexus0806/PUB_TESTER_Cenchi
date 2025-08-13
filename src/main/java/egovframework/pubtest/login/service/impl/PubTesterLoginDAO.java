package egovframework.pubtest.login.service.impl;

import java.util.Map;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;
import egovframework.pubtest.login.service.UserRegVO;

@Repository("loginDAO")
public class PubTesterLoginDAO extends EgovAbstractMapper{

	public void regInfUser(UserRegVO vo) {
		insert("loginDAO.regInfUser",vo);
	}
	
	public void regBssUser(UserRegVO vo) {
		insert("loginDAO.regBssUser",vo);
	}
	
	public boolean chkInfEmail(String email) {
		return selectOne("loginDAO.existByInfEmail", email);
	}
	
	public boolean chkBssEmail(String email) {
		return selectOne("loginDAO.existByBssEmail", email);
	}
	
	public boolean chkInfLogin(Map<String, Object> param){
		return selectOne("loginDAO.chkInfLogin", param);
	}
	
	public boolean chkBssLogin(Map<String, Object> param){
		return selectOne("loginDAO.chkBssLogin", param);
	}
}
