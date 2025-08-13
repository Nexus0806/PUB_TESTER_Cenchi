package egovframework.pubtest.board.service;

import java.util.List;

public class BoardDetailDTO {
	private int pstIdx;          // 게시글 고유번호 (INT)
    private String pstCate;      // 게시글 카테고리 (VARCHAR)
    private String pstTitle;     // 게시글 제목 (VARCHAR)
    private int pstCmtCnt;       // 댓글 수 (INT)
    private String pstRegdate;     // 작성일 (DATETIME)
    private int pstHit;          // 조회수 (INT)
    private int pstLike;         // 좋아요 수 (INT)
    private String authorNickname; // 닉네임
    
    private String pstCont;
    private String pstImg;
    
    private List<BoardCommentDTO> comments;
    
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
	public String getAuthorNickname() {
		return authorNickname;
	}
	public void setAuthorNickname(String authorNickname) {
		this.authorNickname = authorNickname;
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
	
	public List<BoardCommentDTO> getComments() {
		return comments;
	}
	public void setComments(List<BoardCommentDTO> comments) {
		this.comments = comments;
	}
    

}
