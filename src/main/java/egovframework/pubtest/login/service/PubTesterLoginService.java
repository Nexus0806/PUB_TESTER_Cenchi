package egovframework.pubtest.login.service;

public interface PubTesterLoginService {
	
	void regUser(String type, UserRegVO vo);
	boolean chkEmail(String type, String email);
}
