package egovframework.pubtest.board.service;

public class BoardVO {
	private int pstIdx;
    private String pstCate;
    private String pstTitle;
    private int pstCmtCnt;
    private int userIdx; 
    private int bussIdx; 
    private String pstRegdate;
    private int pstHit;
    private int pstLike;
    private String pstCont;
    private String pstImg;
    private String pstDelyn; 
    
	public int getPstIdx() {
		return pstIdx;
	}
	public void setPstIdx(int pstIdx) {
		this.pstIdx = pstIdx;
	}
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
	public int getPstCmtCnt() {
		return pstCmtCnt;
	}
	public void setPstCmtCnt(int pstCmtCnt) {
		this.pstCmtCnt = pstCmtCnt;
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
	public String getPstRegdate() {
		return pstRegdate;
	}
	public void setPstRegdate(String pstRegdate) {
		this.pstRegdate = pstRegdate;
	}
	public int getPstHit() {
		return pstHit;
	}
	public void setPstHit(int pstHit) {
		this.pstHit = pstHit;
	}
	public int getPstLike() {
		return pstLike;
	}
	public void setPstLike(int pstLike) {
		this.pstLike = pstLike;
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
	public String getPstDelyn() {
		return pstDelyn;
	}
	public void setPstDelyn(String pstDelyn) {
		this.pstDelyn = pstDelyn;
	}
}
