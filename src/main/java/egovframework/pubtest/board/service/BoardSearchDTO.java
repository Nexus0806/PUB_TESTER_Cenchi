package egovframework.pubtest.board.service;

public class BoardSearchDTO {
	private String category = "ALL";
	private String searchCondition;
	private String searchKeyword;
	private String myContent;   
    private int loginUserIdx;
    private int currentPageNo = 1;
    private int recordCountPerPage = 10;
    private int pageSize = 10;
    private int firstRecordIndex = 0;
    
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
	public int getCurrentPageNo() {
		return currentPageNo;
	}
	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
    public int getFirstRecordIndex() {
        return (this.currentPageNo - 1) * this.recordCountPerPage;
    }
	public void setFirstRecordIndex(int firstRecordIndex) {
		this.firstRecordIndex = firstRecordIndex;
	}
	
}
