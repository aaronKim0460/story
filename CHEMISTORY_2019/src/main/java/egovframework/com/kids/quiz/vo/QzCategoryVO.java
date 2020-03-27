/**
 * @Name : QzCategoryVO.java
 * @Description : 퀴즈 카테고리 VO.
 * @author 이한구
 * @since 2016. 11. 11.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 11. 11.	이한구. 최초 생성.
 */
package egovframework.com.kids.quiz.vo;

import egovframework.com.cmm.ComDefaultVO;

@SuppressWarnings("serial")
public class QzCategoryVO extends ComDefaultVO {

	/** 카테고리 키 */
	private Long categoryKey;

	/** 이름 */
	private String name;

	/** 생성일 */
	private String createdDate;

	public Long getCategoryKey() {
		return categoryKey;
	}

	public void setCategoryKey(Long categoryKey) {
		this.categoryKey = categoryKey;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

}
