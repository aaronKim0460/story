/**
 * @Name : LmsCourseManageServiceImpl.java
 * @Description : 과정관리 serviceImpl.
 * @author 이한구
 * @since 2016. 11. 25.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 11. 25.	이한구. 최초 생성.
 */
package egovframework.com.kids.lms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.kids.lms.DAO.LmsChasiDAO;
import egovframework.com.kids.lms.DAO.LmsCourseDAO;
import egovframework.com.kids.lms.DAO.LmsQuestionDAO;
import egovframework.com.kids.lms.service.LmsCourseManageService;
import egovframework.com.kids.lms.vo.LmsChasiVO;
import egovframework.com.kids.lms.vo.LmsCourseVO;
import egovframework.com.kids.lms.vo.LmsQuestionVO;

@Service("lmsCourseManageService")
public class LmsCourseManageServiceImpl implements LmsCourseManageService {

	@Resource(name = "lmsCourseDAO")
	LmsCourseDAO lmsCourseDAO;

	@Resource(name = "lmsChasiDAO")
	LmsChasiDAO lmsChasiDAO;

	@Resource(name = "lmsQuestionDAO")
	LmsQuestionDAO lmsQuestionDAO;

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.lms.service.LmsCourseService#selectLmsCourseList(egovframework.com.kids.lms.vo.LmsCourseVO)
	 */
	@Override
	public List<LmsCourseVO> selectLmsCourseList(LmsCourseVO vo) throws Exception {
		return lmsCourseDAO.selectLmsCourseList(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.lms.service.LmsCourseService#selectLmsCourseCount(egovframework.com.kids.lms.vo.LmsCourseVO)
	 */
	@Override
	public int selectLmsCourseCount(LmsCourseVO vo) throws Exception {
		return lmsCourseDAO.selectLmsCourseCount(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.lms.service.LmsCourseService#selectLmsCourse(egovframework.com.kids.lms.vo.LmsCourseVO)
	 */
	@Override
	public LmsCourseVO selectLmsCourse(LmsCourseVO vo) throws Exception {
		return lmsCourseDAO.selectLmsCourse(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.lms.service.LmsCourseService#insertLmsCourse(egovframework.com.kids.lms.vo.LmsCourseVO)
	 */
	@Override
	public void insertLmsCourse(LmsCourseVO vo) throws Exception {
		lmsCourseDAO.insertLmsCourse(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.lms.service.LmsCourseService#updateLmsCourse(egovframework.com.kids.lms.vo.LmsCourseVO)
	 */
	@Override
	public void updateLmsCourse(LmsCourseVO vo) throws Exception {
		lmsCourseDAO.updateLmsCourse(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.lms.service.LmsCourseService#deleteLmsCourse(egovframework.com.kids.lms.vo.LmsCourseVO)
	 */
	@Override
	public void deleteLmsCourse(LmsCourseVO vo) throws Exception {
		// 차시를 모두 삭제하고 삭제한다.
		LmsChasiVO deleteVO = new LmsChasiVO();
		deleteVO.setCourseId(vo.getCourseId());

		lmsChasiDAO.deleteLmsChasiByCourseId(deleteVO);

		// 문제 모두 삭제
		LmsQuestionVO deleteQuestionVO = new LmsQuestionVO();
		deleteQuestionVO.setCourseId(vo.getCourseId());
		lmsQuestionDAO.deleteLmsQuestionAllByCourseId(deleteQuestionVO);

		// 과정 삭제
		lmsCourseDAO.deleteLmsCourse(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.lms.service.LmsCourseService#selectLmsChasiListByCourseId(egovframework.com.kids.lms.vo.LmsChasiVO)
	 */
	@Override
	public List<LmsChasiVO> selectLmsChasiListByCourseId(LmsChasiVO vo) throws Exception {
		return lmsChasiDAO.selectLmsChasiListByCourseId(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.lms.service.LmsCourseService#insertLmsChasi(egovframework.com.kids.lms.vo.LmsChasiVO)
	 */
	@Override
	public void insertLmsChasi(LmsChasiVO vo) throws Exception {
		lmsChasiDAO.insertLmsChasi(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.lms.service.LmsCourseService#udpateLmsChasi(egovframework.com.kids.lms.vo.LmsChasiVO)
	 */
	@Override
	public void updateLmsChasi(LmsChasiVO vo) throws Exception {
		lmsChasiDAO.udpateLmsChasi(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.lms.service.LmsCourseService#deleteLmsChasi(egovframework.com.kids.lms.vo.LmsChasiVO)
	 */
	@Override
	public void deleteLmsChasi(LmsChasiVO vo) throws Exception {
		lmsChasiDAO.deleteLmsChasi(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.lms.service.LmsCourseManageService#selectLmsQuestionListByCourseId(egovframework.com.kids.lms.vo.LmsQuestionVO)
	 */
	@Override
	public List<LmsQuestionVO> selectLmsQuestionListByCourseId(LmsQuestionVO vo) throws Exception {
		return lmsQuestionDAO.selectLmsQuestionListByCourseId(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.lms.service.LmsCourseManageService#selectLmsQuestion(egovframework.com.kids.lms.vo.LmsQuestionVO)
	 */
	@Override
	public LmsQuestionVO selectLmsQuestion(LmsQuestionVO vo) throws Exception {
		return lmsQuestionDAO.selectLmsQuestion(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.lms.service.LmsCourseManageService#insertLmsQuestion(egovframework.com.kids.lms.vo.LmsQuestionVO)
	 */
	@Override
	public void insertLmsQuestion(LmsQuestionVO vo) throws Exception {
		// ox의 경우 보기를 삭제 한다.
		if (vo.getQuestionType() != null && "ox".equals(vo.getQuestionType())) {
			vo.setItem1(null);
			vo.setItem2(null);
			vo.setItem3(null);
			vo.setItem4(null);
		}

		lmsQuestionDAO.insertLmsQuestion(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.lms.service.LmsCourseManageService#updateLmsQuestion(egovframework.com.kids.lms.vo.LmsQuestionVO)
	 */
	@Override
	public void updateLmsQuestion(LmsQuestionVO vo) throws Exception {
		// ox의 경우 보기를 삭제 한다.
		if (vo.getQuestionType() != null && "ox".equals(vo.getQuestionType())) {
			vo.setItem1(null);
			vo.setItem2(null);
			vo.setItem3(null);
			vo.setItem4(null);
		}

		lmsQuestionDAO.updateLmsQuestion(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.lms.service.LmsCourseManageService#deleteLmsQuestion(egovframework.com.kids.lms.vo.LmsQuestionVO)
	 */
	@Override
	public void deleteLmsQuestion(LmsQuestionVO vo) throws Exception {
		lmsQuestionDAO.deleteLmsQuestion(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.lms.service.LmsCourseManageService#selectLmsCourseListForUser(egovframework.com.kids.lms.vo.LmsCourseVO)
	 */
	@Override
	public List<LmsCourseVO> selectLmsCourseListForUser(LmsCourseVO vo) throws Exception {
		return lmsCourseDAO.selectLmsCourseListForUser(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.lms.service.LmsCourseManageService#selectLmsChasi(egovframework.com.kids.lms.vo.LmsChasiVO)
	 */
	@Override
	public LmsChasiVO selectLmsChasi(LmsChasiVO vo) throws Exception {
		return lmsChasiDAO.selectLmsChasi(vo);
	}

}
