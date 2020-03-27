/**
 * @Name : LmsSugangManageServiceImpl.java
 * @Description : 과정 수강 관리 serviceImpl.
 * @author 이한구
 * @since 2016. 12. 1.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 12. 1.	이한구. 최초 생성.
 */
package egovframework.com.kids.lms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.kids.lms.DAO.LmsQuestionDAO;
import egovframework.com.kids.lms.DAO.LmsSugangDAO;
import egovframework.com.kids.lms.DAO.MemberInformationDAO;
import egovframework.com.kids.lms.service.LmsSugangManageService;
import egovframework.com.kids.lms.vo.LmsQuestionVO;
import egovframework.com.kids.lms.vo.LmsSugangChasiResultVO;
import egovframework.com.kids.lms.vo.LmsSugangVO;
import egovframework.com.kids.lms.vo.LmsTestResultVO;
import egovframework.com.kids.lms.vo.MemberInformationVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("lmsSugangManageService")
public class LmsSugangManageServiceImpl implements LmsSugangManageService {

	@Resource(name = "lmsSugangDAO")
	LmsSugangDAO lmsSugangDAO;

	@Resource(name = "memberInformationDAO")
	MemberInformationDAO memberInformationDAO;

	@Resource(name = "lmsQuestionDAO")
	LmsQuestionDAO lmsQuestionDAO;

	@Resource(name = "memberInformationIdGnrService")
	private EgovIdGnrService memberInformationIdGnrService;

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.lms.service.LmsSugangManageService#selectLmsSugang(egovframework.com.kids.lms.vo.LmsSugangVO)
	 */
	@Override
	public LmsSugangVO selectLmsSugang(LmsSugangVO vo) throws Exception {
		return lmsSugangDAO.selectLmsSugang(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.lms.service.LmsSugangManageService#insertLmsSugang(egovframework.com.kids.lms.vo.LmsSugangVO)
	 */
	@Override
	public void insertLmsSugang(LmsSugangVO vo) throws Exception {
		lmsSugangDAO.insertLmsSugang(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.lms.service.LmsSugangManageService#updateLmsSugangTestPoint(egovframework.com.kids.lms.vo.LmsSugangVO)
	 */
	@Override
	public void updateLmsSugangTestPoint(LmsSugangVO vo) throws Exception {
		lmsSugangDAO.updateLmsSugangTestPoint(vo);

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.lms.service.LmsSugangManageService#updateLmsSugangSuryo(egovframework.com.kids.lms.vo.LmsSugangVO)
	 */
	@Override
	public void updateLmsSugangSuryo(LmsSugangVO vo) throws Exception {
		lmsSugangDAO.updateLmsSugangSuryo(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.lms.service.LmsSugangManageService#insertLmsSugangChasiResult(egovframework.com.kids.lms.vo.LmsSugangChasiResultVO)
	 */
	@Override
	public void insertLmsSugangChasiResult(LmsSugangChasiResultVO vo) throws Exception {
		lmsSugangDAO.insertLmsSugangChasiResult(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * egovframework.com.kids.lms.service.LmsSugangManageService#selectLmsSugangChasiResultCount(egovframework.com.kids.lms.vo.LmsSugangChasiResultVO)
	 */
	@Override
	public int selectLmsSugangChasiResultCount(LmsSugangChasiResultVO vo) throws Exception {
		return lmsSugangDAO.selectLmsSugangChasiResultCount(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * egovframework.com.kids.lms.service.LmsSugangManageService#selectMemberInformationByEmail(egovframework.com.kids.lms.vo.MemberInformationVO)
	 */
	@Override
	public MemberInformationVO selectMemberInformationByEmail(MemberInformationVO vo) throws Exception {
		return memberInformationDAO.selectMemberInformationByEmail(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.lms.service.LmsSugangManageService#insertMemberInformation(egovframework.com.kids.lms.vo.MemberInformationVO)
	 */
	@Override
	public void insertMemberInformation(MemberInformationVO vo) throws Exception {
		// id를 생성해서 vo에 입력한다.
		String memberId = memberInformationIdGnrService.getNextStringId();
		vo.setMemberId(memberId);

		memberInformationDAO.insertMemberInformation(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.lms.service.LmsSugangManageService#insertLmsTestResultList(java.util.List)
	 */
	@Override
	public void insertLmsTestResultList(List<LmsTestResultVO> voList) throws Exception {
		for (LmsTestResultVO vo : voList) {
			lmsQuestionDAO.insertLmsTestResult(vo);
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.lms.service.LmsSugangManageService#selectLmsQuestionResult(egovframework.com.kids.lms.vo.LmsQuestionVO)
	 */
	@Override
	public List<LmsQuestionVO> selectLmsQuestionResult(LmsQuestionVO vo) throws Exception {
		return lmsQuestionDAO.selectLmsQuestionResult(vo);
	}
}
