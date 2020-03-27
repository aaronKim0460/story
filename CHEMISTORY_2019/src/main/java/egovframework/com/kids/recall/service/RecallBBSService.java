/**
 * @Name : RecallBBSService.java
 * @Description : 유해용품 리콜 service.
 * @author 이한구
 * @since 2016. 11. 17.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 11. 17.	이한구. 최초 생성.
 */
package egovframework.com.kids.recall.service;

import java.util.List;

import egovframework.com.kids.recall.vo.RecallBBSVO;

public interface RecallBBSService {

	/**
	 * 유해용품 리콜 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List<RecallBBSVO> selectRecallBBSList(RecallBBSVO vo) throws Exception;
	
	
	/** 유해물지 통합검색
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List<RecallBBSVO> selectRecallBBSList2(RecallBBSVO vo) throws Exception;

	/**
	 * 유해용품 리콜 목록 수
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	int selectRecallBBSCount(RecallBBSVO vo) throws Exception;

	/**
	 * 유해용품 리콜 상세 정보
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	RecallBBSVO selectRecallBBS(RecallBBSVO vo) throws Exception;

	/**
	 * 유해용품 리콜 등록
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void insertRecallBBS(RecallBBSVO vo) throws Exception;

	/**
	 * 유해용품 리콜 수정
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void updateRecallBBS(RecallBBSVO vo) throws Exception;

	/**
	 * 유해용품 리콜 삭제
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void deleteRecallBBS(RecallBBSVO vo) throws Exception;
	
	/**
	 * 유해용품 첨부파일 삭제
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void deleteRecallBBSAtchFileId(RecallBBSVO vo) throws Exception;
}
