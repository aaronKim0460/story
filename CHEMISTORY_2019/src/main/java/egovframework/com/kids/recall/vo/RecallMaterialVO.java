/**
 * @Name : RecallMaterialVO.java
 * @Description : 유해용품 위험인자 연결VO.
 * @author 이한구
 * @since 2016. 11. 16.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 11. 16.	이한구. 최초 생성.
 */
package egovframework.com.kids.recall.vo;

import egovframework.com.cmm.ComDefaultVO;

@SuppressWarnings("serial")
public class RecallMaterialVO extends ComDefaultVO {

	/** 리콜_ID */
	private String recallId;

	/** 유해인자_ID */
	private String mIdx;

	/** 유해인자 이름 */
	private String materialName;

	public String getRecallId() {
		return recallId;
	}

	public void setRecallId(String recallId) {
		this.recallId = recallId;
	}

	public String getmIdx() {
		return mIdx;
	}

	public void setmIdx(String mIdx) {
		this.mIdx = mIdx;
	}

	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}

}
