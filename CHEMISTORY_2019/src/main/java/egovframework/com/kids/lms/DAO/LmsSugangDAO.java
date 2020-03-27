/**
 * @Name : LmsSugangDAO.java
 * @Description : 과정 수강 정보 DAO.
 * @author 이한구
 * @since 2016. 12. 1.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 12. 1.	이한구. 최초 생성.
 */
package egovframework.com.kids.lms.DAO;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.kids.lms.vo.LmsSugangChasiResultVO;
import egovframework.com.kids.lms.vo.LmsSugangVO;

@Repository("lmsSugangDAO")
public class LmsSugangDAO extends EgovComAbstractDAO {

	/**
	 * 수강 상세 정보
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public LmsSugangVO selectLmsSugang(LmsSugangVO vo) throws Exception {
		return (LmsSugangVO) select("LmsSugangDAO.selectLmsSugang", vo);
	}

	/**
	 * 수강 등록
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void insertLmsSugang(LmsSugangVO vo) throws Exception {
		insert("LmsSugangDAO.insertLmsSugang", vo);
	}

	/**
	 * 평가 점수 수정
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void updateLmsSugangTestPoint(LmsSugangVO vo) throws Exception {
		update("LmsSugangDAO.updateLmsSugangTestPoint", vo);
	}

	/**
	 * 수료일 수정
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void updateLmsSugangSuryo(LmsSugangVO vo) throws Exception {
		insert("LmsSugangDAO.updateLmsSugangSuryo", vo);
	}

	/**
	 * 수강 차시 결과 등록
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void insertLmsSugangChasiResult(LmsSugangChasiResultVO vo) throws Exception {
		insert("LmsSugangDAO.insertLmsSugangChasiResult", vo);
	}
	
	/**
	 * 수강 차시 결과 확인
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int selectLmsSugangChasiResultCount(LmsSugangChasiResultVO vo) throws Exception {
		return (Integer)select("LmsSugangDAO.selectLmsSugangChasiResultCount", vo);
	}

}
