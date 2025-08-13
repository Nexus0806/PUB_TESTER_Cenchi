package egovframework.pubtest.login.service;

import java.util.Map;

public interface PubTesterLoginService {
	
	void regUser(String type, UserRegVO vo);
	boolean chkEmail(String type, String email);
	Integer chklogin(Map<String, Object> param);
	String getNickName(String type, int idx);
}
