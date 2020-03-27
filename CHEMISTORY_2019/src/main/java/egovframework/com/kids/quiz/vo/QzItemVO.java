/**
 * @Name : QzItemVO.java
 * @Description : 퀴즈 보기 VO.
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
public class QzItemVO extends ComDefaultVO {

	/** 보기 키 */
	private Long itemKey;

	/** 내용 */
	private String contents;

	/** 정답 여부 */
	private Long isAnswer;

	/** 문제 키 */
	private Long subjectKey;

	public Long getItemKey() {
		return itemKey;
	}

	public void setItemKey(Long itemKey) {
		this.itemKey = itemKey;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Long getIsAnswer() {
		return isAnswer;
	}

	public void setIsAnswer(Long isAnswer) {
		this.isAnswer = isAnswer;
	}

	public Long getSubjectKey() {
		return subjectKey;
	}

	public void setSubjectKey(Long subjectKey) {
		this.subjectKey = subjectKey;
	}

}
