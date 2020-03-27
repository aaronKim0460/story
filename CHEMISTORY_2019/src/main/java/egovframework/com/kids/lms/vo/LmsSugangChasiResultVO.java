/**
 * @Name : LmsSugangChasiResultVO.java
 * @Description : 수강차시 정보VO.
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
public class LmsSugangChasiResultVO extends ComDefaultVO {

	/** 수강_ID */
	private Long sugangId;

	/** 차시_ID */
	private Long chasiId;

	/** 수강일 */
	private String chasiStudyDt;

	public Long getSugangId() {
		return sugangId;
	}

	public void setSugangId(Long sugangId) {
		this.sugangId = sugangId;
	}

	public Long getChasiId() {
		return chasiId;
	}

	public void setChasiId(Long chasiId) {
		this.chasiId = chasiId;
	}

	public String getChasiStudyDt() {
		return chasiStudyDt;
	}

	public void setChasiStudyDt(String chasiStudyDt) {
		this.chasiStudyDt = chasiStudyDt;
	}

}
