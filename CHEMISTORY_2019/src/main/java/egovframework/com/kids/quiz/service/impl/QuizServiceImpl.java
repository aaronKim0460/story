/**
 * @Name : QuizServiceImpl.java
 * @Description : 퀴즈 serviceImpl.
 * @author 이한구
 * @since 2016. 11. 11.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 11. 11.	이한구. 최초 생성.
 */
package egovframework.com.kids.quiz.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.kids.quiz.DAO.QuizDAO;
import egovframework.com.kids.quiz.service.QuizService;
import egovframework.com.kids.quiz.vo.QzCategoryVO;
import egovframework.com.kids.quiz.vo.QzSubjectVO;

@Service("quizService")
public class QuizServiceImpl implements QuizService {

	@Resource(name = "quizDAO")
	private QuizDAO quizDAO;

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.quiz.service.QuizService#selectQuizList(egovframework.com.kids.quiz.vo.QzSubjectVO)
	 */
	@Override
	public List<QzSubjectVO> selectQuizList(QzSubjectVO vo) throws Exception {
		return quizDAO.selectQuizList(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.quiz.service.QuizService#selectCategoryList(egovframework.com.kids.quiz.vo.QzCategoryVO)
	 */
	@Override
	public List<QzCategoryVO> selectCategoryList(QzCategoryVO vo) throws Exception {
		return quizDAO.selectCategoryList(vo);
	}

}
