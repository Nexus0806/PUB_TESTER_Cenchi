package egovframework.pubtest.signin.service.impl;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import egovframework.pubtest.signin.service.UserVO;

@Repository("userDAO")
public class UserDAO extends EgovAbstractMapper {

	public void insertUser(UserVO userVO) {
		insert("UserDAO.insertUser", userVO);
		
	}

}
