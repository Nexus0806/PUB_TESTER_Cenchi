package egovframework.pubtest.login.service;

import java.time.LocalDate;

public class UserRegVO {
	private String userEmail;		//이메일
	private String userPW;			//비밀번호
	private String userName;		//실명
	private String userPhone;		//전화번호
	private LocalDate userBirth;	//생일
	private String userGender;		//성별
	
	private String userBlog;		//블로그url
	private String userInsta;		//인스타url
	private String userYoutube;		//유튜브url
	private String userTiktok;		//틱톡url
	private String userETC;			//기타url
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPW() {
		return userPW;
	}
	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public LocalDate getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(LocalDate userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserBlog() {
		return userBlog;
	}
	public void setUserBlog(String userBlog) {
		this.userBlog = userBlog;
	}
	public String getUserInsta() {
		return userInsta;
	}
	public void setUserInsta(String userInsta) {
		this.userInsta = userInsta;
	}
	public String getUserYoutube() {
		return userYoutube;
	}
	public void setUserYoutube(String userYoutube) {
		this.userYoutube = userYoutube;
	}
	public String getUserTiktok() {
		return userTiktok;
	}
	public void setUserTiktok(String userTiktok) {
		this.userTiktok = userTiktok;
	}
	public String getUserETC() {
		return userETC;
	}
	public void setUserETC(String userETC) {
		this.userETC = userETC;
	}
}
