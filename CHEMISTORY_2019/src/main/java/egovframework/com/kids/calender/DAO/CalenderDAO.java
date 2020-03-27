/**
 * @Name : CalenderDAO.java
 * @Description : 달력 DAO.
 * @author 이한구
 * @since 2016. 11. 22.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 11. 22.	이한구. 최초 생성.
 */
package egovframework.com.kids.calender.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.kids.calender.vo.CalenderVO;

@Repository("calenderDAO")
public class CalenderDAO extends EgovComAbstractDAO {

	/**
	 * 달력 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<CalenderVO> selectCalenderList(CalenderVO vo) throws Exception {
		return (List<CalenderVO>) list("CalenderDAO.selectCalenderList", vo);
	}

	/**
	 * 달력 목록 수
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int selectCalenderCount(CalenderVO vo) throws Exception {
		return (Integer) select("CalenderDAO.selectCalenderCount", vo);
	}

	/**
	 * 달력 표시 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<CalenderVO> selectCalenderViewList(CalenderVO vo) throws Exception {
		return (List<CalenderVO>) list("CalenderDAO.selectCalenderViewList", vo);
	}

	/**
	 * 달력 상세 정보
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public CalenderVO selectCalender(CalenderVO vo) throws Exception {
		return (CalenderVO) select("CalenderDAO.selectCalender", vo);
	}

	/**
	 * 달력 등록
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void insertCalender(CalenderVO vo) throws Exception {
		insert("CalenderDAO.insertCalender", vo);
	}

	/**
	 * 달력 수정
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void updateCalender(CalenderVO vo) throws Exception {
		update("CalenderDAO.updateCalender", vo);
	}

	/**
	 * 달력 삭제
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void deleteCalender(CalenderVO vo) throws Exception {
		delete("CalenderDAO.deleteCalender", vo);
	}
	
	/**
	 * 사용자 달력 테이블 리스트
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<CalenderVO> selectCalenderUserList(CalenderVO vo) throws Exception {
		return (List<CalenderVO>) list("CalenderDAO.selectCalenderUserList", vo);
	}
}
