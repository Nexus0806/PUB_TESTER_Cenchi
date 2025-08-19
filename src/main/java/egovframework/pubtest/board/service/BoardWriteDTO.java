package egovframework.pubtest.board.service;

import org.springframework.web.multipart.MultipartFile; 

public class BoardWriteDTO {
	private String pstCate;
	private String pstTitle;
	private String pstCont;
    private MultipartFile pstImg;
    private String DbSavedImgName;

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
	
    public MultipartFile getPstImg() {
		return pstImg;
	}
	public void setPstImg(MultipartFile pstImg) {
		this.pstImg = pstImg;
	}
	
	public String getDbSavedImgName() {
		return DbSavedImgName;
	}
	public void setDbSavedImgName(String dbSavedImgName) {
		DbSavedImgName = dbSavedImgName;
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
