/**
 * @Name : BBSKeywordServiceImpl.java
 * @Description : 키워드 serviceImpl.
 * @author 이한구
 * @since 2017. 1. 10.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2017. 1. 10.	이한구. 최초 생성.
 */
package egovframework.com.cop.bbs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cop.bbs.service.BBSKeywordService;
import egovframework.com.cop.bbs.service.BBSKeywordVO;

@Service("BBSKeywordService")
public class BBSKeywordServiceImpl implements BBSKeywordService {

	@Resource(name = "BBSKeywordDAO")
	private BBSKeywordDAO BBSKeywordDAO;

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.cop.bbs.service.BBSKeywordService#selectAllBbsMstByKeyword(egovframework.com.cop.bbs.service.BBSKeywordVO)
	 */
	@Override
	public List<BBSKeywordVO> selectAllBbsMstByKeyword(BBSKeywordVO vo) throws Exception {
		return BBSKeywordDAO.selectAllBbsMstByKeyword(vo);
	}
	
	/* (non-Javadoc)
	 * @see egovframework.com.cop.bbs.service.BBSKeywordService#selectAllBbsMstForTotalSearch(egovframework.com.cop.bbs.service.BBSKeywordVO)
	 */
	@Override
	public List<BBSKeywordVO> selectAllBbsMstForTotalSearch(BBSKeywordVO vo) throws Exception {
		return BBSKeywordDAO.selectAllBbsMstForTotalSearch(vo);
	}

}
