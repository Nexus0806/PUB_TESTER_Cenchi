package egovframework.pubtest.board.service;

public class BoardSearchDTO {
	private String category = "ALL";
	private String searchCondition;
	private String searchKeyword;
	private String myContent;   
    private int loginUserIdx;
    
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
	public String getMyContent() {
		return myContent;
	}
	public void setMyContent(String myContent) {
		this.myContent = myContent;
	}
	public int getLoginUserIdx() {
		return loginUserIdx;
	}
	public void setLoginUserIdx(int loginUserIdx) {
		this.loginUserIdx = loginUserIdx;
	}
	
}
