package egovframework.pubtest.board.service.impl;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import java.util.Map;
import java.util.HashMap;

@Repository("boardLikeDAO")
public class BoardLikeDAO extends EgovAbstractMapper{
	
    public int checkLike(int pstIdx, int loginUserIdx) {
        Map<String, Object> params = new HashMap<>();
        params.put("pstIdx", pstIdx);
        params.put("loginUserIdx", loginUserIdx);
        return selectOne("boardLikeDAO.checkLike", params);
    }

    // 좋아요 추가
    public void insertLike(int pstIdx, int loginUserIdx) {
        Map<String, Object> params = new HashMap<>();
        params.put("pstIdx", pstIdx);
        params.put("loginUserIdx", loginUserIdx);
        insert("boardLikeDAO.insertLike", params);
    }

    // 좋아요 삭제
    public void deleteLike(int pstIdx, int loginUserIdx) {
        Map<String, Object> params = new HashMap<>();
        params.put("pstIdx", pstIdx);
        params.put("loginUserIdx", loginUserIdx);
        delete("boardLikeDAO.deleteLike", params);
    }

    // 게시물 테이블의 좋아요 총 수 업데이트
    public void updateLikeCount(int pstIdx) {
        update("boardLikeDAO.updateLikeCount", pstIdx);
    }
    
    // 최신 좋아요 정보 조회
    public Map<String, Object> getLikeInfo(int pstIdx, int loginUserIdx) {
        Map<String, Object> params = new HashMap<>();
        params.put("pstIdx", pstIdx);
        params.put("loginUserIdx", loginUserIdx);
        return selectOne("boardLikeDAO.getLikeInfo", params);
    }
    
}
