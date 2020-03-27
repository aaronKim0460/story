/**
 * @Name : QuizDAO.java
 * @Description : 퀴즈 DAO.
 * @author 이한구
 * @since 2016. 11. 11.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 11. 11.	이한구. 최초 생성.
 */
package egovframework.com.kids.quiz.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.kids.quiz.vo.QzCategoryVO;
import egovframework.com.kids.quiz.vo.QzItemVO;
import egovframework.com.kids.quiz.vo.QzSubjectVO;

@Repository("quizDAO")
public class QuizDAO extends EgovComAbstractDAO {

	/**
	 * 퀴즈 문제 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<QzSubjectVO> selectQuizList(QzSubjectVO vo) throws Exception {
		return (List<QzSubjectVO>) list("QuizDAO.selectQuizList", vo);
	}
	
	/**
	 * 문제별 보기 목록
	 * 
	 * @param subjectKey
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<QzItemVO> selectItemList(String subjectKey) throws Exception {
		return (List<QzItemVO>) list("QuizDAO.selectItemList", subjectKey);
	}
	
	/**
	 * 퀴즈 카테고리 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<QzCategoryVO> selectCategoryList(QzCategoryVO vo) throws Exception {
		return (List<QzCategoryVO>) list("QuizDAO.selectCategoryList", vo);
	}

}
