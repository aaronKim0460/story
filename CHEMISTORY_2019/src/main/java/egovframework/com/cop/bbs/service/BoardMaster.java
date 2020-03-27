package egovframework.com.cop.bbs.service;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 *  게시판 속성정보를 담기위한 엔티티 클래스
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
 *   2009.03.12  이삼섭          최초 생성
 *   2009.06.26  한성곤		2단계 기능 추가 (댓글관리, 만족도조사)
 *
 * </pre>
 */
@SuppressWarnings("serial")
public class BoardMaster implements Serializable {

    /** 게시판 속성코드 */
    private String bbsAttrbCode = "";

    /** 게시판 추가 설정 */
    private String bbsSubOpt = "";
    /** 게시판 아이디 */
    private String bbsId = "";

    /** 게시판 소개 */
    private String bbsIntrcn = "";

    /** 게시판 명 */
    private String bbsNm = "";

    /** 게시판 유형코드 */
    private String bbsTyCode = "";

    /** 파일첨부가능여부 */
    private String fileAtchPosblAt = "";

    /** 최초등록자 아이디 */
    private String frstRegisterId = "";

    /** 최초등록시점 */
    private String frstRegisterPnttm = "";

    /** 최종수정자 아이디 */
    public String lastUpdusrId = "";

    /** 최종수정시점 */
    private String lastUpdusrPnttm = "";

    /** 첨부가능파일숫자 */
    private int posblAtchFileNumber = 0;

    /** 첨부가능파일사이즈 */
    private String posblAtchFileSize = null;

    /** 답장가능여부 */
    private String replyPosblAt = "";

    /** 템플릿 아이디 */
    private String tmplatId = "";

    /** 사용여부 */
    private String useAt = "";

    /** 사용플래그 */
    private String bbsUseFlag = "";

    /** 대상 아이디 */
    private String trgetId = "";

    /** 등록구분코드 */
    private String registSeCode = "";

    /** 유일 아이디 */
    private String uniqId = "";

    /** 템플릿 명 */
    private String tmplatNm = "";

    /** 로그인 필수 요소 */
    private String loginReqAt = "";

    /** 구분 */
    private String bbsNttSe = "";

    /** 사이트 구분 */
    private String siteType = "";

    /** 게시판 description 이미지 path */
    private String bbs_desc_img_path = "";

    /** 게시판 description 이미지 명 */
    private String bbs_desc_img_nm = "";

    /** 메뉴번호 */
    private String menuNo;

    /** 프로그램파일명 */
    private   String   progrmFileNm;

    /** 게시물 ID  */
    private String nttId = "";

    /** 공공누리 */
    private String publicNuriTy = "";

    /** 연동 여부 */
    private String intrlckYn;

    /** 승인 사용 여부 */
    private String confmUseYn;

    private String confmSttus;

    private String ntceDate;
    
    private String ntceDateH;

    private int bbsPageUnit = 0;

    private int bbsPageSize = 0;
    
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
    /** 분류2_코드 (머리말코드) */
    private String cl2Code = "";
    
    private String cl3Code = "";
    
    
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

	public String getBbsNttSe() {
		return bbsNttSe;
	}

	public void setBbsNttSe(String bbsNttSe) {
		this.bbsNttSe = bbsNttSe;
	}

	//---------------------------------
    // 2009.06.26 : 2단계 기능 추가
    //---------------------------------
    /** 추가 option (댓글-comment, 만족도조사-stsfdg) */
    private String option = "";

    /** 댓글 여부 */
    private String commentAt = "";

    /** 만족도조사 */
    private String stsfdgAt = "";
    ////-------------------------------



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
     * bbsId attribute를 리턴한다.
     *
     * @return the bbsId
     */
    public String getBbsId() {
	return bbsId;
    }

    /**
     * bbsId attribute 값을 설정한다.
     *
     * @param bbsId
     *            the bbsId to set
     */
    public void setBbsId(String bbsId) {
	this.bbsId = bbsId;
    }

    /**
     * bbsIntrcn attribute를 리턴한다.
     *
     * @return the bbsIntrcn
     */
    public String getBbsIntrcn() {
	return bbsIntrcn;
    }

    /**
     * bbsIntrcn attribute 값을 설정한다.
     *
     * @param bbsIntrcn
     *            the bbsIntrcn to set
     */
    public void setBbsIntrcn(String bbsIntrcn) {
	this.bbsIntrcn = bbsIntrcn;
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
     * frstRegisterId attribute를 리턴한다.
     *
     * @return the frstRegisterId
     */
    public String getFrstRegisterId() {
	return frstRegisterId;
    }

    /**
     * frstRegisterId attribute 값을 설정한다.
     *
     * @param frstRegisterId
     *            the frstRegisterId to set
     */
    public void setFrstRegisterId(String frstRegisterId) {
	this.frstRegisterId = frstRegisterId;
    }

    /**
     * frstRegisterPnttm attribute를 리턴한다.
     *
     * @return the frstRegisterPnttm
     */
    public String getFrstRegisterPnttm() {
	return frstRegisterPnttm;
    }

    /**
     * frstRegisterPnttm attribute 값을 설정한다.
     *
     * @param frstRegisterPnttm
     *            the frstRegisterPnttm to set
     */
    public void setFrstRegisterPnttm(String frstRegisterPnttm) {
	this.frstRegisterPnttm = frstRegisterPnttm;
    }

    /**
     * lastUpdusrId attribute를 리턴한다.
     *
     * @return the lastUpdusrId
     */
    public String getLastUpdusrId() {
	return lastUpdusrId;
    }

    /**
     * lastUpdusrId attribute 값을 설정한다.
     *
     * @param lastUpdusrId
     *            the lastUpdusrId to set
     */
    public void setLastUpdusrId(String lastUpdusrId) {
	this.lastUpdusrId = lastUpdusrId;
    }

    /**
     * lastUpdusrPnttm attribute를 리턴한다.
     *
     * @return the lastUpdusrPnttm
     */
    public String getLastUpdusrPnttm() {
	return lastUpdusrPnttm;
    }

    /**
     * lastUpdusrPnttm attribute 값을 설정한다.
     *
     * @param lastUpdusrPnttm
     *            the lastUpdusrPnttm to set
     */
    public void setLastUpdusrPnttm(String lastUpdusrPnttm) {
	this.lastUpdusrPnttm = lastUpdusrPnttm;
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
     * posblAtchFileSize attribute를 리턴한다.
     *
     * @return the posblAtchFileSize
     */
    public String getPosblAtchFileSize() {
	return posblAtchFileSize;
    }

    /**
     * posblAtchFileSize attribute 값을 설정한다.
     *
     * @param posblAtchFileSize
     *            the posblAtchFileSize to set
     */
    public void setPosblAtchFileSize(String posblAtchFileSize) {
	this.posblAtchFileSize = posblAtchFileSize;
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
     * tmplatId attribute를 리턴한다.
     *
     * @return the tmplatId
     */
    public String getTmplatId() {
	return tmplatId;
    }

    /**
     * tmplatId attribute 값을 설정한다.
     *
     * @param tmplatId
     *            the tmplatId to set
     */
    public void setTmplatId(String tmplatId) {
	this.tmplatId = tmplatId;
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
     * bbsUseFlag attribute를 리턴한다.
     *
     * @return the bbsUseFlag
     */
    public String getBbsUseFlag() {
	return bbsUseFlag;
    }

    /**
     * bbsUseFlag attribute 값을 설정한다.
     *
     * @param bbsUseFlag
     *            the bbsUseFlag to set
     */
    public void setBbsUseFlag(String bbsUseFlag) {
	this.bbsUseFlag = bbsUseFlag;
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
     * registSeCode attribute를 리턴한다.
     *
     * @return the registSeCode
     */
    public String getRegistSeCode() {
	return registSeCode;
    }

    /**
     * registSeCode attribute 값을 설정한다.
     *
     * @param registSeCode
     *            the registSeCode to set
     */
    public void setRegistSeCode(String registSeCode) {
	this.registSeCode = registSeCode;
    }

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
     * option attribute를 리턴한다.
     * @return the option
     */
    public String getOption() {
        return option;
    }

    /**
     * option attribute 값을 설정한다.
     * @param option the option to set
     */
    public void setOption(String option) {
        this.option = option;
    }

    /**
     * commentAt attribute를 리턴한다.
     * @return the commentAt
     */
    public String getCommentAt() {
        return commentAt;
    }

    /**
     * commentAt attribute 값을 설정한다.
     * @param commentAt the commentAt to set
     */
    public void setCommentAt(String commentAt) {
        this.commentAt = commentAt;
    }

    /**
     * stsfdgAt attribute를 리턴한다.
     * @return the stsfdgAt
     */
    public String getStsfdgAt() {
        return stsfdgAt;
    }

    /**
     * stsfdg attribute 값을 설정한다.
     * @param stsfdgAt the stsfdgAt to set
     */
    public void setStsfdgAt(String stsfdgAt) {
        this.stsfdgAt = stsfdgAt;
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

	public String getSiteType() {
		return siteType;
	}

	public void setSiteType(String siteType) {
		this.siteType = siteType;
	}

	public String getBbs_desc_img_path() {
		return bbs_desc_img_path;
	}

	public void setBbs_desc_img_path(String bbs_desc_img_path) {
		this.bbs_desc_img_path = bbs_desc_img_path;
	}

	public String getBbs_desc_img_nm() {
		return bbs_desc_img_nm;
	}

	public void setBbs_desc_img_nm(String bbs_desc_img_nm) {
		this.bbs_desc_img_nm = bbs_desc_img_nm;
	}

	public String getMenuNo() {
		return menuNo;
	}

	public void setMenuNo(String menuNo) {
		this.menuNo = menuNo;
	}

	public String getProgrmFileNm() {
		return progrmFileNm;
	}

	public void setProgrmFileNm(String progrmFileNm) {
		this.progrmFileNm = progrmFileNm;
	}

	public String getNttId() {
		return nttId;
	}

	public void setNttId(String nttId) {
		this.nttId = nttId;
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

	public void setPublicNuriTy(String publicNuriTy) {
		this.publicNuriTy = publicNuriTy;
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

	public String getCl3Code() {
		return cl3Code;
	}

	public void setCl3Code(String cl3Code) {
		this.cl3Code = cl3Code;
	}
	
	
}
