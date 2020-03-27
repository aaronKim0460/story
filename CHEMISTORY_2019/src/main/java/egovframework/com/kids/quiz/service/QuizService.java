/**
* @Name : QuizService.java
* @Description : 퀴즈 service.
* @author 이한구
* @since 2016. 11. 11.
* @version 1.0
* @see Copyright (C) All right reserved.
*
* @Modification Information
* 2016. 11. 11.	이한구. 최초 생성.
*/
package egovframework.com.kids.quiz.service;

import java.util.List;

import egovframework.com.kids.quiz.vo.QzCategoryVO;
import egovframework.com.kids.quiz.vo.QzSubjectVO;

public interface QuizService {
	
	/**
	 * 퀴즈 문제 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List<QzSubjectVO> selectQuizList(QzSubjectVO vo) throws Exception;
	
	/**
	 * 퀴즈 카테고리 목록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List<QzCategoryVO> selectCategoryList(QzCategoryVO vo) throws Exception;

}
