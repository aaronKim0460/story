package egovframework.com.cop.bbs.service;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * 게시판 속성 정보를 관리하기 위한 VO  클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.3.12  이삼섭          최초 생성
 *
 * </pre>
 */
@SuppressWarnings("serial")
public class BoardMasterVO extends BoardMaster implements Serializable {

    /** 검색시작일 */
    private String searchBgnDe = "";

    /** 검색조건 */
    private String searchCnd = "";

    /** 검색종료일 */
    private String searchEndDe = "";

    /** 검색단어 */
    private String searchWrd = "";

    /** 정렬순서(DESC,ASC) */
    private String sortOrdr = "";

    /** 검색사용여부 */
    private String searchUseYn = "";

    /** 현재페이지 */
    private int pageIndex = 1;

    /** 페이지갯수 */
    private int pageUnit = 10;

    /** 페이지사이즈 */
    private int pageSize = 10;

    /** firstIndex */
    private int firstIndex = 1;

    /** lastIndex */
    private int lastIndex = 1;

    /** recordCountPerPage */
    private int recordCountPerPage = 10;

    /** rowNo */
    private int rowNo = 0;

    /** 최초 등록자명 */
    private String frstRegisterNm = "";

    /** 게시판유형 코드 */
    private String bbsTyCode = "";
    
    /** 게시판유형 코드명 */
    private String bbsTyCodeNm = "";

    /** 게시판속성 코드명 */
    private String bbsAttrbCodeNm = "";

    /** 템플릿 명 */
    private String tmplatNm = "";

    /** 최종 수정자명 */
    private String lastUpdusrNm = "";

    /** 권한지정 여부 */
    private String authFlag = "";

    /** 템플릿경로 */
    private String tmplatCours = "";

    /** 게시판 로그인 여부 */
    private String loginReqAt = "";

    /** 코드명 */
    private String codeNm = "";

    /**  */
    private String deCodeId = "";

    /** 문서구분  */
    private String nttDocSe = "";

    /** 사이트 구분 */
    private String siteType = "";
    
    /** 게시판 설명 이미지 경로 */
    private String bbsDcImagePath = "";
    
    /** 게시판 설명 이미지 명 */
    private String bbsDcImageNm = "";
    

    private String bbsSubOpt = "";

    private int bbsPageUnit = 0;

    private int bbsPageSize = 0;

    /** 공공누리 */
    private String publicNuriTy = "";

    /** 연동 여부 */
    private String intrlckYn;

    /** 승인 사용 여부 */
    private String confmUseYn;
    
    private String confmSttus;
    
    private String ntceDate;
    
    private String ntceDateH;
    
    private String menuDc;
    
    private String siteId;
    
    private int totCnt;
    
    /** 사용자 목록 페이지 */
    private String userListPge = "";
    /** 사용자 상세 페이지 */
    private String userDetailPge = "";
    /** 사용자 등록 페이지 */
    private String userRegistPge = "";
    /** 사용자 수정 페이지 */
    private String userUpdtPge = "";
    
    /** 관리자 목록 페이지 */
    private String mngrListPge = "";
    /** 관리자 상세 페이지 */
    private String mngrDetailPge = "";
    /** 관리자 등록 페이지 */
    private String mngrRegistPge = "";
    /** 관리자 수정 페이지 */
    private String mngrUpdtPge = "";
    
    /** 분류1_코드 (머리말코드) */
    private String cl1Code = "";
    private String cl1CodeNm = "";
    /** 분류2_코드 (머리말코드) */
    private String cl2Code = "";
    private String cl2CodeNm = "";
    
    /** 기타0~9_분류_명 */
    private String etc0ClNm = "";
    private String etc1ClNm = "";
    private String etc2ClNm = "";
    private String etc3ClNm = "";
    private String etc4ClNm = "";
    private String etc5ClNm = "";
    private String etc6ClNm = "";
    private String etc7ClNm = "";
    private String etc8ClNm = "";
    private String etc9ClNm = "";

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
    public String getSortOrdr() {
	return sortOrdr;
    }

    /**
     * sortOrdr attribute 값을 설정한다.
     *
     * @param sortOrdr
     *            the sortOrdr to set
     */
    public void setSortOrdr(String sortOrdr) {
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
     * bbsTyCodeNm attribute를 리턴한다.
     *
     * @return the bbsTyCodeNm
     */
    public String getBbsTyCodeNm() {
	return bbsTyCodeNm;
    }

    /**
     * bbsTyCodeNm attribute 값을 설정한다.
     *
     * @param bbsTyCodeNm
     *            the bbsTyCodeNm to set
     */
    public void setBbsTyCodeNm(String bbsTyCodeNm) {
	this.bbsTyCodeNm = bbsTyCodeNm;
    }

    /**
     * bbsAttrbCodeNm attribute를 리턴한다.
     *
     * @return the bbsAttrbCodeNm
     */
    public String getBbsAttrbCodeNm() {
	return bbsAttrbCodeNm;
    }

    /**
     * bbsAttrbCodeNm attribute 값을 설정한다.
     *
     * @param bbsAttrbCodeNm
     *            the bbsAttrbCodeNm to set
     */
    public void setBbsAttrbCodeNm(String bbsAttrbCodeNm) {
	this.bbsAttrbCodeNm = bbsAttrbCodeNm;
    }

    /**
     * tmplatNm attribute를 리턴한다.
     *
     * @return the tmplatNm
     */
    public String getTmplatNm() {
	return tmplatNm;
    }

    /**
     * tmplatNm attribute 값을 설정한다.
     *
     * @param tmplatNm
     *            the tmplatNm to set
     */
    public void setTmplatNm(String tmplatNm) {
	this.tmplatNm = tmplatNm;
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
     * authFlag attribute를 리턴한다.
     *
     * @return the authFlag
     */
    public String getAuthFlag() {
	return authFlag;
    }

    /**
     * authFlag attribute 값을 설정한다.
     *
     * @param authFlag
     *            the authFlag to set
     */
    public void setAuthFlag(String authFlag) {
	this.authFlag = authFlag;
    }

    /**
     * tmplatCours attribute를 리턴한다.
     *
     * @return the tmplatCours
     */
    public String getTmplatCours() {
	return tmplatCours;
    }

    /**
     * tmplatCours attribute 값을 설정한다.
     *
     * @param tmplatCours
     *            the tmplatCours to set
     */
    public void setTmplatCours(String tmplatCours) {
	this.tmplatCours = tmplatCours;
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

	public String getCodeNm() {
		return codeNm;
	}

	public void setCodeNm(String codeNm) {
		this.codeNm = codeNm;
	}

	public String getDeCodeId() {
		return deCodeId;
	}

	public void setDeCodeId(String deCodeId) {
		this.deCodeId = deCodeId;
	}

	public String getNttDocSe() {
		return nttDocSe;
	}

	public void setNttDocSe(String nttDocSe) {
		this.nttDocSe = nttDocSe;
	}

	public String getSiteType() {
		return siteType;
	}

	public void setSiteType(String siteType) {
		this.siteType = siteType;
	}
	
	public String getBbsDcImagePath() {
		return bbsDcImagePath;
	}

	public void setBbsDcImagePath(String bbsDcImagePath) {
		this.bbsDcImagePath = bbsDcImagePath;
	}

	public String getBbsDcImageNm() {
		return bbsDcImageNm;
	}

	public void setBbsDcImageNm(String bbsDcImageNm) {
		this.bbsDcImageNm = bbsDcImageNm;
	}

	public String getBbsSubOpt() {
		return bbsSubOpt;
	}

	public void setBbsSubOpt(String bbsSubOpt) {
		this.bbsSubOpt = bbsSubOpt;
	}

	public int getBbsPageUnit() {
		return bbsPageUnit;
	}

	public void setBbsPageUnit(int bbsPageUnit) {
		this.bbsPageUnit = bbsPageUnit;
	}

	public int getBbsPageSize() {
		return bbsPageSize;
	}

	public void setBbsPageSize(int bbsPageSize) {
		this.bbsPageSize = bbsPageSize;
	}

    public String getPublicNuriTy() {
		return publicNuriTy;
	}

	public String getIntrlckYn() {
		return intrlckYn;
	}

	public void setIntrlckYn(String intrlckYn) {
		this.intrlckYn = intrlckYn;
	}

	public String getConfmUseYn() {
		return confmUseYn;
	}

	public void setConfmUseYn(String confmUseYn) {
		this.confmUseYn = confmUseYn;
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

	
	public String getMenuDc() {
		return menuDc;
	}

	public void setMenuDc(String menuDc) {
		this.menuDc = menuDc;
	}

	public String getSiteId() {
		return siteId;
	}

	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}

	public int getTotCnt() {
		return totCnt;
	}

	public void setTotCnt(int totCnt) {
		this.totCnt = totCnt;
	}

	public String getUserListPge() {
		return userListPge;
	}

	public void setUserListPge(String userListPge) {
		this.userListPge = userListPge;
	}

	public String getUserDetailPge() {
		return userDetailPge;
	}

	public void setUserDetailPge(String userDetailPge) {
		this.userDetailPge = userDetailPge;
	}

	public String getUserRegistPge() {
		return userRegistPge;
	}

	public void setUserRegistPge(String userRegistPge) {
		this.userRegistPge = userRegistPge;
	}

	public String getUserUpdtPge() {
		return userUpdtPge;
	}

	public void setUserUpdtPge(String userUpdtPge) {
		this.userUpdtPge = userUpdtPge;
	}

	public String getMngrListPge() {
		return mngrListPge;
	}

	public void setMngrListPge(String mngrListPge) {
		this.mngrListPge = mngrListPge;
	}

	public String getMngrDetailPge() {
		return mngrDetailPge;
	}

	public void setMngrDetailPge(String mngrDetailPge) {
		this.mngrDetailPge = mngrDetailPge;
	}

	public String getMngrRegistPge() {
		return mngrRegistPge;
	}

	public void setMngrRegistPge(String mngrRegistPge) {
		this.mngrRegistPge = mngrRegistPge;
	}

	public String getMngrUpdtPge() {
		return mngrUpdtPge;
	}

	public void setMngrUpdtPge(String mngrUpdtPge) {
		this.mngrUpdtPge = mngrUpdtPge;
	}

	public String getCl1Code() {
		return cl1Code;
	}

	public void setCl1Code(String cl1Code) {
		this.cl1Code = cl1Code;
	}

	public String getCl2Code() {
		return cl2Code;
	}

	public void setCl2Code(String cl2Code) {
		this.cl2Code = cl2Code;
	}
	
	public String getCl1CodeNm() {
		return cl1CodeNm;
	}

	public void setCl1CodeNm(String cl1CodeNm) {
		this.cl1CodeNm = cl1CodeNm;
	}

	public String getCl2CodeNm() {
		return cl2CodeNm;
	}

	public void setCl2CodeNm(String cl2CodeNm) {
		this.cl2CodeNm = cl2CodeNm;
	}

	public String getEtc0ClNm() {
		return etc0ClNm;
	}

	public void setEtc0ClNm(String etc0ClNm) {
		this.etc0ClNm = etc0ClNm;
	}

	public String getEtc1ClNm() {
		return etc1ClNm;
	}

	public void setEtc1ClNm(String etc1ClNm) {
		this.etc1ClNm = etc1ClNm;
	}

	public String getEtc2ClNm() {
		return etc2ClNm;
	}

	public void setEtc2ClNm(String etc2ClNm) {
		this.etc2ClNm = etc2ClNm;
	}

	public String getEtc3ClNm() {
		return etc3ClNm;
	}

	public void setEtc3ClNm(String etc3ClNm) {
		this.etc3ClNm = etc3ClNm;
	}

	public String getEtc4ClNm() {
		return etc4ClNm;
	}

	public void setEtc4ClNm(String etc4ClNm) {
		this.etc4ClNm = etc4ClNm;
	}

	public String getEtc5ClNm() {
		return etc5ClNm;
	}

	public void setEtc5ClNm(String etc5ClNm) {
		this.etc5ClNm = etc5ClNm;
	}

	public String getEtc6ClNm() {
		return etc6ClNm;
	}

	public void setEtc6ClNm(String etc6ClNm) {
		this.etc6ClNm = etc6ClNm;
	}

	public String getEtc7ClNm() {
		return etc7ClNm;
	}

	public void setEtc7ClNm(String etc7ClNm) {
		this.etc7ClNm = etc7ClNm;
	}

	public String getEtc8ClNm() {
		return etc8ClNm;
	}

	public void setEtc8ClNm(String etc8ClNm) {
		this.etc8ClNm = etc8ClNm;
	}

	public String getEtc9ClNm() {
		return etc9ClNm;
	}

	public void setEtc9ClNm(String etc9ClNm) {
		this.etc9ClNm = etc9ClNm;
	}
	
}
