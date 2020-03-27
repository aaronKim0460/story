/**
 * @Name : LmsCourseDAO.java
 * @Description : 과정정보 DAO.
 * @author 이한구
 * @since 2016. 11. 25.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 11. 25.	이한구. 최초 생성.
 */
package egovframework.com.kids.lms.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.kids.lms.vo.LmsCourseVO;

@Repository("lmsCourseDAO")
public class LmsCourseDAO extends EgovComAbstractDAO {

	/**
	 * 과정 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<LmsCourseVO> selectLmsCourseList(LmsCourseVO vo) throws Exception {
		return (List<LmsCourseVO>) list("LmsCourseDAO.selectLmsCourseList", vo);
	}

	/**
	 * 과정목록 수
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int selectLmsCourseCount(LmsCourseVO vo) throws Exception {
		return (Integer) select("LmsCourseDAO.selectLmsCourseCount", vo);
	}

	/**
	 * 과정목록 상세 정보
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public LmsCourseVO selectLmsCourse(LmsCourseVO vo) throws Exception {
		return (LmsCourseVO) select("LmsCourseDAO.selectLmsCourse", vo);
	}

	/**
	 * 과정 등록
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void insertLmsCourse(LmsCourseVO vo) throws Exception {
		insert("LmsCourseDAO.insertLmsCourse", vo);
	}

	/**
	 * 과정 수정
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void updateLmsCourse(LmsCourseVO vo) throws Exception {
		update("LmsCourseDAO.updateLmsCourse", vo);
	}

	/**
	 * 과정 삭제
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void deleteLmsCourse(LmsCourseVO vo) throws Exception {
		update("LmsCourseDAO.deleteLmsCourse", vo);
	}

	/**
	 * 사용자 과정 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<LmsCourseVO> selectLmsCourseListForUser(LmsCourseVO vo) throws Exception {
		return (List<LmsCourseVO>) list("LmsCourseDAO.selectLmsCourseListForUser", vo);
	}

}
