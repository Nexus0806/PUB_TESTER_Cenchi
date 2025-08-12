package egovframework.pubtest.login.service.impl;

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
		return selectOne("loginDAO.existByInfEmail");
	}
	
	public boolean chkBssEmail(String email) {
		return selectOne("loginDAO.existByBssEmail");
	}
}
