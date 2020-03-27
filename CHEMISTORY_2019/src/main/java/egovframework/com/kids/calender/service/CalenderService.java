/**
 * @Name : CalenderService.java
 * @Description : 달력 service.
 * @author 이한구
 * @since 2016. 11. 22.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 11. 22.	이한구. 최초 생성.
 */
package egovframework.com.kids.calender.service;

import java.util.List;

import egovframework.com.kids.calender.vo.CalenderVO;

public interface CalenderService {

	/**
	 * 달력 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List<CalenderVO> selectCalenderList(CalenderVO vo) throws Exception;

	/**
	 * 달력 목록 수
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	int selectCalenderCount(CalenderVO vo) throws Exception;

	/**
	 * 달력 표시 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List<CalenderVO> selectCalenderViewList(CalenderVO vo) throws Exception;

	/**
	 * 달력 상세 정보
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	CalenderVO selectCalender(CalenderVO vo) throws Exception;

	/**
	 * 달력 등록
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void insertCalender(CalenderVO vo) throws Exception;

	/**
	 * 달력 수정
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void updateCalender(CalenderVO vo) throws Exception;

	/**
	 * 달력 삭제
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void deleteCalender(CalenderVO vo) throws Exception;

	/**
	 * 사용자 달력 테이블 리스트
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List<CalenderVO> selectCalenderUserList(CalenderVO vo) throws Exception;

}
