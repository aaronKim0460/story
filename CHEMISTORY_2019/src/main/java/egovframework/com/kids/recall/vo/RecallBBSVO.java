/**
 * @Name : RecallBBSVO.java
 * @Description : 위해용품리콜VO.
 * @author 이한구
 * @since 2016. 11. 16.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 11. 16.	이한구. 최초 생성.
 */
package egovframework.com.kids.recall.vo;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

@SuppressWarnings("serial")
public class RecallBBSVO extends ComDefaultVO {

	/** 리콜_ID */
	private String recallId;

	/** 제품_명 */
	private String productName;

	/** 제품_출처 */
	private String productWhence;

	/** 국내국외_구분 */
	private String domesticYn;

	/** 국가_명 */
	private String countryName;

	/** 제품_설명 */
	private String productCn;

	/** 리콜_세부사항 */
	private String recallCn;

	/** 첨부_파일_ID */
	private String atchFileId;

	/** 리콜_후속조치_내용 */
	private String afterRecallCn;

	/** 최초_등록_일시 */
	private String frstRegistPnttm;

	/** 최초_등록자_ID */
	private String frstRegisterId;

	/** 최후_수정_일시 */
	private String lastUpdtPnttm;

	/** 최후_수정자_ID */
	private String lastUpdusrId;

	/** 유해인자 이름 */
	private String materialName;

	/** 제품군 이름 */
	private String productType;

	/** 제품코드 */
	private String productCd;

	/** 유해인자(국외용) */
	private String position;

	/** 유해인자 목록 */
	private List<RecallMaterialVO> materialList;

	/** 등록, 삭제용 변수 */
	private String[] mIdxs;

	/** 샵키워드검색 */
	private String keywordTag;

	/** 조회수 증가여부 */
	private String viewCountUpdateYn;

	/** 공표일 **/
	private String publishDt;
	
	/** 국내어린이용품 탭별 제품 구분 값 **/
	private String productTabCd;
	
	public String getRecallId() {
		return recallId;
	}

	public void setRecallId(String recallId) {
		this.recallId = recallId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductWhence() {
		return productWhence;
	}

	public void setProductWhence(String productWhence) {
		this.productWhence = productWhence;
	}

	public String getDomesticYn() {
		return domesticYn;
	}

	public void setDomesticYn(String domesticYn) {
		this.domesticYn = domesticYn;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public String getProductCn() {
		return productCn;
	}

	public void setProductCn(String productCn) {
		this.productCn = productCn;
	}

	public String getRecallCn() {
		return recallCn;
	}

	public void setRecallCn(String recallCn) {
		this.recallCn = recallCn;
	}

	public String getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}

	public String getAfterRecallCn() {
		return afterRecallCn;
	}

	public void setAfterRecallCn(String afterRecallCn) {
		this.afterRecallCn = afterRecallCn;
	}

	public String getFrstRegistPnttm() {
		return frstRegistPnttm;
	}

	public void setFrstRegistPnttm(String frstRegistPnttm) {
		this.frstRegistPnttm = frstRegistPnttm;
	}

	public String getFrstRegisterId() {
		return frstRegisterId;
	}

	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}

	public String getLastUpdtPnttm() {
		return lastUpdtPnttm;
	}

	public void setLastUpdtPnttm(String lastUpdtPnttm) {
		this.lastUpdtPnttm = lastUpdtPnttm;
	}

	public String getLastUpdusrId() {
		return lastUpdusrId;
	}

	public void setLastUpdusrId(String lastUpdusrId) {
		this.lastUpdusrId = lastUpdusrId;
	}

	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}

	public List<RecallMaterialVO> getMaterialList() {
		return materialList;
	}

	public void setMaterialList(List<RecallMaterialVO> materialList) {
		this.materialList = materialList;
	}

	public String[] getmIdxs() {
		return mIdxs;
	}

	public void setmIdxs(String[] mIdxs) {
		this.mIdxs = mIdxs;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getProductCd() {
		return productCd;
	}

	public void setProductCd(String productCd) {
		this.productCd = productCd;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getKeywordTag() {
		return keywordTag;
	}

	public void setKeywordTag(String keywordTag) {
		this.keywordTag = keywordTag;
	}

	public String getViewCountUpdateYn() {
		return viewCountUpdateYn;
	}

	public void setViewCountUpdateYn(String viewCountUpdateYn) {
		this.viewCountUpdateYn = viewCountUpdateYn;
	}

	public String getPublishDt() {
		return publishDt;
	}

	public void setPublishDt(String publishDt) {
		this.publishDt = publishDt;
	}

	public String getProductTabCd() {
		return productTabCd;
	}

	public void setProductTabCd(String productTabCd) {
		this.productTabCd = productTabCd;
	}
	
}
