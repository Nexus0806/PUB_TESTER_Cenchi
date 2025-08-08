package egovframework.pubtest.campaign.service;

public class CampaignSubmitVO {
	private int sumIdx;
	private String sumCont;
	private String sumAddress;
	private int campIdx;
	private int userIdx;
	
	public int getSumIdx() {
		return sumIdx;
	}
	public void setSumIdx(int sumIdx) {
		this.sumIdx = sumIdx;
	}
	public String getSumCont() {
		return sumCont;
	}
	public void setSumCont(String sumCont) {
		this.sumCont = sumCont;
	}
	public String getSumAddress() {
		return sumAddress;
	}
	public void setSumAddress(String sumAddress) {
		this.sumAddress = sumAddress;
	}
	public int getCampIdx() {
		return campIdx;
	}
	public void setCampIdx(int campIdx) {
		this.campIdx = campIdx;
	}
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}
}
