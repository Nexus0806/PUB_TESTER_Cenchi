package egovframework.admin.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;

import org.springframework.stereotype.Repository;

import egovframework.admin.service.BssUserVO;
import egovframework.admin.service.InfUserVO;

@Repository("adminDAO")
public class AdminDAO extends EgovAbstractMapper{

	public List<InfUserVO> getInfUserList() {
		return selectList("adminDAO.selectInfUserList");
	}
	
	public int countInfUserList() {
		return selectOne("adminDAO.countInfUserList");
	}
	
	public List<BssUserVO> getBssUserList() {
		return selectList("adminDAO.selectBssUserList");
	}
	
	public int countBssUserList() {
		return selectOne("adminDAO.countBssUserList");
	}
}
