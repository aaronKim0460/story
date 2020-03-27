package egovframework.com.cop.bbs.service;

import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang.builder.ToStringBuilder;

import egovframework.com.cmm.service.FileVO;

/**
 * 게시물 관리를 위한 VO 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------      --------    ---------------------------
 *   2009.3.19  이삼섭          최초 생성
 *   2009.06.29  한성곤		2단계 기능 추가 (댓글관리, 만족도조사)
 *
 * </pre>
 */
@SuppressWarnings("serial")
public class BoardVO extends Board implements Serializable {

    /** 검색시작일 */
    private String searchBgnDe = "";
    
    /** 검색조건 */
    private String searchCnd = "";
    
    /** 검색종료일 */
    private String searchEndDe = "";
    
    /** 검색단어 */
    private String searchWrd = "";
    
    /** 정렬순서(DESC,ASC) */
    private long sortOrdr = 0L;

    /** 검색사용여부 */
    private String searchUseYn = "";

    /** 현재페이지 */
    private int pageIndex = 1;

    /** 페이지갯수 */
    private int pageUnit = 10;

    /** 페이지사이즈 */
    private int pageSize = 10;

    /** 첫페이지 인덱스 */
    private int firstIndex = 1;

    /** 마지막페이지 인덱스 */
    private int lastIndex = 1;

    /** 페이지당 레코드 개수 */
    private int recordCountPerPage = 10;

    /** 레코드 번호 */
    private int rowNo = 0;

    /** 최초 등록자명 */
    private String frstRegisterNm = "";

    /** 최종 수정자명 */
    private String lastUpdusrNm = "";
    
    /** 유효여부 */
    private String isExpired = "N";

    /** 상위 정렬 순서 */
    private String parntsSortOrdr = "";

    /** 상위 답변 위치 */
    private String parntsReplyLc = "";

    /** 게시판 유형코드 */
    private String bbsTyCode = "";
    
    /** 게시판 속성코드 */
    private String bbsAttrbCode = "";

    /** 게시판 명 */
    private String bbsNm = "";

    /** 파일첨부가능여부 */
    private String fileAtchPosblAt = "";
    
    /** 첨부가능파일숫자 */
    private int posblAtchFileNumber = 0;
    
    /** 답장가능여부 */
    private String replyPosblAt = "";
    
    /** 조회 수 증가 여부 */
    private boolean plusCount = false;
    
    /** 로그인 여부 */
    private String loginReqAt = "";
    
    /** 코드 */
    private String code = "";
    
    /** 코드명 */
    private String codeNm = "";
    
    /** 관련링크 */
    private String relateLink = "";
    
    /** 문서구분 */
    private String nttDocSe = "";

    /** 공공누리 */
    private String publicNuriTy = "";
     
    private String extStr1 = "";
    
    
    private String extStr2 = "";
    
    
    private String extStr3 = "";
    
    /** 파일경로 */
    private String fileStreCours = "";
    
    /** 저장된 파일명 */
    private String streFileNm = "";
    
    /** 실제 파일명 */
    private String orignlFileNm = "";
    
    /** 파일 확장자 */
    private String fileExtn = "";
    
    /** 파일 확장자 */
    private String fileExtsn = "";
    
    /** 공지 게시물 여부 */
    private String noticeAt = "";
    
    /** TMP STR */
    private String tmpStr = "";
    
    /** 게시판 추가 설정 항목 */
    private String bbsSubOpt = "";
    
    /** 게시판 페이징 여부 */
    private int bbsSearchTerm = 0;
    
    /** 게시글 패스워드 */
    private String password = "";

    /** 이미지 리스트 출력 시 검색 조검 */
    private int imgSearchCnd = 0;
    
    private String fileSn = "";
    
    private String siteType = "";
    
    private String departCd = "";
    
    private String sectCd = "";
    
    private int cnReplace = 0;
    //---------------------------------
    // 2009.06.29 : 2단계 기능 추가
    //---------------------------------
    /** 하위 페이지 인덱스 (댓글 및 만족도 조사 여부 확인용) */
    private String subPageIndex = "";
    ////-------------------------------
    
    private String extStr4 = "";
    private String extStr5 = "";
    private String extStr6 = "";
    private String extStr7 = "";
    private String extStr8 = "";
    private String extStr9 = "";
    private String extStr0 = "";
    
    private String actionTy;
    
    private String nttSn;
    
    private String updusrIp;
    
    private String lastUpdtPnttm;
    
    private String lastUpdusrId;
    
    private String nttSe;
    
    private String bltnNo;
    
    private String confmSttus;
    
    private String ntceDate;
    
    private String ntceDateH;
   
    public String atchFileId = "";
    
    public String ntcrId = "";
    
    private int totCnt;
    
    private String preNttId;
    
    private String nextNttId;
    
    private String preNttSj;
    
    private String nextNttSj;
    
    private String viewTp;
    
    private String cl1DetailCode;
    private String cl2DetailCode;
    private String cl1DetailCodeNm;
    private String cl2DetailCodeNm;
    
    private String cl3DetailCode;
    
    /** 검색 분류1상세코드 */
    private String searchCl1DetailCode = "";
    /** 검색 분류2상세코드 */
    private String searchCl2DetailCode = "";
    
    /** 유해인자 이름 */
    private String meterialName;
    
    private String searchKname;
    private String searchCas;
    
    /** 첨부파일 정보 목록 */
    private List<FileVO> fileList;

    /** 통합검색 추가 **/
    private String menuNm;
    private String goUrl;
    private String rdCnt;
    private String grCnt;

    
    public String getMenuNm() {
		return menuNm;
	}

	public void setMenuNm(String menuNm) {
		this.menuNm = menuNm;
	}

	public String getGoUrl() {
		return goUrl;
	}

	public void setGoUrl(String goUrl) {
		this.goUrl = goUrl;
	}

	public String getRdCnt() {
		return rdCnt;
	}

	public void setRdCnt(String rdCnt) {
		this.rdCnt = rdCnt;
	}

	
	public String getGrCnt() {
		return grCnt;
	}

	public void setGrCnt(String grCnt) {
		this.grCnt = grCnt;
	}

	public String getPublicNuriTy() {
		return publicNuriTy;
	}

	public void setPublicNuriTy(String publicNuriTy) {
		this.publicNuriTy = publicNuriTy;
	}

	/**
     * searchBgnDe attribute를 리턴한다.
     * 
     * @return the searchBgnDe
     */
    public String getSearchBgnDe() {
	return searchBgnDe;
    }

    /**
     * searchBgnDe attribute 값을 설정한다.
     * 
     * @param searchBgnDe
     *            the searchBgnDe to set
     */
    public void setSearchBgnDe(String searchBgnDe) {
	this.searchBgnDe = searchBgnDe;
    }

    /**
     * searchCnd attribute를 리턴한다.
     * 
     * @return the searchCnd
     */
    public String getSearchCnd() {
	return searchCnd;
    }

    /**
     * searchCnd attribute 값을 설정한다.
     * 
     * @param searchCnd
     *            the searchCnd to set
     */
    public void setSearchCnd(String searchCnd) {
	this.searchCnd = searchCnd;
    }

    /**
     * searchEndDe attribute를 리턴한다.
     * 
     * @return the searchEndDe
     */
    public String getSearchEndDe() {
	return searchEndDe;
    }

    /**
     * searchEndDe attribute 값을 설정한다.
     * 
     * @param searchEndDe
     *            the searchEndDe to set
     */
    public void setSearchEndDe(String searchEndDe) {
	this.searchEndDe = searchEndDe;
    }

    /**
     * searchWrd attribute를 리턴한다.
     * 
     * @return the searchWrd
     */
    public String getSearchWrd() {
	return searchWrd;
    }

    /**
     * searchWrd attribute 값을 설정한다.
     * 
     * @param searchWrd
     *            the searchWrd to set
     */
    public void setSearchWrd(String searchWrd) {
	this.searchWrd = searchWrd;
    }

    /**
     * sortOrdr attribute를 리턴한다.
     * 
     * @return the sortOrdr
     */
    public long getSortOrdr() {
	return sortOrdr;
    }

    /**
     * sortOrdr attribute 값을 설정한다.
     * 
     * @param sortOrdr
     *            the sortOrdr to set
     */
    public void setSortOrdr(long sortOrdr) {
	this.sortOrdr = sortOrdr;
    }

    /**
     * searchUseYn attribute를 리턴한다.
     * 
     * @return the searchUseYn
     */
    public String getSearchUseYn() {
	return searchUseYn;
    }

    /**
     * searchUseYn attribute 값을 설정한다.
     * 
     * @param searchUseYn
     *            the searchUseYn to set
     */
    public void setSearchUseYn(String searchUseYn) {
	this.searchUseYn = searchUseYn;
    }

    /**
     * pageIndex attribute를 리턴한다.
     * 
     * @return the pageIndex
     */
    public int getPageIndex() {
	return pageIndex;
    }

    /**
     * pageIndex attribute 값을 설정한다.
     * 
     * @param pageIndex
     *            the pageIndex to set
     */
    public void setPageIndex(int pageIndex) {
	this.pageIndex = pageIndex;
    }

    /**
     * pageUnit attribute를 리턴한다.
     * 
     * @return the pageUnit
     */
    public int getPageUnit() {
	return pageUnit;
    }

    /**
     * pageUnit attribute 값을 설정한다.
     * 
     * @param pageUnit
     *            the pageUnit to set
     */
    public void setPageUnit(int pageUnit) {
	this.pageUnit = pageUnit;
    }

    /**
     * pageSize attribute를 리턴한다.
     * 
     * @return the pageSize
     */
    public int getPageSize() {
	return pageSize;
    }

    /**
     * pageSize attribute 값을 설정한다.
     * 
     * @param pageSize
     *            the pageSize to set
     */
    public void setPageSize(int pageSize) {
	this.pageSize = pageSize;
    }

    /**
     * firstIndex attribute를 리턴한다.
     * 
     * @return the firstIndex
     */
    public int getFirstIndex() {
	return firstIndex;
    }

    /**
     * firstIndex attribute 값을 설정한다.
     * 
     * @param firstIndex
     *            the firstIndex to set
     */
    public void setFirstIndex(int firstIndex) {
	this.firstIndex = firstIndex;
    }

    /**
     * lastIndex attribute를 리턴한다.
     * 
     * @return the lastIndex
     */
    public int getLastIndex() {
	return lastIndex;
    }

    /**
     * lastIndex attribute 값을 설정한다.
     * 
     * @param lastIndex
     *            the lastIndex to set
     */
    public void setLastIndex(int lastIndex) {
	this.lastIndex = lastIndex;
    }

    /**
     * recordCountPerPage attribute를 리턴한다.
     * 
     * @return the recordCountPerPage
     */
    public int getRecordCountPerPage() {
	return recordCountPerPage;
    }

    /**
     * recordCountPerPage attribute 값을 설정한다.
     * 
     * @param recordCountPerPage
     *            the recordCountPerPage to set
     */
    public void setRecordCountPerPage(int recordCountPerPage) {
	this.recordCountPerPage = recordCountPerPage;
    }

    /**
     * rowNo attribute를 리턴한다.
     * 
     * @return the rowNo
     */
    public int getRowNo() {
	return rowNo;
    }

    /**
     * rowNo attribute 값을 설정한다.
     * 
     * @param rowNo
     *            the rowNo to set
     */
    public void setRowNo(int rowNo) {
	this.rowNo = rowNo;
    }

    /**
     * frstRegisterNm attribute를 리턴한다.
     * 
     * @return the frstRegisterNm
     */
    public String getFrstRegisterNm() {
	return frstRegisterNm;
    }

    /**
     * frstRegisterNm attribute 값을 설정한다.
     * 
     * @param frstRegisterNm
     *            the frstRegisterNm to set
     */
    public void setFrstRegisterNm(String frstRegisterNm) {
	this.frstRegisterNm = frstRegisterNm;
    }

    /**
     * lastUpdusrNm attribute를 리턴한다.
     * 
     * @return the lastUpdusrNm
     */
    public String getLastUpdusrNm() {
	return lastUpdusrNm;
    }

    /**
     * lastUpdusrNm attribute 값을 설정한다.
     * 
     * @param lastUpdusrNm
     *            the lastUpdusrNm to set
     */
    public void setLastUpdusrNm(String lastUpdusrNm) {
	this.lastUpdusrNm = lastUpdusrNm;
    }

    /**
     * isExpired attribute를 리턴한다.
     * 
     * @return the isExpired
     */
    public String getIsExpired() {
	return isExpired;
    }

    /**
     * isExpired attribute 값을 설정한다.
     * 
     * @param isExpired
     *            the isExpired to set
     */
    public void setIsExpired(String isExpired) {
	this.isExpired = isExpired;
    }

    /**
     * parntsSortOrdr attribute를 리턴한다.
     * 
     * @return the parntsSortOrdr
     */
    public String getParntsSortOrdr() {
	return parntsSortOrdr;
    }

    /**
     * parntsSortOrdr attribute 값을 설정한다.
     * 
     * @param parntsSortOrdr
     *            the parntsSortOrdr to set
     */
    public void setParntsSortOrdr(String parntsSortOrdr) {
	this.parntsSortOrdr = parntsSortOrdr;
    }

    /**
     * parntsReplyLc attribute를 리턴한다.
     * 
     * @return the parntsReplyLc
     */
    public String getParntsReplyLc() {
	return parntsReplyLc;
    }

    /**
     * parntsReplyLc attribute 값을 설정한다.
     * 
     * @param parntsReplyLc
     *            the parntsReplyLc to set
     */
    public void setParntsReplyLc(String parntsReplyLc) {
	this.parntsReplyLc = parntsReplyLc;
    }

    /**
     * bbsTyCode attribute를 리턴한다.
     * 
     * @return the bbsTyCode
     */
    public String getBbsTyCode() {
	return bbsTyCode;
    }

    /**
     * bbsTyCode attribute 값을 설정한다.
     * 
     * @param bbsTyCode
     *            the bbsTyCode to set
     */
    public void setBbsTyCode(String bbsTyCode) {
	this.bbsTyCode = bbsTyCode;
    }

    /**
     * bbsAttrbCode attribute를 리턴한다.
     * 
     * @return the bbsAttrbCode
     */
    public String getBbsAttrbCode() {
	return bbsAttrbCode;
    }

    /**
     * bbsAttrbCode attribute 값을 설정한다.
     * 
     * @param bbsAttrbCode
     *            the bbsAttrbCode to set
     */
    public void setBbsAttrbCode(String bbsAttrbCode) {
	this.bbsAttrbCode = bbsAttrbCode;
    }

    /**
     * bbsNm attribute를 리턴한다.
     * 
     * @return the bbsNm
     */
    public String getBbsNm() {
	return bbsNm;
    }

    /**
     * bbsNm attribute 값을 설정한다.
     * 
     * @param bbsNm
     *            the bbsNm to set
     */
    public void setBbsNm(String bbsNm) {
	this.bbsNm = bbsNm;
    }

    /**
     * fileAtchPosblAt attribute를 리턴한다.
     * 
     * @return the fileAtchPosblAt
     */
    public String getFileAtchPosblAt() {
	return fileAtchPosblAt;
    }

    /**
     * fileAtchPosblAt attribute 값을 설정한다.
     * 
     * @param fileAtchPosblAt
     *            the fileAtchPosblAt to set
     */
    public void setFileAtchPosblAt(String fileAtchPosblAt) {
	this.fileAtchPosblAt = fileAtchPosblAt;
    }

    /**
     * posblAtchFileNumber attribute를 리턴한다.
     * 
     * @return the posblAtchFileNumber
     */
    public int getPosblAtchFileNumber() {
	return posblAtchFileNumber;
    }

    /**
     * posblAtchFileNumber attribute 값을 설정한다.
     * 
     * @param posblAtchFileNumber
     *            the posblAtchFileNumber to set
     */
    public void setPosblAtchFileNumber(int posblAtchFileNumber) {
	this.posblAtchFileNumber = posblAtchFileNumber;
    }

    /**
     * replyPosblAt attribute를 리턴한다.
     * 
     * @return the replyPosblAt
     */
    public String getReplyPosblAt() {
	return replyPosblAt;
    }

    /**
     * replyPosblAt attribute 값을 설정한다.
     * 
     * @param replyPosblAt
     *            the replyPosblAt to set
     */
    public void setReplyPosblAt(String replyPosblAt) {
	this.replyPosblAt = replyPosblAt;
    }

    /**
     * plusCount attribute를 리턴한다.
     * @return the plusCount
     */
    public boolean isPlusCount() {
        return plusCount;
    }

    /**
     * plusCount attribute 값을 설정한다.
     * @param plusCount the plusCount to set
     */
    public void setPlusCount(boolean plusCount) {
        this.plusCount = plusCount;
    }

    /**
     * subPageIndex attribute를 리턴한다.
     * @return the subPageIndex
     */
    public String getSubPageIndex() {
        return subPageIndex;
    }

    /**
     * subPageIndex attribute 값을 설정한다.
     * @param subPageIndex the subPageIndex to set
     */
    public void setSubPageIndex(String subPageIndex) {
        this.subPageIndex = subPageIndex;
    }

    /**
     * toString 메소드를 대치한다.
     */
    public String toString() {
	return ToStringBuilder.reflectionToString(this);
    }

	public String getLoginReqAt() {
		return loginReqAt;
	}

	public void setLoginReqAt(String loginReqAt) {
		this.loginReqAt = loginReqAt;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCodeNm() {
		return codeNm;
	}

	public void setCodeNm(String codeNm) {
		this.codeNm = codeNm;
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


	public String getExtStr1() {
		return extStr1;
	}

	public void setExtStr1(String extStr1) {
		this.extStr1 = extStr1;
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

	public String getFileStreCours() {
		return fileStreCours;
	}

	public void setFileStreCours(String fileStreCours) {
		this.fileStreCours = fileStreCours;
	}

	public String getStreFileNm() {
		return streFileNm;
	}

	public void setStreFileNm(String streFileNm) {
		this.streFileNm = streFileNm;
	}

	public String getOrignlFileNm() {
		return orignlFileNm;
	}

	public void setOrignlFileNm(String orignlFileNm) {
		this.orignlFileNm = orignlFileNm;
	}

	public String getFileExtn() {
		return fileExtn;
	}

	public void setFileExtn(String fileExtn) {
		this.fileExtn = fileExtn;
	}

	public String getNoticeAt() {
		return noticeAt;
	}

	public void setNoticeAt(String noticeAt) {
		this.noticeAt = noticeAt;
	}

	public String getTmpStr() {
		return tmpStr;
	}

	public void setTmpStr(String tmpStr) {
		this.tmpStr = tmpStr;
	}

	public int getBbsSearchTerm() {
		return bbsSearchTerm;
	}

	public void setBbsSearchTerm(int bbsSearchTerm) {
		this.bbsSearchTerm = bbsSearchTerm;
	}

	public String getBbsSubOpt() {
		return bbsSubOpt;
	}

	public void setBbsSubOpt(String bbsSubOpt) {
		this.bbsSubOpt = bbsSubOpt;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getImgSearchCnd() {
		return imgSearchCnd;
	}

	public void setImgSearchCnd(int imgSearchCnd) {
		this.imgSearchCnd = imgSearchCnd;
	}

	public String getFileSn() {
		return fileSn;
	}

	public void setFileSn(String fileSn) {
		this.fileSn = fileSn;
	}

	public String getSiteType() {
		return siteType;
	}

	public void setSiteType(String siteType) {
		this.siteType = siteType;
	}

	public String getDepartCd() {
		return departCd;
	}

	public void setDepartCd(String departCd) {
		this.departCd = departCd;
	}

	public String getSectCd() {
		return sectCd;
	}

	public void setSectCd(String sectCd) {
		this.sectCd = sectCd;
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

	public String getExtStr0() {
		return extStr0;
	}

	public void setExtStr0(String extStr0) {
		this.extStr0 = extStr0;
	}

	public int getCnReplace() {
		return cnReplace;
	}

	public void setCnReplace(int cnReplace) {
		this.cnReplace = cnReplace;
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

	public String getNttSe() {
		return nttSe;
	}

	public void setNttSe(String nttSe) {
		this.nttSe = nttSe;
	}

	public String getBltnNo() {
		return bltnNo;
	}

	public void setBltnNo(String bltnNo) {
		this.bltnNo = bltnNo;
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
	
	public String getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}

	public String getFileExtsn() {
		return fileExtsn;
	}

	public void setFileExtsn(String fileExtsn) {
		this.fileExtsn = fileExtsn;
	}

	public String getNtcrId() {
		return ntcrId;
	}

	public void setNtcrId(String ntcrId) {
		this.ntcrId = ntcrId;
	}

	public int getTotCnt() {
		return totCnt;
	}

	public void setTotCnt(int totCnt) {
		this.totCnt = totCnt;
	}

	public String getPreNttId() {
		return preNttId;
	}

	public void setPreNttId(String preNttId) {
		this.preNttId = preNttId;
	}

	public String getNextNttId() {
		return nextNttId;
	}

	public void setNextNttId(String nextNttId) {
		this.nextNttId = nextNttId;
	}

	public String getPreNttSj() {
		return preNttSj;
	}

	public void setPreNttSj(String preNttSj) {
		this.preNttSj = preNttSj;
	}

	public String getNextNttSj() {
		return nextNttSj;
	}

	public void setNextNttSj(String nextNttSj) {
		this.nextNttSj = nextNttSj;
	}

	public String getViewTp() {
		return viewTp;
	}

	public void setViewTp(String viewTp) {
		this.viewTp = viewTp;
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

	public String getCl1DetailCodeNm() {
		return cl1DetailCodeNm;
	}

	public void setCl1DetailCodeNm(String cl1DetailCodeNm) {
		this.cl1DetailCodeNm = cl1DetailCodeNm;
	}

	public String getCl2DetailCodeNm() {
		return cl2DetailCodeNm;
	}

	public void setCl2DetailCodeNm(String cl2DetailCodeNm) {
		this.cl2DetailCodeNm = cl2DetailCodeNm;
	}

	public String getSearchCl1DetailCode() {
		return searchCl1DetailCode;
	}

	public void setSearchCl1DetailCode(String searchCl1DetailCode) {
		this.searchCl1DetailCode = searchCl1DetailCode;
	}

	public String getSearchCl2DetailCode() {
		return searchCl2DetailCode;
	}

	public void setSearchCl2DetailCode(String searchCl2DetailCode) {
		this.searchCl2DetailCode = searchCl2DetailCode;
	}

	public String getMeterialName() {
		return meterialName;
	}

	public void setMeterialName(String meterialName) {
		this.meterialName = meterialName;
	}

	public List<FileVO> getFileList() {
		return fileList;
	}

	public void setFileList(List<FileVO> fileList) {
		this.fileList = fileList;
	}

	public String getSearchKname() {
		return searchKname;
	}

	public void setSearchKname(String searchKname) {
		this.searchKname = searchKname;
	}

	public String getSearchCas() {
		return searchCas;
	}

	public void setSearchCas(String searchCas) {
		this.searchCas = searchCas;
	}

	public String getCl3DetailCode() {
		return cl3DetailCode;
	}

	public void setCl3DetailCode(String cl3DetailCode) {
		this.cl3DetailCode = cl3DetailCode;
	}
	
	
}