/**
 * @Name : LmsCourseManageService.java
 * @Description : 과정관리 service.
 * @author 이한구
 * @since 2016. 11. 25.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 11. 25.	이한구. 최초 생성.
 */
package egovframework.com.kids.lms.service;

import java.util.List;

import egovframework.com.kids.lms.vo.LmsChasiVO;
import egovframework.com.kids.lms.vo.LmsCourseVO;
import egovframework.com.kids.lms.vo.LmsQuestionVO;

public interface LmsCourseManageService {

	/**
	 * 과정 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List<LmsCourseVO> selectLmsCourseList(LmsCourseVO vo) throws Exception;

	/**
	 * 과정 목록 수
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	int selectLmsCourseCount(LmsCourseVO vo) throws Exception;

	/**
	 * 과정 상세 정보
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	LmsCourseVO selectLmsCourse(LmsCourseVO vo) throws Exception;

	/**
	 * 과정 등록
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void insertLmsCourse(LmsCourseVO vo) throws Exception;

	/**
	 * 과정 수정
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void updateLmsCourse(LmsCourseVO vo) throws Exception;

	/**
	 * 과정 삭제
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void deleteLmsCourse(LmsCourseVO vo) throws Exception;

	/**
	 * 코스 아이디 별 차시 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List<LmsChasiVO> selectLmsChasiListByCourseId(LmsChasiVO vo) throws Exception;

	/**
	 * 차시 등록
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void insertLmsChasi(LmsChasiVO vo) throws Exception;

	/**
	 * 차시 수정
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void updateLmsChasi(LmsChasiVO vo) throws Exception;

	/**
	 * 차시 삭제
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void deleteLmsChasi(LmsChasiVO vo) throws Exception;

	/**
	 * 과정별 문제 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List<LmsQuestionVO> selectLmsQuestionListByCourseId(LmsQuestionVO vo) throws Exception;

	/**
	 * 과정별 문제 상세 정보
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	LmsQuestionVO selectLmsQuestion(LmsQuestionVO vo) throws Exception;

	/**
	 * 문제 등록
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void insertLmsQuestion(LmsQuestionVO vo) throws Exception;

	/**
	 * 문제 수정
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void updateLmsQuestion(LmsQuestionVO vo) throws Exception;

	/**
	 * 문제 삭제
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void deleteLmsQuestion(LmsQuestionVO vo) throws Exception;

	/**
	 * 사용자 과정 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List<LmsCourseVO> selectLmsCourseListForUser(LmsCourseVO vo) throws Exception;

	/**
	 * 차시 상세 정보
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	LmsChasiVO selectLmsChasi(LmsChasiVO vo) throws Exception;

}
