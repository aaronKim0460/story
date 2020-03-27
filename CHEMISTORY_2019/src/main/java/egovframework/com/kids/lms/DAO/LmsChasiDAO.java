/**
 * @Name : LmsChasiDAO.java
 * @Description : 과정 차시정보DAO.
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
import egovframework.com.kids.lms.vo.LmsChasiVO;

@Repository("lmsChasiDAO")
public class LmsChasiDAO extends EgovComAbstractDAO {

	/**
	 * 코스 아이디 별 차시 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<LmsChasiVO> selectLmsChasiListByCourseId(LmsChasiVO vo) throws Exception {
		return (List<LmsChasiVO>) list("LmsChasiDAO.selectLmsChasiListByCourseId", vo);
	}
	
	/**
	 * 차시 상세 정보
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public LmsChasiVO selectLmsChasi(LmsChasiVO vo) throws Exception {
		return (LmsChasiVO) select("LmsChasiDAO.selectLmsChasi", vo);
	}
	
	/**
	 * 차시 등록
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void insertLmsChasi(LmsChasiVO vo) throws Exception {
		insert("LmsChasiDAO.insertLmsChasi", vo);
	}
	
	/**
	 * 차시 수정
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void udpateLmsChasi(LmsChasiVO vo) throws Exception {
		update("LmsChasiDAO.udpateLmsChasi", vo);
	}
	
	/**
	 * 차시 삭제
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void deleteLmsChasi(LmsChasiVO vo) throws Exception {
		delete("LmsChasiDAO.deleteLmsChasi", vo);
	}
	
	/**
	 * 과정아이디로 차시 삭제
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void deleteLmsChasiByCourseId(LmsChasiVO vo) throws Exception {
		delete("LmsChasiDAO.deleteLmsChasiByCourseId", vo);
	}

}
