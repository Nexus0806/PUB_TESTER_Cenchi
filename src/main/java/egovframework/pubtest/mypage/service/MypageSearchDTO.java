package egovframework.pubtest.mypage.service;

public class MypageSearchDTO {
	private String region;				// 지역
	private String category;			// 체험단 카테고리
	private String channel;				// 광고 채녈
	private String searchKeyword;		// 검색어
	private String type;				// 광고 유형
	private String sort;				// 정렬 유형
	
	@Override
	public String toString() {
		return "MypageSearchDTO [region=" + region + ", category=" + category + ", searchCondition="
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
