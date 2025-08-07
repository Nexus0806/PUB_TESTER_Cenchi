
package egovframework.pubtest.service.impl;

import java.util.List;

import egovframework.pubtest.service.UserVO;

public interface UserDAO {
    void insertMember(UserVO vo);
    UserVO login(UserVO vo);

    void insertExperience(UserVO vo);
    List<UserVO> selectExperienceList();
    UserVO selectExperienceDetail(String expId);
}
