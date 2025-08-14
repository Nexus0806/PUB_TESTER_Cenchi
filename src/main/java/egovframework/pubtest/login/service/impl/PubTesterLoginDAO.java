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
	
	public Integer chkInfLogin(Map<String, Object> param){
		return selectOne("loginDAO.chkInfLogin", param);
	}
	
	public Integer chkBssLogin(Map<String, Object> param){
		return selectOne("loginDAO.chkBssLogin", param);
	}
	
	public String getInfNickName(int idx) {
		return selectOne("loginDAO.getInfNickName", idx);
	}
	
	public String getBssNickName(int idx) {
		return selectOne("loginDAO.getBssNickName", idx);
	}
	
	public void updateInfVisitCnt(int idx){
		update("loginDAO.updateInfVisitCnt", idx);
	}
	
	public void updateBssVisitCnt(int idx){
		update("loginDAO.updateBssVisitCnt", idx);
	}

}
