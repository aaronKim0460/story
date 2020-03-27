/**
 * @Name : LmsQuestionVO.java
 * @Description : 과정 문제VO.
 * @author 이한구
 * @since 2016. 11. 29.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 11. 29.	이한구. 최초 생성.
 */
package egovframework.com.kids.lms.vo;

import egovframework.com.cmm.ComDefaultVO;

@SuppressWarnings("serial")
public class LmsQuestionVO extends ComDefaultVO {

	/** 문제_ID */
	private Long questionId;

	/** 문제 유형 */
	private String questionType;

	/** 문제 번호 */
	private Long questionNum;

	/** 문제 명 */
	private String questionTitle;

	/** 보기1 */
	private String item1;

	/** 보기2 */
	private String item2;

	/** 보기3 */
	private String item3;

	/** 보기4 */
	private String item4;

	/** 과정_ID */
	private Long courseId;

	/** 정답 */
	private Long rightAnswer;

	/** 사용 수 */
	private Long useCount;

	/** 선택 답 */
	private Long choiceQuestion;

	/** 수강_ID */
	private Long sugangId;

	public Long getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}

	public String getQuestionType() {
		return questionType;
	}

	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}

	public Long getQuestionNum() {
		return questionNum;
	}

	public void setQuestionNum(Long questionNum) {
		this.questionNum = questionNum;
	}

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public String getItem1() {
		return item1;
	}

	public void setItem1(String item1) {
		this.item1 = item1;
	}

	public String getItem2() {
		return item2;
	}

	public void setItem2(String item2) {
		this.item2 = item2;
	}

	public String getItem3() {
		return item3;
	}

	public void setItem3(String item3) {
		this.item3 = item3;
	}

	public String getItem4() {
		return item4;
	}

	public void setItem4(String item4) {
		this.item4 = item4;
	}

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	public Long getRightAnswer() {
		return rightAnswer;
	}

	public void setRightAnswer(Long rightAnswer) {
		this.rightAnswer = rightAnswer;
	}

	public Long getUseCount() {
		return useCount;
	}

	public void setUseCount(Long useCount) {
		this.useCount = useCount;
	}

	public Long getChoiceQuestion() {
		return choiceQuestion;
	}

	public void setChoiceQuestion(Long choiceQuestion) {
		this.choiceQuestion = choiceQuestion;
	}

	public Long getSugangId() {
		return sugangId;
	}

	public void setSugangId(Long sugangId) {
		this.sugangId = sugangId;
	}

}
