package egovframework.com.sym.mnu.mpm.service;

/**
 * 메뉴관리, 메뉴 생성을 위한 모델 클래스를 정의한다.
 * @author 공통서비스 개발팀 이 용
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.20  이용          최초 생성
 *
 * </pre>
 */

public class MenuManage {

	/**
	 * 메뉴설명
	 */
	private String menuDc;
	public String getMenuDc() {
		return menuDc;
	}
	public void setMenuDc(String menuDc) {
		this.menuDc = menuDc;
	}
	public String getMenuNm() {
		return menuNm;
	}
	public void setMenuNm(String menuNm) {
		this.menuNm = menuNm;
	}
	public int getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	public int getMenuOrdr() {
		return menuOrdr;
	}
	public void setMenuOrdr(int menuOrdr) {
		this.menuOrdr = menuOrdr;
	}
	public String getProgrmFileNm() {
		return progrmFileNm;
	}
	public void setProgrmFileNm(String progrmFileNm) {
		this.progrmFileNm = progrmFileNm;
	}
	public String getRelateImageNm() {
		return relateImageNm;
	}
	public void setRelateImageNm(String relateImageNm) {
		this.relateImageNm = relateImageNm;
	}
	public String getRelateImagePath() {
		return relateImagePath;
	}
	public void setRelateImagePath(String relateImagePath) {
		this.relateImagePath = relateImagePath;
	}
	public int getUpperMenuId() {
		return upperMenuId;
	}
	public void setUpperMenuId(int upperMenuId) {
		this.upperMenuId = upperMenuId;
	}
	public String getPublicNuriTy() {
		return publicNuriTy;
	}
	public void setPublicNuriTy(String publicNuriTy) {
		this.publicNuriTy = publicNuriTy;
	}
	public String getContentViewTy() {
		return contentViewTy;
	}
	public void setContentViewTy(String contentViewTy) {
		this.contentViewTy = contentViewTy;
	}

	/**
	 * 메뉴명
	 */
	private String menuNm;
	/**
	 * 메뉴번호
	 */
	private int menuNo;
	/**
	 * 메뉴순서
	 */
	private int menuOrdr;
	/**
	 * 프로그램파일명
	 */
	private String progrmFileNm;
	/**
	 * 관련이미지명
	 */
	private String relateImageNm;
	/**
	 * 관련이미지경로
	 */
	private String relateImagePath;
	/**
	 * 상위메뉴번호
	 */
	private int upperMenuId;
	/**
	 * 공공누리
	 */
	private String publicNuriTy;
	/**
	 * 컨텐츠 노출 방법
	 */
	private String contentViewTy;
	
	private String progrmContent;
	
	private String dbUseYn;
	
	private int contentSn;
	
	private String frstRegistPnttm;
	
	private String frstRegisterId;
	
	private String lastUpdtPnttm;
	
	private String lastUpdusrId;
	
	private String useAt;
	
	private String actionTy;
	
	private String lastUpdusrNm;
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
		
	
}