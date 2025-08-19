package egovframework.pubtest.campaign.service;

public class CampaignCommentDTO {
	private int cmtIdx;
	private int campIdx;
	private String cmtCont;
	private int cmtAns;
	private String cmtRegdate;
	
	private int userIdx;
	private int bussIdx;
	private String authorNickname;

	private String cmtDelYn;

	public int getCmtIdx() {
		return cmtIdx;
	}

	public void setCmtIdx(int cmtIdx) {
		this.cmtIdx = cmtIdx;
	}

	public int getCampIdx() {
		return campIdx;
	}

	public void setCampIdx(int campIdx) {
		this.campIdx = campIdx;
	}

	public String getCmtCont() {
		return cmtCont;
	}

	public void setCmtCont(String cmtCont) {
		this.cmtCont = cmtCont;
	}

	public int getCmtAns() {
		return cmtAns;
	}

	public void setCmtAns(int cmtAns) {
		this.cmtAns = cmtAns;
	}

	public String getCmtRegdate() {
		return cmtRegdate;
	}

	public void setCmtRegdate(String cmtRegdate) {
		this.cmtRegdate = cmtRegdate;
	}

	public int getUserIdx() {
		return userIdx;
	}

	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}

	public int getBussIdx() {
		return bussIdx;
	}

	public void setBussIdx(int bussIdx) {
		this.bussIdx = bussIdx;
	}

	public String getAuthorNickname() {
		return authorNickname;
	}

	public void setAuthorNickname(String authorNickname) {
		this.authorNickname = authorNickname;
	}

	public String getCmtDelYn() {
		return cmtDelYn;
	}

	public void setCmtDelYn(String cmtDelYn) {
		this.cmtDelYn = cmtDelYn;
	}
}
