
package egovframework.pubtest.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.pubtest.service.UserService;
import egovframework.pubtest.service.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Resource(name = "userDAO")
    private UserDAO userDAO;

    @Override
    public void insertMember(UserVO vo) {
        userDAO.insertMember(vo);
    }

    @Override
    public UserVO login(UserVO vo) {
        return userDAO.login(vo);
    }

    @Override
    public void insertExperience(UserVO vo) {
        userDAO.insertExperience(vo);
    }

    @Override
    public List<UserVO> selectExperienceList() {
        return userDAO.selectExperienceList();
    }

    @Override
    public UserVO selectExperienceDetail(String expId) {
        return userDAO.selectExperienceDetail(expId);
    }
}
