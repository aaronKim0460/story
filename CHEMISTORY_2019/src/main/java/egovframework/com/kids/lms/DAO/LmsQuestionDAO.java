/**
 * @Name : LmsQuestionDAO.java
 * @Description : 과정 문제DAO.
 * @author 이한구
 * @since 2016. 11. 29.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 11. 29.	이한구. 최초 생성.
 */
package egovframework.com.kids.lms.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.kids.lms.vo.LmsQuestionVO;
import egovframework.com.kids.lms.vo.LmsTestResultVO;

@Repository("lmsQuestionDAO")
public class LmsQuestionDAO extends EgovComAbstractDAO {

	/**
	 * 과정별 문제 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<LmsQuestionVO> selectLmsQuestionListByCourseId(LmsQuestionVO vo) throws Exception {
		return (List<LmsQuestionVO>) list("LmsQuestionDAO.selectLmsQuestionListByCourseId", vo);
	}

	/**
	 * 과정별 문제 상세 정보
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public LmsQuestionVO selectLmsQuestion(LmsQuestionVO vo) throws Exception {
		return (LmsQuestionVO) select("LmsQuestionDAO.selectLmsQuestion", vo);
	}

	/**
	 * 문제 등록
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void insertLmsQuestion(LmsQuestionVO vo) throws Exception {
		insert("LmsQuestionDAO.insertLmsQuestion", vo);
	}

	/**
	 * 문제 수정
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void updateLmsQuestion(LmsQuestionVO vo) throws Exception {
		update("LmsQuestionDAO.updateLmsQuestion", vo);
	}

	/**
	 * 문제 삭제
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void deleteLmsQuestion(LmsQuestionVO vo) throws Exception {
		delete("LmsQuestionDAO.deleteLmsQuestion", vo);
	}

	/**
	 * 과정별 문제 모두 삭제
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void deleteLmsQuestionAllByCourseId(LmsQuestionVO vo) throws Exception {
		delete("LmsQuestionDAO.deleteLdeleteLmsQuestionAllByCourseIdmsQuestion", vo);
	}

	/**
	 * 평가 결과 등록
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void insertLmsTestResult(LmsTestResultVO vo) throws Exception {
		insert("LmsQuestionDAO.insertLmsTestResult", vo);
	}
	
	/**
	 * 평가 결과 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<LmsQuestionVO> selectLmsQuestionResult(LmsQuestionVO vo) throws Exception {
		return (List<LmsQuestionVO>) list("LmsQuestionDAO.selectLmsQuestionResult", vo);
	}
}
