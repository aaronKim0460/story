/**
 * @Name : LmsChasiVO.java
 * @Description : 과정 차시정보 VO.
 * @author 이한구
 * @since 2016. 11. 25.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 11. 25.	이한구. 최초 생성.
 */
package egovframework.com.kids.lms.vo;

import egovframework.com.cmm.ComDefaultVO;

@SuppressWarnings("serial")
public class LmsChasiVO extends ComDefaultVO {

	/** 차시_ID */
	private Long chasiId;

	/** 차시 */
	private Long chasi;

	/** 차시 이름 */
	private String chasiNm;

	/** 차시_url */
	private String startUrl;

	/** 과정_ID */
	private Long courseId;

	/** 수강_ID */
	private Long sugangId;

	/** 수강_수 */
	private Long sugangCount;

	/** 학습일 */
	private String chasiStudyDt;

	public Long getChasiId() {
		return chasiId;
	}

	public void setChasiId(Long chasiId) {
		this.chasiId = chasiId;
	}

	public Long getChasi() {
		return chasi;
	}

	public void setChasi(Long chasi) {
		this.chasi = chasi;
	}

	public String getChasiNm() {
		return chasiNm;
	}

	public void setChasiNm(String chasiNm) {
		this.chasiNm = chasiNm;
	}

	public String getStartUrl() {
		return startUrl;
	}

	public void setStartUrl(String startUrl) {
		this.startUrl = startUrl;
	}

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	public Long getSugangId() {
		return sugangId;
	}

	public void setSugangId(Long sugangId) {
		this.sugangId = sugangId;
	}

	public Long getSugangCount() {
		return sugangCount;
	}

	public void setSugangCount(Long sugangCount) {
		this.sugangCount = sugangCount;
	}

	public String getChasiStudyDt() {
		return chasiStudyDt;
	}

	public void setChasiStudyDt(String chasiStudyDt) {
		this.chasiStudyDt = chasiStudyDt;
	}

}
