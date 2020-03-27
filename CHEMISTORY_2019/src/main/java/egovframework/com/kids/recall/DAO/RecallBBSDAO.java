/**
 * @Name : RecallBBSDAO.java
 * @Description : 유해용품 리콜 DAO.
 * @author 이한구
 * @since 2016. 11. 17.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 11. 17.	이한구. 최초 생성.
 */
package egovframework.com.kids.recall.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.kids.recall.vo.RecallBBSVO;
import egovframework.com.kids.recall.vo.RecallMaterialVO;

@Repository("recallBBSDAO")
public class RecallBBSDAO extends EgovComAbstractDAO {

	/**
	 * 유해용품 리콜 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<RecallBBSVO> selectRecallBBSList(RecallBBSVO vo) throws Exception {
		return (List<RecallBBSVO>) list("RecallBBSDAO.selectRecallBBSList", vo);
	}
	
	/**
	 * 유해물지 통합검색
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<RecallBBSVO> selectRecallBBSList2(RecallBBSVO vo) throws Exception {
		return (List<RecallBBSVO>) list("RecallBBSDAO.selectRecallBBSList2", vo);
	}

	/**
	 * 유해용품 리콜 목록 수
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int selectRecallBBSCount(RecallBBSVO vo) throws Exception {
		return (Integer) select("RecallBBSDAO.selectRecallBBSCount", vo);
	}

	/**
	 * 유해용품 리콜 상세 정보
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public RecallBBSVO selectRecallBBS(RecallBBSVO vo) throws Exception {
		return (RecallBBSVO) select("RecallBBSDAO.selectRecallBBS", vo);
	}

	/**
	 * 유해용품 리콜 등록
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void insertRecallBBS(RecallBBSVO vo) throws Exception {
		insert("RecallBBSDAO.insertRecallBBS", vo);
	}

	/**
	 * 유해용품 유해인자 등록
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void insertRecallMaterial(RecallMaterialVO vo) throws Exception {
		insert("RecallBBSDAO.insertRecallMaterial", vo);
	}

	/**
	 * 유해용품 리콜 수정
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void updateRecallBBS(RecallBBSVO vo) throws Exception {
		update("RecallBBSDAO.updateRecallBBS", vo);
	}

	/**
	 * 유해용품 리콜 삭제
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void deleteRecallBBS(RecallBBSVO vo) throws Exception {
		delete("RecallBBSDAO.deleteRecallBBS", vo);
	}

	/**
	 * 유해용품 유해인자 리콜아이디로 삭제
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void deleteRecallMaterialByRecallId(String recallId) throws Exception {
		delete("RecallBBSDAO.deleteRecallMaterialByRecallId", recallId);
	}
	
	/**
	 * 첨부파일 삭제
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void deleteRecallBBSAtchFileId(RecallBBSVO vo) throws Exception {
		update("RecallBBSDAO.deleteRecallBBSAtchFileId", vo);
	}
	
	/**
	 * 조회수 증가
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void updateViewCount(RecallBBSVO vo) throws Exception {
		update("RecallBBSDAO.updateViewCount", vo);
	}
}
