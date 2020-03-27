/**
 * @Name : BBSKeywordDAO.java
 * @Description : 샵태그 검색DAO.
 * @author 이한구
 * @since 2016. 11. 2.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 11. 2.	이한구. 최초 생성.
 */
package egovframework.com.cop.bbs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.cop.bbs.service.BBSKeyword;
import egovframework.com.cop.bbs.service.BBSKeywordVO;
import egovframework.com.cop.bbs.service.TotalSearchResultVO;

@Repository("BBSKeywordDAO")
public class BBSKeywordDAO extends EgovComAbstractDAO {

	/**
	 * 샵태그 검색을 등록한다.
	 * 
	 * @param BBSKeyword
	 * @throws Exception
	 */
	public void insertBBSKeyword(BBSKeyword BBSKeyword) throws Exception {
		insert("BBSKeywordDAO.insertBBSKeyword", BBSKeyword);
	}

	/**
	 * 샵태그 검색을 삭제한다.
	 * 
	 * @param BBSKeyword
	 * @throws Exception
	 */
	public void deleteBBSKeywordByBbsKeys(BBSKeyword BBSKeyword) throws Exception {
		delete("BBSKeywordDAO.deleteBBSKeywordByBbsKeys", BBSKeyword);
	}

	/**
	 * 키워드 검색한 전체 게시판명 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BBSKeywordVO> selectAllBbsMstByKeyword(BBSKeywordVO vo) throws Exception {
		return (List<BBSKeywordVO>) list("BBSKeywordDAO.selectAllBbsMstByKeyword", vo);
	}

	/**
	 * 키워드 검색한 게시판별 글 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<TotalSearchResultVO> selectAllBbsByKeyword(TotalSearchResultVO vo) throws Exception {
		return (List<TotalSearchResultVO>) list("BBSKeywordDAO.selectAllBbsByKeyword", vo);
	}
	
	/**
	 * 통합 검색한 전체 게시판명 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BBSKeywordVO> selectAllBbsMstForTotalSearch(BBSKeywordVO vo) throws Exception {
		return (List<BBSKeywordVO>) list("BBSKeywordDAO.selectAllBbsMstForTotalSearch", vo);
	}
	
	/**
	 * 통합 검색한 게시판별 글 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<TotalSearchResultVO> selectAllBbsForTotalSearch(TotalSearchResultVO vo) throws Exception {
		return (List<TotalSearchResultVO>) list("BBSKeywordDAO.selectAllBbsForTotalSearch", vo);
	}

}
