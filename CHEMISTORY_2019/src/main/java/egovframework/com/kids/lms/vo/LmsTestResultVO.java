/**
 * @Name : LmsTestResultVO.java
 * @Description : 과정 평가 결과 VO.
 * @author 이한구
 * @since 2016. 12. 2.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 12. 2.	이한구. 최초 생성.
 */
package egovframework.com.kids.lms.vo;

import egovframework.com.cmm.ComDefaultVO;

@SuppressWarnings("serial")
public class LmsTestResultVO extends ComDefaultVO {

	/** 문제_ID */
	private Long questionId;

	/** 수강_ID */
	private Long sugangId;

	/** 선택 답 */
	private Long choiceQuestion;

	/** 문제_IDs */
	private Long[] questionIds;

	/** 수강_IDs */
	private Long[] choiceQuestions;

	/** 과정_ID */
	private Long courseId;

	public Long getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}

	public Long getSugangId() {
		return sugangId;
	}

	public void setSugangId(Long sugangId) {
		this.sugangId = sugangId;
	}

	public Long getChoiceQuestion() {
		return choiceQuestion;
	}

	public void setChoiceQuestion(Long choiceQuestion) {
		this.choiceQuestion = choiceQuestion;
	}

	public Long[] getQuestionIds() {
		return questionIds;
	}

	public void setQuestionIds(Long[] questionIds) {
		this.questionIds = questionIds;
	}

	public Long[] getChoiceQuestions() {
		return choiceQuestions;
	}

	public void setChoiceQuestions(Long[] choiceQuestions) {
		this.choiceQuestions = choiceQuestions;
	}

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

}
