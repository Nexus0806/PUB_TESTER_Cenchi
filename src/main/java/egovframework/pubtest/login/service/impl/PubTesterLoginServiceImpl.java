package egovframework.pubtest.login.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import egovframework.pubtest.login.service.PubTesterLoginService;
import egovframework.pubtest.login.service.UserRegVO;
import egovframework.pubtest.main.service.impl.PubTesterMainDAO;


@Service("loginService")
public class PubTesterLoginServiceImpl implements PubTesterLoginService{

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Resource(name = "loginDAO")
	private PubTesterLoginDAO pubTesterLoginDAO;
	
	// 회원가입
	@Override
	public void regUser(String type, UserRegVO vo) {
		vo.setUserPW(passwordEncoder.encode(vo.getUserPW()));	// 유저 비밀번호 해시로 암호화
		
		if("inf".equals(type))
			pubTesterLoginDAO.regInfUser(vo);
		else if("bss".equals(type))
			pubTesterLoginDAO.regBssUser(vo);
	}
	
	// 이메일 중복 확인
	@Override
	public boolean chkEmail(String type, String email){
		if("inf".equals(type))
			return pubTesterLoginDAO.chkInfEmail(email);
		else if("bss".equals(type))
			return pubTesterLoginDAO.chkBssEmail(email);
		return false;
	}
	
	// 로그인 확인
	@Override
	public Integer chklogin(Map<String, Object> param) {
		String type = (String) param.get("type");
        String id = (String) param.get("id");
        String pw = (String) param.get("pw");
        
        if (id == null || pw == null || type == null) return null;
		
        UserRegVO user;					// 유저 정보 임시 저장
		if("inf".equals(type))
			user = pubTesterLoginDAO.findInfByEmail(id);		// id 로 유저 찾아옴
		else if ("bss".equals(type))
			user = pubTesterLoginDAO.findBssByEmail(id);
		else
			return null;
		
		if(user == null) return null;
		
		if(passwordEncoder.matches(pw, user.getUserPW())) {		// 그렇게 찾아온 유저와 해시 비밀번호 비교
			return user.getUserIdx();
		}
		
		return null;
	}
	
	// 사용자 이름 표시
	@Override
	public String getNickName(String type, int idx){
		if("inf".equals(type))
			return pubTesterLoginDAO.getInfNickName(idx);
		else if("bss".equals(type))
			return pubTesterLoginDAO.getBssNickName(idx);
		return null;
	}
	
	@Override
	public void updateVisitCnt(String type, int idx) {
		if("inf".equals(type))
			pubTesterLoginDAO.updateInfVisitCnt(idx);
		else if("bss".equals(type))
			pubTesterLoginDAO.updateBssVisitCnt(idx);
	}
	
	/*
	@Override
	public int pwhasing() {
		List<UserRegVO> targets = pubTesterLoginDAO.pwhasing();
		
		int updated = 0;

        for (UserRegVO u : targets) {
        	System.err.println("idx : " + u.getUserIdx());
        	System.err.println("email : " + u.getUserEmail());
        	System.err.println("pw : " + u.getUserPW());
        	
            String raw = u.getUserPW();

            String hashed = passwordEncoder.encode(raw);
            Map<String,Object> p = new HashMap<>();
            p.put("userIdx", u.getUserIdx());
            p.put("hashedPw", hashed);
            pubTesterLoginDAO.updateUserPwHashed(p);
            updated++;
        }
        
        return updated;
	}
	*/
}
