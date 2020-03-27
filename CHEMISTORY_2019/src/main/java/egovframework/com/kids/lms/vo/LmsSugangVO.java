/**
 * @Name : LmsSugangVO.java
 * @Description : 과정 수강정보VO.
 * @author 이한구
 * @since 2016. 12. 1.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 12. 1.	이한구. 최초 생성.
 */
package egovframework.com.kids.lms.vo;

import egovframework.com.cmm.ComDefaultVO;

@SuppressWarnings("serial")
public class LmsSugangVO extends ComDefaultVO {

	/** 수강_ID */
	private Long sugangId;

	/** 회원_ID */
	private String memberId;

	/** 수강상태 */
	private String sugangState;

	/** 수강신청일 */
	private String sugangAppDt;

	/** 수료일 */
	private String suryoDt;

	/** 과정_ID */
	private Long courseId;

	/** 평가점수 */
	private Double testPoint;

	/** 평가일 */
	private String testDt;

	/** 회원이름 */
	private String memberName;

	/** 완료 번호 */
	private Long completenum;

	/** 사용자 이메일 */
	private String userEmail;

	/** 수강종료일 */
	private String endDate;

	public Long getSugangId() {
		return sugangId;
	}

	public void setSugangId(Long sugangId) {
		this.sugangId = sugangId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getSugangState() {
		return sugangState;
	}

	public void setSugangState(String sugangState) {
		this.sugangState = sugangState;
	}

	public String getSugangAppDt() {
		return sugangAppDt;
	}

	public void setSugangAppDt(String sugangAppDt) {
		this.sugangAppDt = sugangAppDt;
	}

	public String getSuryoDt() {
		return suryoDt;
	}

	public void setSuryoDt(String suryoDt) {
		this.suryoDt = suryoDt;
	}

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	public Double getTestPoint() {
		return testPoint;
	}

	public void setTestPoint(Double testPoint) {
		this.testPoint = testPoint;
	}

	public String getTestDt() {
		return testDt;
	}

	public void setTestDt(String testDt) {
		this.testDt = testDt;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public Long getCompletenum() {
		return completenum;
	}

	public void setCompletenum(Long completenum) {
		this.completenum = completenum;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

}
