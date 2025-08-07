
package egovframework.pubtest.service;

import java.util.List;

public interface UserService {
    void insertMember(UserVO vo);
    UserVO login(UserVO vo);

    void insertExperience(UserVO vo);
    List<UserVO> selectExperienceList();
    UserVO selectExperienceDetail(String expId);
}
