package egovframework.com.cop.com.service;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;


/**
 * 사용자 정보 조회를 위한 VO  클래스
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
 *   2009.4.6  이삼섭          최초 생성
 *
 * </pre>
 */
@SuppressWarnings("serial")
public class UserInfVO implements Serializable {

    /** 유일 아이디 */
    private String uniqId = "";

    /** 사용자 아이디 */
    private String userId = "";

    /** 사용자 명 */
    private String userNm = "";

    /** 사용자 우편번호 */
    private String userZip = "";

    /** 사용자 주소 */
    private String userAdres = "";

    /** 사용자 이메일 */
    private String userEmail = "";

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

    /** 첫페이지 인덱스 */
    private int firstIndex = 1;

    /** 마지막페이지 인덱스 */
    private int lastIndex = 1;

    /** 페이지당 레코드 개수 */
    private int recordCountPerPage = 10;

    /** 레코드 번호 */
    private int rowNo = 0;

    /** 대상 아이디 */
    private String trgetId = "";

    /** 사용여부 */
    private String useAt = "Y";

    /** 커뮤니티 아이디 */
    private String cmmntyId = "";

    /** 동호회 아이디 */
    private String clubId = "";

    /** 대상 중지 여부 (커뮤니티 또는 동호회) */
    private String deletedAt = "N";
    
    //SITE 구분 코드 HGB
    private String siteCd = "";
    
    
    //-----------------------NIER_STAFF_MGM
    //직원코드
    private String staffCd = "";
    //부서코드
    private String departCd = "";
    //과코드
    private String sectCd = "";
    //직원명
    private String staffNm = "";
    //영문이름
    private String engNm = "";
    //영문성
    private String engLNm = "";
    //담당업무
    private String staffWork = "";
    //이메일
    private String staffEmail = "";
    //전화번호
    private String staffTel = "";
    //핸드폰
    private String staffMobile = "";
    //비고
    private String stComment = "";
    //순서
    private String staffOrdr = "";
    //이름 Initial
    private String searchInitial = "";
    //-----------------------NIER_STAFF_MGM
    
    //-----------------------NIER_DEPART_MGM
    //부서명
    private String departNm = "";
    //부서영문명
    private String departEng = "";
    //comments
    private String comments = "";
    // useyn
    private String useyn = "";
    // orders
    private int orders = 0;
    //-----------------------NIER_DEPART_MGM


	//----------------------NIER_SECTION_MGM
    //과명
    private String sectNm = "";
    //과영문명
    private String sectEng = "";
    //
    private String tel = "";
    //
    private String fax = "";
    //----------------------NIER_SECTION_MGM
    
    private String emplyrId = "";
    private String offmTelno = "";
    private String emailAdres = "";
    private String esntlId = "";
    private String authorCode = "";
    private String departCode = "";
    private String sectCode = "";
    private String zip = "";
    private String mbtlnum = "";
    
    private String rankCode = "";
    private String rankName = "";
    private String engName = "";
    private String regDate = "";
    private String rankOrdr = "";
    
    /**
     * uniqId attribute를 리턴한다.
     * 
     * @return the uniqId
     */
    public String getUniqId() {
	return uniqId;
    }

    /**
     * uniqId attribute 값을 설정한다.
     * 
     * @param uniqId
     *            the uniqId to set
     */
    public void setUniqId(String uniqId) {
	this.uniqId = uniqId;
    }

    /**
     * userId attribute를 리턴한다.
     * 
     * @return the userId
     */
    public String getUserId() {
	return userId;
    }

    /**
     * userId attribute 값을 설정한다.
     * 
     * @param userId
     *            the userId to set
     */
    public void setUserId(String userId) {
	this.userId = userId;
    }

    /**
     * userNm attribute를 리턴한다.
     * 
     * @return the userNm
     */
    public String getUserNm() {
	return userNm;
    }

    /**
     * userNm attribute 값을 설정한다.
     * 
     * @param userNm
     *            the userNm to set
     */
    public void setUserNm(String userNm) {
	this.userNm = userNm;
    }

    /**
     * userZip attribute를 리턴한다.
     * 
     * @return the userZip
     */
    public String getUserZip() {
	return userZip;
    }

    /**
     * userZip attribute 값을 설정한다.
     * 
     * @param userZip
     *            the userZip to set
     */
    public void setUserZip(String userZip) {
	this.userZip = userZip;
    }

    /**
     * userAdres attribute를 리턴한다.
     * 
     * @return the userAdres
     */
    public String getUserAdres() {
	return userAdres;
    }

    /**
     * userAdres attribute 값을 설정한다.
     * 
     * @param userAdres
     *            the userAdres to set
     */
    public void setUserAdres(String userAdres) {
	this.userAdres = userAdres;
    }

    /**
     * userEmail attribute를 리턴한다.
     * 
     * @return the userEmail
     */
    public String getUserEmail() {
	return userEmail;
    }

    /**
     * userEmail attribute 값을 설정한다.
     * 
     * @param userEmail
     *            the userEmail to set
     */
    public void setUserEmail(String userEmail) {
	this.userEmail = userEmail;
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
     * trgetId attribute를 리턴한다.
     * 
     * @return the trgetId
     */
    public String getTrgetId() {
	return trgetId;
    }

    /**
     * trgetId attribute 값을 설정한다.
     * 
     * @param trgetId
     *            the trgetId to set
     */
    public void setTrgetId(String trgetId) {
	this.trgetId = trgetId;
    }

    /**
     * useAt attribute를 리턴한다.
     * 
     * @return the useAt
     */
    public String getUseAt() {
	return useAt;
    }

    /**
     * useAt attribute 값을 설정한다.
     * 
     * @param useAt
     *            the useAt to set
     */
    public void setUseAt(String useAt) {
	this.useAt = useAt;
    }

    /**
     * cmmntyId attribute를 리턴한다.
     * 
     * @return the cmmntyId
     */
    public String getCmmntyId() {
	return cmmntyId;
    }

    /**
     * cmmntyId attribute 값을 설정한다.
     * 
     * @param cmmntyId
     *            the cmmntyId to set
     */
    public void setCmmntyId(String cmmntyId) {
	this.cmmntyId = cmmntyId;
    }

    /**
     * clubId attribute를 리턴한다.
     * 
     * @return the clubId
     */
    public String getClubId() {
	return clubId;
    }

    /**
     * clubId attribute 값을 설정한다.
     * 
     * @param clubId
     *            the clubId to set
     */
    public void setClubId(String clubId) {
	this.clubId = clubId;
    }

    /**
     * deletedAt attribute를 리턴한다.
     * 
     * @return the deletedAt
     */
    public String getDeletedAt() {
	return deletedAt;
    }

    /**
     * deletedAt attribute 값을 설정한다.
     * 
     * @param deletedAt
     *            the deletedAt to set
     */
    public void setDeletedAt(String deletedAt) {
	this.deletedAt = deletedAt;
    }

    /**
     * toString 메소드를 대치한다.
     */
    public String toString() {
	return ToStringBuilder.reflectionToString(this);
    }

	public String getSiteCd() {
		return siteCd;
	}

	public void setSiteCd(String siteCd) {
		this.siteCd = siteCd;
	}

	public String getStaffCd() {
		return staffCd;
	}

	public void setStaffCd(String staffCd) {
		this.staffCd = staffCd;
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

	public String getStaffNm() {
		return staffNm;
	}

	public void setStaffNm(String staffNm) {
		this.staffNm = staffNm;
	}

	public String getEngNm() {
		return engNm;
	}

	public void setEngNm(String engNm) {
		this.engNm = engNm;
	}

	public String getStaffWork() {
		return staffWork;
	}

	public void setStaffWork(String staffWork) {
		this.staffWork = staffWork;
	}

	public String getStaffEmail() {
		return staffEmail;
	}

	public void setStaffEmail(String staffEmail) {
		this.staffEmail = staffEmail;
	}

	public String getStaffTel() {
		return staffTel;
	}

	public void setStaffTel(String staffTel) {
		this.staffTel = staffTel;
	}

	public String getStaffMobile() {
		return staffMobile;
	}

	public void setStaffMobile(String staffMobile) {
		this.staffMobile = staffMobile;
	}

	public String getStComment() {
		return stComment;
	}

	public void setStComment(String stComment) {
		this.stComment = stComment;
	}

	public String getStaffOrdr() {
		return staffOrdr;
	}

	public void setStaffOrdr(String staffOrdr) {
		this.staffOrdr = staffOrdr;
	}

	public String getEngLNm() {
		return engLNm;
	}

	public void setEngLNm(String engLNm) {
		this.engLNm = engLNm;
	}


	public String getDepartNm() {
		return departNm;
	}

	public void setDepartNm(String departNm) {
		this.departNm = departNm;
	}

	public String getDepartEng() {
		return departEng;
	}

	public void setDepartEng(String departEng) {
		this.departEng = departEng;
	}

	public String getSectNm() {
		return sectNm;
	}

	public void setSectNm(String sectNm) {
		this.sectNm = sectNm;
	}

	public String getSectEng() {
		return sectEng;
	}

	public void setSectEng(String sectEng) {
		this.sectEng = sectEng;
	}

	public String getSearchInitial() {
		return searchInitial;
	}

	public void setSearchInitial(String searchInitial) {
		this.searchInitial = searchInitial;
	}
	  
    public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getUseyn() {
		return useyn;
	}

	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}

	

	public int getOrders() {
		return orders;
	}

	public void setOrders(int orders) {
		this.orders = orders;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getEmplyrId() {
		return emplyrId;
	}

	public void setEmplyrId(String emplyrId) {
		this.emplyrId = emplyrId;
	}

	public String getOffmTelno() {
		return offmTelno;
	}

	public void setOffmTelno(String offmTelno) {
		this.offmTelno = offmTelno;
	}

	public String getEmailAdres() {
		return emailAdres;
	}

	public void setEmailAdres(String emailAdres) {
		this.emailAdres = emailAdres;
	}

	public String getEsntlId() {
		return esntlId;
	}

	public void setEsntlId(String esntlId) {
		this.esntlId = esntlId;
	}

	public String getAuthorCode() {
		return authorCode;
	}

	public void setAuthorCode(String authorCode) {
		this.authorCode = authorCode;
	}

	public String getDepartCode() {
		return departCode;
	}

	public void setDepartCode(String departCode) {
		this.departCode = departCode;
	}

	public String getSectCode() {
		return sectCode;
	}

	public void setSectCode(String sectCode) {
		this.sectCode = sectCode;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getMbtlnum() {
		return mbtlnum;
	}

	public void setMbtlnum(String mbtlnum) {
		this.mbtlnum = mbtlnum;
	}

	public String getRankCode() {
		return rankCode;
	}

	public void setRankCode(String rankCode) {
		this.rankCode = rankCode;
	}

	public String getRankName() {
		return rankName;
	}

	public void setRankName(String rankName) {
		this.rankName = rankName;
	}

	public String getEngName() {
		return engName;
	}

	public void setEngName(String engName) {
		this.engName = engName;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getRankOrdr() {
		return rankOrdr;
	}

	public void setRankOrdr(String rankOrdr) {
		this.rankOrdr = rankOrdr;
	}


    
}
