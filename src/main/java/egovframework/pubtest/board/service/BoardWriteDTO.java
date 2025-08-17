package egovframework.pubtest.board.service;

public class BoardWriteDTO {
	private String pstCate;
	private String pstTitle;
	private String pstCont;
    private String pstImg;
    private int userIdx;
    private int bussIdx;
    
	public String getPstCate() {
		return pstCate;
	}
	public void setPstCate(String pstCate) {
		this.pstCate = pstCate;
	}
	public String getPstTitle() {
		return pstTitle;
	}
	public void setPstTitle(String pstTitle) {
		this.pstTitle = pstTitle;
	}
	public String getPstCont() {
		return pstCont;
	}
	public void setPstCont(String pstCont) {
		this.pstCont = pstCont;
	}
	public String getPstImg() {
		return pstImg;
	}
	public void setPstImg(String pstImg) {
		this.pstImg = pstImg;
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

}
