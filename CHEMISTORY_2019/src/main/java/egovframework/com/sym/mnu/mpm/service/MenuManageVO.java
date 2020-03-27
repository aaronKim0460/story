package egovframework.com.sym.mnu.mpm.service;

/** 
 * 메뉴목록관리 처리를 위한 VO 클래스르를 정의한다
 * @author 개발환경 개발팀 이용
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.20  이  용          최초 생성
 *
 * </pre>
 */

public class MenuManageVO{

   /** 메뉴정보 */
   /** 메뉴번호 */
   private   long      menuNo;
   /** 메뉴순서 */
   private   int      menuOrdr;
   /** 메뉴명 */
   private   String   menuNm;
   /** 상위메뉴번호 */
   private   long      upperMenuId;
   /** 메뉴설명 */
   private   String   menuDc;
   
   private String menuType = "0";
   /** 관련이미지경로 */
   private   String   relateImagePath;
   /** 관련이미지명 */
   private   String   relateImageNm;
   /** 프로그램파일명 */
   private   String   progrmFileNm;
   /** 공공누리 */
   private   String   publicNuriTy;

   /** 사이트맵 */
   /** 생성자ID **/
   private   String   creatPersonId;
   /** 시스템메뉴여부 */
   private   String   sysMenuAt;
   
   /** 권한정보설정 */
   /** 권한코드 */
   private   String   authorCode;
   
   /** 기타VO변수 */
   private   String   tempValue;
   private   Long      tempInt; 
   

   /** Login 메뉴관련 VO변수 */
   /** tmp_Id */
   private   String   tmpId;
   /** tmp_Password */
   private   String   tmpPassword;
   /** tmp_Name */
   private   String   tmpName;
   /** tmp_UserSe */
   private   String   tmpUserSe;
   /** tmp_Email */
   private   String   tmpEmail;
   /** tmp_OrgnztId */
   private   String   tmpOrgnztId;
   /** tmp_UniqId */
   private   String   tmpUniqId;
   /** tmp_Cmd */
   private   String   tmpCmd;
   
   private String siteType;
   private String siteTypeCd;
   
   //MENU_ORDR 1인 최상위 메뉴NO
   private String topMenuNo;
   
   private String topMenuNm;
   
   private String upperMenuNm;
   
   private String iframeUrl;
   
   private String menuUrl;
   
   private String upMenuNm;
   
   private String upMenuUrl;
   
   private String topMenuUrl ;
   
   private String menuAdmDpt;
   
   private String menuCttpc;
   
   private String menuLastup;
   
   private String pageCmd;
   
   private String progrmContent;

	private String contentViewTy;
	
	private String dbUseYn;
	
	private int contentSn;
	
	private String frstRegistPnttm;
	
	private String frstRegisterId;
	
	private String lastUpdtPnttm;
	
	private String lastUpdusrId;
	
	private String useAt;
	
	private String actionTy;
	
	private String lastUpdusrNm;
	
	private int orderNum;
	
	private String tabMenuCont;
	
	private String tabMenuUseAt;
	
	private String tabMenuText;
	
	public String getContentViewTy() {
		return contentViewTy;
	}
	public void setContentViewTy(String contentViewTy) {
		this.contentViewTy = contentViewTy;
	}
	public String getPublicNuriTy() {
	return publicNuriTy;
	}
	public void setPublicNuriTy(String publicNuriTy) {
		this.publicNuriTy = publicNuriTy;
	}
	/**
	 * menuNo attribute를 리턴한다.
	 * @return int
	 */
	public long getMenuNo() {
		return menuNo;
	}
	/**
	 * menuNo attribute 값을 설정한다.
	 * @param menuNo int
	 */
	public void setMenuNo(long menuNo) {
		this.menuNo = menuNo;
	}
	/**
	 * menuOrdr attribute를 리턴한다.
	 * @return int
	 */
	public int getMenuOrdr() {
		return menuOrdr;
	}
	/**
	 * menuOrdr attribute 값을 설정한다.
	 * @param menuOrdr int
	 */
	public void setMenuOrdr(int menuOrdr) {
		this.menuOrdr = menuOrdr;
	}
	/**
	 * menuNm attribute를 리턴한다.
	 * @return String
	 */
	public String getMenuNm() {
		return menuNm;
	}
	/**
	 * menuNm attribute 값을 설정한다.
	 * @param menuNm String
	 */
	public void setMenuNm(String menuNm) {
		this.menuNm = menuNm;
	}
	/**
	 * upperMenuId attribute를 리턴한다.
	 * @return int
	 */
	public long getUpperMenuId() {
		return upperMenuId;
	}
	/**
	 * upperMenuId attribute 값을 설정한다.
	 * @param upperMenuId int
	 */
	public void setUpperMenuId(long upperMenuId) {
		this.upperMenuId = upperMenuId;
	}
	/**
	 * menuDc attribute를 리턴한다.
	 * @return String
	 */
	public String getMenuDc() {
		return menuDc;
	}
	/**
	 * menuDc attribute 값을 설정한다.
	 * @param menuDc String
	 */
	public void setMenuDc(String menuDc) {
		this.menuDc = menuDc;
	}
	/**
	 * relateImagePath attribute를 리턴한다.
	 * @return String
	 */
	public String getRelateImagePath() {
		return relateImagePath;
	}
	/**
	 * relateImagePath attribute 값을 설정한다.
	 * @param relateImagePath String
	 */
	public void setRelateImagePath(String relateImagePath) {
		this.relateImagePath = relateImagePath;
	}
	/**
	 * relateImageNm attribute를 리턴한다.
	 * @return String
	 */
	public String getRelateImageNm() {
		return relateImageNm;
	}
	/**
	 * relateImageNm attribute 값을 설정한다.
	 * @param relateImageNm String
	 */
	public void setRelateImageNm(String relateImageNm) {
		this.relateImageNm = relateImageNm;
	}
	/**
	 * progrmFileNm attribute를 리턴한다.
	 * @return String
	 */
	public String getProgrmFileNm() {
		return progrmFileNm;
	}
	/**
	 * progrmFileNm attribute 값을 설정한다.
	 * @param progrmFileNm String
	 */
	public void setProgrmFileNm(String progrmFileNm) {
		this.progrmFileNm = progrmFileNm;
	}
	/**
	 * creatPersonId attribute를 리턴한다.
	 * @return String
	 */
	public String getCreatPersonId() {
		return creatPersonId;
	}
	/**
	 * creatPersonId attribute 값을 설정한다.
	 * @param creatPersonId String
	 */
	public void setCreatPersonId(String creatPersonId) {
		this.creatPersonId = creatPersonId;
	}
	
	/**
	 * sysMenuAt attribute를 리턴한다.
	 * @return String
	 */
	public String getSysMenuAt() {
		return sysMenuAt;
	}
	/**
	 * sysMenuAt attribute 값을 설정한다.
	 * @param sysMenuAt String
	 */
	public void setSysMenuAt(String sysMenuAt) {
		this.sysMenuAt = sysMenuAt;
	}
	/**
	 * authorCode attribute를 리턴한다.
	 * @return String
	 */
	public String getAuthorCode() {
		return authorCode;
	}
	/**
	 * authorCode attribute 값을 설정한다.
	 * @param authorCode String
	 */
	public void setAuthorCode(String authorCode) {
		this.authorCode = authorCode;
	}

	/**
	 * tmp_Id attribute를 리턴한다.
	 * @return String
	 */
	public String getTmpId() {
		return tmpId;
	}
	/**
	 * tmp_Id attribute 값을 설정한다.
	 * @param tmp_Id String
	 */
	public void setTmpId(String tmp_Id) {
		this.tmpId = tmp_Id;
	}
	/**
	 * tmp_Password attribute를 리턴한다.
	 * @return String
	 */
	public String getTmpPassword() {
		return tmpPassword;
	}
	/**
	 * tmp_Password attribute 값을 설정한다.
	 * @param tmp_Password String
	 */
	public void setTmpPassword(String tmp_Password) {
		this.tmpPassword = tmp_Password;
	}
	/**
	 * tmp_Name attribute를 리턴한다.
	 * @return String
	 */
	public String getTmpName() {
		return tmpName;
	}
	/**
	 * tmp_Name attribute 값을 설정한다.
	 * @param tmp_Name String
	 */
	public void setTmpName(String tmp_Name) {
		this.tmpName = tmp_Name;
	}
	/**
	 * tmp_UserSe attribute를 리턴한다.
	 * @return String
	 */
	public String getTmpUserSe() {
		return tmpUserSe;
	}
	/**
	 * tmp_UserSe attribute 값을 설정한다.
	 * @param tmp_UserSe String
	 */
	public void setTmpUserSe(String tmp_UserSe) {
		this.tmpUserSe = tmp_UserSe;
	}
	/**
	 * tmp_Email attribute를 리턴한다.
	 * @return String
	 */
	public String getTmpEmail() {
		return tmpEmail;
	}
	/**
	 * tmp_Email attribute 값을 설정한다.
	 * @param tmp_Email String
	 */
	public void setTmpEmail(String tmp_Email) {
		this.tmpEmail = tmp_Email;
	}
	/**
	 * tmp_OrgnztId attribute를 리턴한다.
	 * @return String
	 */
	public String getTmpOrgnztId() {
		return tmpOrgnztId;
	}
	/**
	 * tmp_OrgnztId attribute 값을 설정한다.
	 * @param tmp_OrgnztId String
	 */
	public void setTmpOrgnztId(String tmp_OrgnztId) {
		this.tmpOrgnztId = tmp_OrgnztId;
	}
	/**
	 * tmp_UniqId attribute를 리턴한다.
	 * @return String
	 */
	public String getTmpUniqId() {
		return tmpUniqId;
	}
	/**
	 * tmp_UniqId attribute 값을 설정한다.
	 * @param tmp_UniqId String
	 */
	public void setTmpUniqId(String tmpUniqId) {
		this.tmpUniqId = tmpUniqId;
	}
	/**
	 * tmp_Cmd attribute를 리턴한다.
	 * @return String
	 */
	public String getTmpCmd() {
		return tmpCmd;
	}
	/**
	 * tmp_Cmd attribute 값을 설정한다.
	 * @param tmp_Cmd String
	 */
	public void setTmpCmd(String tmp_Cmd) {
		this.tmpCmd = tmp_Cmd;
	}
	   
	  /**
	 * tempValue attribute를 리턴한다.
	 * @return String
	 */
	public String getTempValue() {
		return tempValue;
	}
	/**
	 * tempValue attribute 값을 설정한다.
	 * @param tempValue String
	 */
	public void setTempValue(String tempValue) {
		this.tempValue = tempValue;
	}
	/**
	 * tempInt attribute를 리턴한다.
	 * @return int
	 */
	public Long getTempInt() {
		return tempInt;
	}
	/**
	 * tempInt attribute 값을 설정한다.
	 * @param tempInt int
	 */
	public void setTempInt(Long tempInt) {
		this.tempInt = tempInt;
	}
	public String getSiteType() {
		return siteType;
	}
	public void setSiteType(String siteType) {
		this.siteType = siteType;
	}
	public String getSiteTypeCd() {
		return siteTypeCd;
	}
	public void setSiteTypeCd(String siteTypeCd) {
		this.siteTypeCd = siteTypeCd;
	}
	public String getTopMenuNo() {
		return topMenuNo;
	}
	public void setTopMenuNo(String topMenuNo) {
		this.topMenuNo = topMenuNo;
	}
	public String getTopMenuNm() {
		return topMenuNm;
	}
	public void setTopMenuNm(String topMenuNm) {
		this.topMenuNm = topMenuNm;
	}
	public String getUpperMenuNm() {
		return upperMenuNm;
	}
	public void setUpperMenuNm(String upperMenuNm) {
		this.upperMenuNm = upperMenuNm;
	}
	public String getIframeUrl() {
		return iframeUrl;
	}
	public void setIframeUrl(String iframeUrl) {
		this.iframeUrl = iframeUrl;
	}
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	public String getUpMenuNm() {
		return upMenuNm;
	}
	public void setUpMenuNm(String upMenuNm) {
		this.upMenuNm = upMenuNm;
	}
	public String getUpMenuUrl() {
		return upMenuUrl;
	}
	public void setUpMenuUrl(String upMenuUrl) {
		this.upMenuUrl = upMenuUrl;
	}
	public String getTopMenuUrl() {
		return topMenuUrl;
	}
	public void setTopMenuUrl(String topMenuUrl) {
		this.topMenuUrl = topMenuUrl;
	}
	public String getMenuAdmDpt() {
		return menuAdmDpt;
	}
	public void setMenuAdmDpt(String menuAdmDpt) {
		this.menuAdmDpt = menuAdmDpt;
	}
	public String getMenuCttpc() {
		return menuCttpc;
	}
	public void setMenuCttpc(String menuCttpc) {
		this.menuCttpc = menuCttpc;
	}
	public String getMenuLastup() {
		return menuLastup;
	}
	public void setMenuLastup(String menuLastup) {
		this.menuLastup = menuLastup;
	}
	public String getPageCmd() {
		return pageCmd;
	}
	public void setPageCmd(String pageCmd) {
		this.pageCmd = pageCmd;
	}
	public String getMenuType() {
		return menuType;
	}
	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}
	public String getProgrmContent() {
		return progrmContent;
	}
	public void setProgrmContent(String progrmContent) {
		this.progrmContent = progrmContent;
	}
	public String getDbUseYn() {
		return dbUseYn;
	}
	public void setDbUseYn(String dbUseYn) {
		this.dbUseYn = dbUseYn;
	}
	public int getContentSn() {
		return contentSn;
	}
	public void setContentSn(int contentSn) {
		this.contentSn = contentSn;
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
	public String getUseAt() {
		return useAt;
	}
	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}
	public String getActionTy() {
		return actionTy;
	}
	public void setActionTy(String actionTy) {
		this.actionTy = actionTy;
	}
	public String getLastUpdusrNm() {
		return lastUpdusrNm;
	}
	public void setLastUpdusrNm(String lastUpdusrNm) {
		this.lastUpdusrNm = lastUpdusrNm;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getTabMenuUseAt() {
		return tabMenuUseAt;
	}
	public void setTabMenuUseAt(String tabMenuUseAt) {
		this.tabMenuUseAt = tabMenuUseAt;
	}
	public String getTabMenuText() {
		return tabMenuText;
	}
	public void setTabMenuText(String tabMenuText) {
		this.tabMenuText = tabMenuText;
	}
	public String getTabMenuCont() {
		return tabMenuCont;
	}
	public void setTabMenuCont(String tabMenuCont) {
		this.tabMenuCont = tabMenuCont;
	}
	
	
}