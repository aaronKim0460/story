/**
 * @Name : BBSKeywordService.java
 * @Description : 키워드 service.
 * @author 이한구
 * @since 2017. 1. 10.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2017. 1. 10.	이한구. 최초 생성.
 */
package egovframework.com.cop.bbs.service;

import java.util.List;

public interface BBSKeywordService {

	/**
	 * 키워드 검색한 전체 게시판명 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List<BBSKeywordVO> selectAllBbsMstByKeyword(BBSKeywordVO vo) throws Exception;

	/**
	 * 통합 검색한 전체 게시판명 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	List<BBSKeywordVO> selectAllBbsMstForTotalSearch(BBSKeywordVO vo) throws Exception;

}
