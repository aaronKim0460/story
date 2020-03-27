/**
 * @Name : KeywordResultVO.java
 * @Description : 키워드 검색 결과 VO.
 * @author 이한구
 * @since 2017. 1. 10.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2017. 1. 10.	이한구. 최초 생성.
 */
package egovframework.com.cop.bbs.service;

import java.io.Serializable;

@SuppressWarnings("serial")
public class TotalSearchResultVO implements Serializable {

	/** 게시판 ID */
	private String bbsId;

	/** 게시글 ID */
	private String nttId;

	/** 게시글 제목 */
	private String nttSj;

	/** 첨부파일 ID */
	private String atchFileId;

	/** 조회수 */
	private Long rdcnt;

	/** 최초 등록일 */
	private String frstRegistPnttm;

	/** 검색 키워드 */
	private String keyword;

	/** 게시물 종류 */
	private String typeStr;

	/** 유해물질 */
	private String position;

	/** 리콜 후속 조치 */
	private String afterRecallCn;

	/** 제품군 */
	private String productType;

	/** 물질명 */
	private String materialName;

	/** 세부사항 */
	private String recallCn;

	/** 조건 BBS_ID */
	private String setBbsId;

	/** 조건 NTT_ID */
	private Long setNttId;

	/** 메뉴 ID */
	private String menuId;

	public String getBbsId() {
		return bbsId;
	}

	public void setBbsId(String bbsId) {
		this.bbsId = bbsId;
	}

	public String getNttId() {
		return nttId;
	}

	public void setNttId(String nttId) {
		this.nttId = nttId;
	}

	public String getNttSj() {
		return nttSj;
	}

	public void setNttSj(String nttSj) {
		this.nttSj = nttSj;
	}

	public String getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}

	public Long getRdcnt() {
		return rdcnt;
	}

	public void setRdcnt(Long rdcnt) {
		this.rdcnt = rdcnt;
	}

	public String getFrstRegistPnttm() {
		return frstRegistPnttm;
	}

	public void setFrstRegistPnttm(String frstRegistPnttm) {
		this.frstRegistPnttm = frstRegistPnttm;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getTypeStr() {
		return typeStr;
	}

	public void setTypeStr(String typeStr) {
		this.typeStr = typeStr;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getAfterRecallCn() {
		return afterRecallCn;
	}

	public void setAfterRecallCn(String afterRecallCn) {
		this.afterRecallCn = afterRecallCn;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}

	public String getRecallCn() {
		return recallCn;
	}

	public void setRecallCn(String recallCn) {
		this.recallCn = recallCn;
	}

	public String getSetBbsId() {
		return setBbsId;
	}

	public void setSetBbsId(String setBbsId) {
		this.setBbsId = setBbsId;
	}

	public Long getSetNttId() {
		return setNttId;
	}

	public void setSetNttId(Long setNttId) {
		this.setNttId = setNttId;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

}
