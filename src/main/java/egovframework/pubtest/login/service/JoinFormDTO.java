package egovframework.pubtest.login.service;

import java.time.LocalDate;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;

// 회원가입 입력 폼 값 검증용
public class JoinFormDTO {

	//@NotBlank 어노테이션은, Valid 를 썼을때(컨트롤러에서) 자동으로 유효성을 검증해줌
	
	// 회원가입 유형 구분
    @NotBlank
    private String userType; // "inf" or "biz"

    // 이메일: mbEmail1(앞)@mbEmail2(뒤) 
    @NotBlank private String mbEmail1;
    @NotBlank private String mbEmail2; // 최종 도메인(직접입력 or select 반영)

    // 비밀번호
    @NotBlank private String password;
    @NotBlank private String password_Chk;

    // 이름, 성별
    @NotBlank private String mbName;
    @NotBlank private String gender; // "F" or "M"

    // 휴대폰 3분할 call1-call2-call3
    @NotBlank private String call1;
    @NotBlank private String call2;
    @NotBlank private String call3;

    // 생년월일 (input type="date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String birthDate;

    // 약관 동의 (필수)
    private String privacy1; // "prv01" (체크시 값 존재)
    private String privacy2; // "prv02"

    // 인플루언서 전용 입력 칸
    private String url_Blog;
    private String url_Insta;
    private String url_Youtube;
    private String url_Tiktok;
    private String url_ETC;
    
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getMbEmail1() {
		return mbEmail1;
	}
	public void setMbEmail1(String mbEmail1) {
		this.mbEmail1 = mbEmail1;
	}
	public String getMbEmail2() {
		return mbEmail2;
	}
	public void setMbEmail2(String mbEmail2) {
		this.mbEmail2 = mbEmail2;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword_Chk() {
		return password_Chk;
	}
	public void setPassword_Chk(String password_Chk) {
		this.password_Chk = password_Chk;
	}
	public String getMbName() {
		return mbName;
	}
	public void setMbName(String mbName) {
		this.mbName = mbName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getCall1() {
		return call1;
	}
	public void setCall1(String call1) {
		this.call1 = call1;
	}
	public String getCall2() {
		return call2;
	}
	public void setCall2(String call2) {
		this.call2 = call2;
	}
	public String getCall3() {
		return call3;
	}
	public void setCall3(String call3) {
		this.call3 = call3;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public String getPrivacy1() {
		return privacy1;
	}
	public void setPrivacy1(String privacy1) {
		this.privacy1 = privacy1;
	}
	public String getPrivacy2() {
		return privacy2;
	}
	public void setPrivacy2(String privacy2) {
		this.privacy2 = privacy2;
	}
	public String getUrl_Blog() {
		return url_Blog;
	}
	public void setUrl_Blog(String url_Blog) {
		this.url_Blog = url_Blog;
	}
	public String getUrl_Insta() {
		return url_Insta;
	}
	public void setUrl_Insta(String url_Insta) {
		this.url_Insta = url_Insta;
	}
	public String getUrl_Youtube() {
		return url_Youtube;
	}
	public void setUrl_Youtube(String url_Youtube) {
		this.url_Youtube = url_Youtube;
	}
	public String getUrl_Tiktok() {
		return url_Tiktok;
	}
	public void setUrl_Tiktok(String url_Tiktok) {
		this.url_Tiktok = url_Tiktok;
	}
	public String getUrl_ETC() {
		return url_ETC;
	}
	public void setUrl_ETC(String url_ETC) {
		this.url_ETC = url_ETC;
	}
	
	@AssertTrue(message = "채널 정보를 최소 1개 이상 입력해 주세요.")
    public boolean isAnyChannelProvided() {
        // 회원가입 유형이 인플루언서일 때만 검사
        if (!"inf".equals(userType)) {
        	System.err.println("@@@@@@@@@@@@@@@@@@@@소상공인 검증 테스트 : " + !"inf".equals(userType) +"@@@@@@@@@@@@@@@@@@@@@@@@");
            return true; // 소상공인은 패스
        }
        return (url_Blog != null && !url_Blog.trim().isEmpty()) ||
               (url_Insta != null && !url_Insta.trim().isEmpty()) ||
               (url_Youtube != null && !url_Youtube.trim().isEmpty()) ||
               (url_Tiktok != null && !url_Tiktok.trim().isEmpty()) ||
               (url_ETC != null && !url_ETC.trim().isEmpty());
    }
}
