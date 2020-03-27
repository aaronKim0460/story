package egovframework.com.cop.bbs.service;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * @Class Name  : Board.java
 * @Description : 게시물에 대한 데이터 처리 모델
 * @Modification Information
 * 
 *     수정일         수정자                   수정내용
 *     -------          --------        ---------------------------
 *   2009.03.06       이삼섭                  최초 생성
 *
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009. 02. 13
 * @version 1.0
 * @see 
 * 
 */
@SuppressWarnings("serial")
public class Board implements Serializable {

	/**
	 * 게시물 첨부파일 아이디
	 */
	private String atchFileId = "";
	/**
	 * 게시판 아이디
	 */
	private String bbsId = "";
	/**
	 * 최초등록자 아이디
	 */
	private String frstRegisterId = "";
	/**
	 * 최초등록시점
	 */
	private String frstRegisterPnttm = "";
	/**
	 * 최종수정자 아이디
	 */
	private String lastUpdusrId = "";
	/**
	 * 최종수정시점
	 */
	private String lastUpdusrPnttm = "";
	/**
	 * 게시시작일
	 */
	private String ntceBgnde = "";
	/**
	 * 게시종료일
	 */
	private String ntceEndde = "";
	/**
	 * 게시자 아이디
	 */
	private String ntcrId = "";
	/**
	 * 게시자명
	 */
	private String ntcrNm = "";
	/**
	 * 게시물 내용
	 */
	private String nttCn = "";
	/**
	 * 게시물 아이디
	 */
	private long nttId = 0L;
	/**
	 * 게시물 번호
	 */
	private long nttNo = 0L;
	/**
	 * 게시물 제목
	 */
	private String nttSj = "";
	/**
	 * 부모글번호
	 */
	private String parnts = "0";
	/**
	 * 패스워드
	 */
	private String password = "";
	/**
	 * 조회수
	 */
	private int inqireCo = 0;
	/**
	 * 답장여부
	 */
	private String replyAt = "";
	/**
	 * 답장위치
	 */
	private String replyLc = "0";
	/**
	 * 정렬순서
	 */
	private long sortOrdr = 0L;
	/**
	 * 사용여부
	 */
	private String useAt = "";
	/**
	 * 게시 종료일
	 */
	private String ntceEnddeView = ""; 
	/**
	 * 게시 시작일
	 */
	private String ntceBgndeView = "";
	
	private String bbsNttSe = "";
	
	private String relateLink = "";
	
	private String nttDocSe = "";
	
	private String extStr0 = "";
	
	private String extStr1 = "";
    
    private String extStr2 = "";
    
    private String extStr3 = "";
    
    private String extStr4 = "";
    
    private String extStr5 = "";
    
    private String extStr6 = "";
    
    private String extStr7 = "";
    
    private String extStr8 = "";
    
    private String extStr9 = "";
    
    private String bbsTyCode = "";
    
    private String bbsAttrbCode = "";
    
    private String noticeAt = "0";
    
    /** 공공누리 */
    private String publicNuriTy = "";
    
    private String confmSttus;
    
    private String ntceDate;
    
    /** 개시일자 변경전 */
    private String ntceDateH;
    
    private int cateval = 0;
    
    
    private String smsNo = "";
    
    private String smsNo2 = "";
    
    private String smsNo3 = "";
    
    private int bbsPageSize = 0;
    
    private int bbsPageUnit = 0;
    
    private int menuType = 0;
    
    private String actionTy;
    
    private String nttSn;
    
    private String updusrIp;
    
    private String frstRegisterNm;
    private String frstRegistPnttm;
    private String rdcnt;
    private String parntscttNo;
    private String answerAt;
    private String answerLc;
    private String codeNm;
    private String cnt;
    private String bbsNm;
    private String bbsSiteId;
    private String siteNm;
    
    private String[] newFileSn;
    
    private String fileSn;
    private String fileSnNew;
    
    private String linkBbsId;
    
    private long linkNttId;
    
    private String linkAtchFileId;
    
    private String copyNttId;
    

    private String nttSe;
    
    private String preview;
    
    private String cl1DetailCode;
    
    private String cl2DetailCode;
    
    private String cl3DetailCode;
    
    /** 샵키워드검색 */
    private String keywordTag;
    
    /** 썸네일 아이디 */
    private String thumbFileId;
    
    /** 유해인자 아이디 */
    private String meterialId;
    /** 유해인자 물질명 */    
    private String meterialKname;
    
    /** 유해인자 카스번호 */
    private String meterialCas;
    
    /**
	 * atchFileId attribute를 리턴한다.
	 * @return the atchFileId
	 */
	public String getAtchFileId() {
		return atchFileId;
	}

	/**
	 * atchFileId attribute 값을 설정한다.
	 * @param atchFileId the atchFileId to set
	 */
	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}

	/**
	 * bbsId attribute를 리턴한다.
	 * @return the bbsId
	 */
	public String getBbsId() {
		return bbsId;
	}

	/**
	 * bbsId attribute 값을 설정한다.
	 * @param bbsId the bbsId to set
	 */
	public void setBbsId(String bbsId) {
		this.bbsId = bbsId;
	}

	/**
	 * frstRegisterId attribute를 리턴한다.
	 * @return the frstRegisterId
	 */
	public String getFrstRegisterId() {
		return frstRegisterId;
	}

	/**
	 * frstRegisterId attribute 값을 설정한다.
	 * @param frstRegisterId the frstRegisterId to set
	 */
	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}

	/**
	 * frstRegisterPnttm attribute를 리턴한다.
	 * @return the frstRegisterPnttm
	 */
	public String getFrstRegisterPnttm() {
		return frstRegisterPnttm;
	}

	/**
	 * frstRegisterPnttm attribute 값을 설정한다.
	 * @param frstRegisterPnttm the frstRegisterPnttm to set
	 */
	public void setFrstRegisterPnttm(String frstRegisterPnttm) {
		this.frstRegisterPnttm = frstRegisterPnttm;
	}

	/**
	 * lastUpdusrId attribute를 리턴한다.
	 * @return the lastUpdusrId
	 */
	public String getLastUpdusrId() {
		return lastUpdusrId;
	}

	/**
	 * lastUpdusrId attribute 값을 설정한다.
	 * @param lastUpdusrId the lastUpdusrId to set
	 */
	public void setLastUpdusrId(String lastUpdusrId) {
		this.lastUpdusrId = lastUpdusrId;
	}

	/**
	 * lastUpdusrPnttm attribute를 리턴한다.
	 * @return the lastUpdusrPnttm
	 */
	public String getLastUpdusrPnttm() {
		return lastUpdusrPnttm;
	}

	/**
	 * lastUpdusrPnttm attribute 값을 설정한다.
	 * @param lastUpdusrPnttm the lastUpdusrPnttm to set
	 */
	public void setLastUpdusrPnttm(String lastUpdusrPnttm) {
		this.lastUpdusrPnttm = lastUpdusrPnttm;
	}

	/**
	 * ntceBgnde attribute를 리턴한다.
	 * @return the ntceBgnde
	 */
	public String getNtceBgnde() {
		return ntceBgnde;
	}

	/**
	 * ntceBgnde attribute 값을 설정한다.
	 * @param ntceBgnde the ntceBgnde to set
	 */
	public void setNtceBgnde(String ntceBgnde) {
		this.ntceBgnde = ntceBgnde;
	}

	/**
	 * ntceEndde attribute를 리턴한다.
	 * @return the ntceEndde
	 */
	public String getNtceEndde() {
		return ntceEndde;
	}

	/**
	 * ntceEndde attribute 값을 설정한다.
	 * @param ntceEndde the ntceEndde to set
	 */
	public void setNtceEndde(String ntceEndde) {
		this.ntceEndde = ntceEndde;
	}

	/**
	 * ntcrId attribute를 리턴한다.
	 * @return the ntcrId
	 */
	public String getNtcrId() {
		return ntcrId;
	}

	/**
	 * ntcrId attribute 값을 설정한다.
	 * @param ntcrId the ntcrId to set
	 */
	public void setNtcrId(String ntcrId) {
		this.ntcrId = ntcrId;
	}

	/**
	 * ntcrNm attribute를 리턴한다.
	 * @return the ntcrNm
	 */
	public String getNtcrNm() {
		return ntcrNm;
	}

	/**
	 * ntcrNm attribute 값을 설정한다.
	 * @param ntcrNm the ntcrNm to set
	 */
	public void setNtcrNm(String ntcrNm) {
		this.ntcrNm = ntcrNm;
	}

	/**
	 * nttCn attribute를 리턴한다.
	 * @return the nttCn
	 */
	public String getNttCn() {
		return nttCn;
	}

	/**
	 * nttCn attribute 값을 설정한다.
	 * @param nttCn the nttCn to set
	 */
	public void setNttCn(String nttCn) {
		this.nttCn = nttCn;
	}

	/**
	 * nttId attribute를 리턴한다.
	 * @return the nttId
	 */
	public long getNttId() {
		return nttId;
	}

	/**
	 * nttId attribute 값을 설정한다.
	 * @param nttId the nttId to set
	 */
	public void setNttId(long nttId) {
		this.nttId = nttId;
	}

	/**
	 * nttNo attribute를 리턴한다.
	 * @return the nttNo
	 */
	public long getNttNo() {
		return nttNo;
	}

	/**
	 * nttNo attribute 값을 설정한다.
	 * @param nttNo the nttNo to set
	 */
	public void setNttNo(long nttNo) {
		this.nttNo = nttNo;
	}

	/**
	 * nttSj attribute를 리턴한다.
	 * @return the nttSj
	 */
	public String getNttSj() {
		return nttSj;
	}

	/**
	 * nttSj attribute 값을 설정한다.
	 * @param nttSj the nttSj to set
	 */
	public void setNttSj(String nttSj) {
		this.nttSj = nttSj;
	}

	/**
	 * parnts attribute를 리턴한다.
	 * @return the parnts
	 */
	public String getParnts() {
		return parnts;
	}

	/**
	 * parnts attribute 값을 설정한다.
	 * @param parnts the parnts to set
	 */
	public void setParnts(String parnts) {
		this.parnts = parnts;
	}

	/**
	 * password attribute를 리턴한다.
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * password attribute 값을 설정한다.
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * inqireCo attribute를 리턴한다.
	 * @return the inqireCo
	 */
	public int getInqireCo() {
		return inqireCo;
	}

	/**
	 * inqireCo attribute 값을 설정한다.
	 * @param inqireCo the inqireCo to set
	 */
	public void setInqireCo(int inqireCo) {
		this.inqireCo = inqireCo;
	}

	/**
	 * replyAt attribute를 리턴한다.
	 * @return the replyAt
	 */
	public String getReplyAt() {
		return replyAt;
	}

	/**
	 * replyAt attribute 값을 설정한다.
	 * @param replyAt the replyAt to set
	 */
	public void setReplyAt(String replyAt) {
		this.replyAt = replyAt;
	}

	/**
	 * replyLc attribute를 리턴한다.
	 * @return the replyLc
	 */
	public String getReplyLc() {
		return replyLc;
	}

	/**
	 * replyLc attribute 값을 설정한다.
	 * @param replyLc the replyLc to set
	 */
	public void setReplyLc(String replyLc) {
		this.replyLc = replyLc;
	}

	/**
	 * sortOrdr attribute를 리턴한다.
	 * @return the sortOrdr
	 */
	public long getSortOrdr() {
		return sortOrdr;
	}

	/**
	 * sortOrdr attribute 값을 설정한다.
	 * @param sortOrdr the sortOrdr to set
	 */
	public void setSortOrdr(long sortOrdr) {
		this.sortOrdr = sortOrdr;
	}

	/**
	 * useAt attribute를 리턴한다.
	 * @return the useAt
	 */
	public String getUseAt() {
		return useAt;
	}

	/**
	 * useAt attribute 값을 설정한다.
	 * @param useAt the useAt to set
	 */
	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}

	/**
	 * ntceEnddeView attribute를 리턴한다.
	 * @return the ntceEnddeView
	 */
	public String getNtceEnddeView() {
		return ntceEnddeView;
	}

	/**
	 * ntceEnddeView attribute 값을 설정한다.
	 * @param ntceEnddeView the ntceEnddeView to set
	 */
	public void setNtceEnddeView(String ntceEnddeView) {
		this.ntceEnddeView = ntceEnddeView;
	}

	/**
	 * ntceBgndeView attribute를 리턴한다.
	 * @return the ntceBgndeView
	 */
	public String getNtceBgndeView() {
		return ntceBgndeView;
	}

	/**
	 * ntceBgndeView attribute 값을 설정한다.
	 * @param ntceBgndeView the ntceBgndeView to set
	 */
	public void setNtceBgndeView(String ntceBgndeView) {
		this.ntceBgndeView = ntceBgndeView;
	}

	/**
	 * toString 메소드를 대치한다.
	 */
	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}

	public String getBbsNttSe() {
		return bbsNttSe;
	}

	public void setBbsNttSe(String bbsNttSe) {
		this.bbsNttSe = bbsNttSe;
	}

	public String getRelateLink() {
		return relateLink;
	}

	public void setRelateLink(String relateLink) {
		this.relateLink = relateLink;
	}

	public String getNttDocSe() {
		return nttDocSe;
	}

	public void setNttDocSe(String nttDocSe) {
		this.nttDocSe = nttDocSe;
	}



	public String getExtStr2() {
		return extStr2;
	}

	public void setExtStr2(String extStr2) {
		this.extStr2 = extStr2;
	}


	public String getExtStr3() {
		return extStr3;
	}

	public void setExtStr3(String extStr3) {
		this.extStr3 = extStr3;
	}

	public String getBbsTyCode() {
		return bbsTyCode;
	}

	public void setBbsTyCode(String bbsTyCode) {
		this.bbsTyCode = bbsTyCode;
	}

	public String getNoticeAt() {
		return noticeAt;
	}

	public void setNoticeAt(String noticeAt) {
		this.noticeAt = noticeAt;
	}

	public String getBbsAttrbCode() {
		return bbsAttrbCode;
	}

	public void setBbsAttrbCode(String bbsAttrbCode) {
		this.bbsAttrbCode = bbsAttrbCode;
	}

	public String getExtStr1() {
		return extStr1;
	}

	public void setExtStr1(String extStr1) {
		this.extStr1 = extStr1;
	}

	public String getExtStr4() {
		return extStr4;
	}

	public void setExtStr4(String extStr4) {
		this.extStr4 = extStr4;
	}

	public String getExtStr5() {
		return extStr5;
	}

	public void setExtStr5(String extStr5) {
		this.extStr5 = extStr5;
	}

	public String getExtStr6() {
		return extStr6;
	}

	public void setExtStr6(String extStr6) {
		this.extStr6 = extStr6;
	}

	public String getExtStr7() {
		return extStr7;
	}

	public void setExtStr7(String extStr7) {
		this.extStr7 = extStr7;
	}

	public String getExtStr8() {
		return extStr8;
	}

	public void setExtStr8(String extStr8) {
		this.extStr8 = extStr8;
	}

	public String getExtStr9() {
		return extStr9;
	}

	public void setExtStr9(String extStr9) {
		this.extStr9 = extStr9;
	}

	public int getCateval() {
		return cateval;
	}

	public void setCateval(int cateval) {
		this.cateval = cateval;
	}

	public String getSmsNo() {
		return smsNo;
	}

	public void setSmsNo(String smsNo) {
		this.smsNo = smsNo;
	}

	public String getSmsNo2() {
		return smsNo2;
	}

	public void setSmsNo2(String smsNo2) {
		this.smsNo2 = smsNo2;
	}

	public String getSmsNo3() {
		return smsNo3;
	}

	public void setSmsNo3(String smsNo3) {
		this.smsNo3 = smsNo3;
	}

	public String getExtStr0() {
		return extStr0;
	}

	public void setExtStr0(String extStr0) {
		this.extStr0 = extStr0;
	}

	public int getBbsPageSize() {
		return bbsPageSize;
	}

	public void setBbsPageSize(int bbsPageSize) {
		this.bbsPageSize = bbsPageSize;
	}

	public int getBbsPageUnit() {
		return bbsPageUnit;
	}

	public void setBbsPageUnit(int bbsPageUnit) {
		this.bbsPageUnit = bbsPageUnit;
	}

	public int getMenuType() {
		return menuType;
	}

	public void setMenuType(int menuType) {
		this.menuType = menuType;
	}

	public String getActionTy() {
		return actionTy;
	}

	public void setActionTy(String actionTy) {
		this.actionTy = actionTy;
	}

	public String getNttSn() {
		return nttSn;
	}

	public void setNttSn(String nttSn) {
		this.nttSn = nttSn;
	}

	public String getUpdusrIp() {
		return updusrIp;
	}

	public void setUpdusrIp(String updusrIp) {
		this.updusrIp = updusrIp;
	}

	public String getPublicNuriTy() {
		return publicNuriTy;
	}

	public void setPublicNuriTy(String publicNuriTy) {
		this.publicNuriTy = publicNuriTy;
	}

	public String getConfmSttus() {
		return confmSttus;
	}

	public void setConfmSttus(String confmSttus) {
		this.confmSttus = confmSttus;
	}

	public String getNtceDate() {
		return ntceDate;
	}

	public void setNtceDate(String ntceDate) {
		this.ntceDate = ntceDate;
	}
	
	public String getNtceDateH() {
		return ntceDateH;
	}

	public void setNtceDateH(String ntceDateH) {
		this.ntceDateH = ntceDateH;
	}

	public String getFrstRegisterNm() {
		return frstRegisterNm;
	}

	public void setFrstRegisterNm(String frstRegisterNm) {
		this.frstRegisterNm = frstRegisterNm;
	}

	public String getFrstRegistPnttm() {
		return frstRegistPnttm;
	}

	public void setFrstRegistPnttm(String frstRegistPnttm) {
		this.frstRegistPnttm = frstRegistPnttm;
	}

	public String getRdcnt() {
		return rdcnt;
	}

	public void setRdcnt(String rdcnt) {
		this.rdcnt = rdcnt;
	}

	public String getParntscttNo() {
		return parntscttNo;
	}

	public void setParntscttNo(String parntscttNo) {
		this.parntscttNo = parntscttNo;
	}

	public String getAnswerAt() {
		return answerAt;
	}

	public void setAnswerAt(String answerAt) {
		this.answerAt = answerAt;
	}

	public String getAnswerLc() {
		return answerLc;
	}

	public void setAnswerLc(String answerLc) {
		this.answerLc = answerLc;
	}

	public String getCodeNm() {
		return codeNm;
	}

	public void setCodeNm(String codeNm) {
		this.codeNm = codeNm;
	}

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public String getBbsNm() {
		return bbsNm;
	}

	public void setBbsNm(String bbsNm) {
		this.bbsNm = bbsNm;
	}

	public String getBbsSiteId() {
		return bbsSiteId;
	}

	public void setBbsSiteId(String bbsSiteId) {
		this.bbsSiteId = bbsSiteId;
	}

	public String getSiteNm() {
		return siteNm;
	}

	public void setSiteNm(String siteNm) {
		this.siteNm = siteNm;
	}

	public String[] getNewFileSn() {
		return newFileSn;
	}

	public void setNewFileSn(String[] newFileSn) {
		this.newFileSn = newFileSn;
	}

	public String getFileSnNew() {
		return fileSnNew;
	}

	public void setFileSnNew(String fileSnNew) {
		this.fileSnNew = fileSnNew;
	}

	public String getFileSn() {
		return fileSn;
	}

	public void setFileSn(String fileSn) {
		this.fileSn = fileSn;
	}

	public String getLinkBbsId() {
		return linkBbsId;
	}

	public void setLinkBbsId(String linkBbsId) {
		this.linkBbsId = linkBbsId;
	}

	public long getLinkNttId() {
		return linkNttId;
	}

	public void setLinkNttId(long linkNttId) {
		this.linkNttId = linkNttId;
	}

	public String getLinkAtchFileId() {
		return linkAtchFileId;
	}

	public void setLinkAtchFileId(String linkAtchFileId) {
		this.linkAtchFileId = linkAtchFileId;
	}

	public String getCopyNttId() {
		return copyNttId;
	}

	public void setCopyNttId(String copyNttId) {
		this.copyNttId = copyNttId;
	}

	public String getNttSe() {
		return nttSe;
	}

	public void setNttSe(String nttSe) {
		this.nttSe = nttSe;
	}

	public String getPreview() {
		return preview;
	}

	public void setPreview(String preview) {
		this.preview = preview;
	}

	public String getCl1DetailCode() {
		return cl1DetailCode;
	}

	public void setCl1DetailCode(String cl1DetailCode) {
		this.cl1DetailCode = cl1DetailCode;
	}

	public String getCl2DetailCode() {
		return cl2DetailCode;
	}

	public void setCl2DetailCode(String cl2DetailCode) {
		this.cl2DetailCode = cl2DetailCode;
	}

	public String getKeywordTag() {
		return keywordTag;
	}

	public void setKeywordTag(String keywordTag) {
		this.keywordTag = keywordTag;
	}

	public String getThumbFileId() {
		return thumbFileId;
	}

	public void setThumbFileId(String thumbFileId) {
		this.thumbFileId = thumbFileId;
	}

	public String getMeterialId() {
		return meterialId;
	}

	public void setMeterialId(String meterialId) {
		this.meterialId = meterialId;
	}

	public String getMeterialCas() {
		return meterialCas;
	}

	public void setMeterialCas(String meterialCas) {
		this.meterialCas = meterialCas;
	}

	public String getMeterialKname() {
		return meterialKname;
	}

	public void setMeterialKname(String meterialKname) {
		this.meterialKname = meterialKname;
	}

	public String getCl3DetailCode() {
		return cl3DetailCode;
	}

	public void setCl3DetailCode(String cl3DetailCode) {
		this.cl3DetailCode = cl3DetailCode;
	}
	
	
	
}
