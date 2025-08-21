package egovframework.pubtest.login.service;

import java.util.List;
import java.util.Map;

public interface PubTesterLoginService {
	
	void regUser(String type, UserRegVO vo);
	boolean chkEmail(String type, String email);
	Integer chklogin(Map<String, Object> param);
	String getNickName(String type, int idx);
	void updateVisitCnt(String type, int idx);

	//int pwhasing();
}
