package egovframework.pubtest.common;

public class PaginationInfo {
    private int currentPageNo;
    private int recordCountPerPage;
    private int pageSize;
    private int totalRecordCount;
    
    // --- 계산이 필요한 필드 ---
    private int totalPageCount;
    private int firstPageNoOnPageList;
    private int lastPageNoOnPageList;
    private boolean hasPrevPage;
    private boolean hasNextPage;
    
    public void init() {
        totalPageCount = ((totalRecordCount - 1) / recordCountPerPage) + 1;
        firstPageNoOnPageList = ((currentPageNo - 1) / pageSize) * pageSize + 1;
        lastPageNoOnPageList = firstPageNoOnPageList + pageSize - 1;
        if (lastPageNoOnPageList > totalPageCount) {
            lastPageNoOnPageList = totalPageCount;
        }
        hasPrevPage = firstPageNoOnPageList != 1;
        hasNextPage = lastPageNoOnPageList < totalPageCount;
    }

    public int getFirstRecordIndex() {
        // 공식: (현재 페이지 번호 - 1) * 페이지당 게시물 수
        return (this.currentPageNo - 1) * this.recordCountPerPage;
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

	public int getTotalRecordCount() {
		return totalRecordCount;
	}

	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getFirstPageNoOnPageList() {
		return firstPageNoOnPageList;
	}

	public void setFirstPageNoOnPageList(int firstPageNoOnPageList) {
		this.firstPageNoOnPageList = firstPageNoOnPageList;
	}

	public int getLastPageNoOnPageList() {
		return lastPageNoOnPageList;
	}

	public void setLastPageNoOnPageList(int lastPageNoOnPageList) {
		this.lastPageNoOnPageList = lastPageNoOnPageList;
	}

	public boolean isHasPrevPage() {
		return hasPrevPage;
	}

	public void setHasPrevPage(boolean hasPrevPage) {
		this.hasPrevPage = hasPrevPage;
	}

	public boolean isHasNextPage() {
		return hasNextPage;
	}

	public void setHasNextPage(boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
	}


}
