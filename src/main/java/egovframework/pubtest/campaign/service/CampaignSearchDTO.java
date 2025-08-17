package egovframework.pubtest.campaign.service;

public class CampaignSearchDTO {
	private String region;
	private String category;
	private String searchCondition;
	private String searchKeyword;
	private String channel;
	private String type;
	private String sort;
	@Override
	public String toString() {
		return "CampaignSearchDTO [region=" + region + ", category=" + category + ", searchCondition=" + searchCondition
				+ ", searchKeyword=" + searchKeyword + ", channel=" + channel + ", type=" + type + ", sort=" + sort
				+ "]";
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getChannel() {
		return channel;
	}
	public void setChannel(String channel) {
		this.channel = channel;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	
}
