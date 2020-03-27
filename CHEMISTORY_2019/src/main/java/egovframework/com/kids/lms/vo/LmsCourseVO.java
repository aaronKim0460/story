/**
 * @Name : LmsCourseVO.java
 * @Description : 과정 정보VO.
 * @author 이한구
 * @since 2016. 11. 25.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 11. 25.	이한구. 최초 생성.
 */
package egovframework.com.kids.lms.vo;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

@SuppressWarnings("serial")
public class LmsCourseVO extends ComDefaultVO {

	/** 과정_ID */
	private Long courseId;

	/** 과정명 */
	private String courseNm;

	/** 화면 너비 */
	private Long screenWidth;

	/** 화면 높이 */
	private Long screenHeight;

	/** 사용여부 */
	private String useYn;

	/** 등록일 */
	private String regDt;

	/** 등록자 아이디 */
	private String regId;

	/** 등록자 이름 */
	private String regNm;

	/** 과정내용 */
	private String courseContent;

	/** 차시수 */
	private Long chasiCount;

	/** 문항수 */
	private Long questionCount;

	/** 수강자 수 */
	private Long sugangCount;

	/** 차시 목록 */
	private List<LmsChasiVO> chasiList;

	/** 수강_ID */
	private Long sugangId;

	/** 평가여부수 */
	private Long testCount;

	/** 사용자 이메일 */
	private String userEmail;

	/** 평가점수 */
	private Double testPoint;

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	public String getCourseNm() {
		return courseNm;
	}

	public void setCourseNm(String courseNm) {
		this.courseNm = courseNm;
	}

	public Long getScreenWidth() {
		return screenWidth;
	}

	public void setScreenWidth(Long screenWidth) {
		this.screenWidth = screenWidth;
	}

	public Long getScreenHeight() {
		return screenHeight;
	}

	public void setScreenHeight(Long screenHeight) {
		this.screenHeight = screenHeight;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getRegNm() {
		return regNm;
	}

	public void setRegNm(String regNm) {
		this.regNm = regNm;
	}

	public String getCourseContent() {
		return courseContent;
	}

	public void setCourseContent(String courseContent) {
		this.courseContent = courseContent;
	}

	public Long getChasiCount() {
		return chasiCount;
	}

	public void setChasiCount(Long chasiCount) {
		this.chasiCount = chasiCount;
	}

	public Long getQuestionCount() {
		return questionCount;
	}

	public void setQuestionCount(Long questionCount) {
		this.questionCount = questionCount;
	}

	public Long getSugangCount() {
		return sugangCount;
	}

	public void setSugangCount(Long sugangCount) {
		this.sugangCount = sugangCount;
	}

	public List<LmsChasiVO> getChasiList() {
		return chasiList;
	}

	public void setChasiList(List<LmsChasiVO> chasiList) {
		this.chasiList = chasiList;
	}

	public Long getSugangId() {
		return sugangId;
	}

	public void setSugangId(Long sugangId) {
		this.sugangId = sugangId;
	}

	public Long getTestCount() {
		return testCount;
	}

	public void setTestCount(Long testCount) {
		this.testCount = testCount;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Double getTestPoint() {
		return testPoint;
	}

	public void setTestPoint(Double testPoint) {
		this.testPoint = testPoint;
	}

}
