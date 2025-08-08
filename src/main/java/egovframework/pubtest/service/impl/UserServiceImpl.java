package egovframework.pubtest.signin.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.pubtest.signin.service.UserService;
import egovframework.pubtest.signin.service.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource(name = "userDAO")
	private UserDAO userDAO;
	
	@Override
	public void insertUser(UserVO userVO) throws Exception {
		userDAO.insertUser(userVO);
	}
}
