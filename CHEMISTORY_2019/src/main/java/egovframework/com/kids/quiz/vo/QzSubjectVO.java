/**
 * @Name : QzSubjectVO.java
 * @Description : 퀴즈 문제 VO.
 * @author 이한구
 * @since 2016. 11. 11.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 11. 11.	이한구. 최초 생성.
 */
package egovframework.com.kids.quiz.vo;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

@SuppressWarnings("serial")
public class QzSubjectVO extends ComDefaultVO {

	/** 문제 키 */
	private Long subjectKey;

	/** 문제 내용 */
	private String question;

	/** 설명 */
	private String comments;

	/** 생성일 */
	private String createdDate;

	/** 카테고리 키 */
	private Long categoryKey;

	/** 카테고리 이름 */
	private String categoryName;

	/** 보기 목록 */
	private List<QzItemVO> itemList;

	public Long getSubjectKey() {
		return subjectKey;
	}

	public void setSubjectKey(Long subjectKey) {
		this.subjectKey = subjectKey;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public Long getCategoryKey() {
		return categoryKey;
	}

	public void setCategoryKey(Long categoryKey) {
		this.categoryKey = categoryKey;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public List<QzItemVO> getItemList() {
		return itemList;
	}

	public void setItemList(List<QzItemVO> itemList) {
		this.itemList = itemList;
	}

}
