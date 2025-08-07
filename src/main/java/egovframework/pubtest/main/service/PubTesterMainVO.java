package egovframework.pubtest.main.service;

import java.time.LocalDateTime;

public class PubTesterMainVO {
	private String campTitle;
	private String campTumb;
	private String campAdType;
	private String campType;
	private String campService;
	private String campStartDate;
	private int campSumCount;
	private int campRecruite;
	private long dDay;
	
	public String getCampTitle() {
		return campTitle;
	}
	public void setCampTitle(String campTitle) {
		this.campTitle = campTitle;
	}
	public String getCampTumb() {
		return campTumb;
	}
	public void setCampTumb(String campTumb) {
		this.campTumb = campTumb;
	}
	public String getCampAdType() {
		return campAdType;
	}
	public void setCampAdType(String campAdType) {
		this.campAdType = campAdType;
	}
	public String getCampType() {
		return campType;
	}
	public void setCampType(String campType) {
		this.campType = campType;
	}
	public int getCampSumCount() {
		return campSumCount;
	}
	public void setCampSumCount(int campSumCount) {
		this.campSumCount = campSumCount;
	}
	public int getCampRecruite() {
		return campRecruite;
	}
	public void setCampRecruite(int campRecruite) {
		this.campRecruite = campRecruite;
	}
	public String getCampService() {
		return campService;
	}
	public void setCampService(String campService) {
		this.campService = campService;
	}
	public String getCampStartDate() {
		return campStartDate;
	}
	public void setCampStartDate(String campStartDate) {
		this.campStartDate = campStartDate;
	}
	public long getdDay() {
		return dDay;
	}
	public void setdDay(long dDay) {
		this.dDay = dDay;
	}
}
