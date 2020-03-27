/**
 * @Name : LmsSugangManageService.java
 * @Description : 과정 수강 관리 service.
 * @author 이한구
 * @since 2016. 12. 1.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 12. 1.	이한구. 최초 생성.
 */
package egovframework.com.kids.lms.service;

import java.util.List;

import egovframework.com.kids.lms.vo.LmsQuestionVO;
import egovframework.com.kids.lms.vo.LmsSugangChasiResultVO;
import egovframework.com.kids.lms.vo.LmsSugangVO;
import egovframework.com.kids.lms.vo.LmsTestResultVO;
import egovframework.com.kids.lms.vo.MemberInformationVO;

public interface LmsSugangManageService {

	/**
	 * 수강 상세 정보
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	LmsSugangVO selectLmsSugang(LmsSugangVO vo) throws Exception;

	/**
	 * 수강 등록
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void insertLmsSugang(LmsSugangVO vo) throws Exception;

	/**
	 * 평가 점수 수정
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void updateLmsSugangTestPoint(LmsSugangVO vo) throws Exception;

	/**
	 * 수료일 수정
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void updateLmsSugangSuryo(LmsSugangVO vo) throws Exception;

	/**
	 * 수강 차시 결과 등록
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void insertLmsSugangChasiResult(LmsSugangChasiResultVO vo) throws Exception;

	/**
	 * 수강 차시 결과 등록 여부 확인
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	int selectLmsSugangChasiResultCount(LmsSugangChasiResultVO vo) throws Exception;

	/**
	 * 이메일로 회원 정보 가져오기
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	MemberInformationVO selectMemberInformationByEmail(MemberInformationVO vo) throws Exception;

	/**
	 * 회원 정보 저장
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void insertMemberInformation(MemberInformationVO vo) throws Exception;

	/**
	 * 과정 평가 결과 등록
	 * 
	 * @param voList
	 * @throws Exception
	 */
	void insertLmsTestResultList(List<LmsTestResultVO> voList) throws Exception;

	/**
	 * 평가 결과 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List<LmsQuestionVO> selectLmsQuestionResult(LmsQuestionVO vo) throws Exception;

}
