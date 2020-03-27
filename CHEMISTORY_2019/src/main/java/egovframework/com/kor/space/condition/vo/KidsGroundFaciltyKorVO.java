package egovframework.com.kor.space.condition.vo;

import egovframework.com.cmm.ComDefaultVO;

public class KidsGroundFaciltyKorVO extends ComDefaultVO {
	private static final long serialVersionUID = 1L;
	
	private String fcltySn;				//시설순번 pk
	private String fcltyNo;				//시설번호
	private String fcltyNm;				//시설명
	private String adres1;				//주소1
	private String adres2;				//주소2
	private String instlDt;				//설치일자
	private String plcstra;				//설치장소
	private String operSe;				//운영구분
	private String areaCl;				//지역분류
	private String publicSe;			//민공구분
	private String inoutSe;				//실내실외구분
	private String fcltySe;				//시설구분
	private String instlYaar;			//설립년도
	private String schulClsf;			//학교급
	private String ofcdc;				//교육지원청
	private String pcpskl;				//본분교
	private String fondSe;				//설립구분
	private String schulSttus;			//학교상태
	private String fcltyTy;				//시설유형
	private String arTotal;				//연면적_총계
	private String arNrtrRoom;			//연면적_보육실
	private String arBathRoom;			//연면적_목욕실
	private String arToilet;			//연면적_화장실
	private String arCookRoom;			//연면적_조리실
	private String arOffm;				//연면적_사무실
	private String arMdlrtRoom;			//연면적_양호실
	private String arEtc;				//연면적_기타
	private String arPlyRoom;			//연면적_실내놀이터
	private String resistDt;			//등록일
	private String resisterId;			//등록자
	private String updtDt;				//수정일
	private String udptId;				//수정자
	private String areaDetailCl;		//지역분류상세
	private String arAboveAt;			//
	private String crtfcJdgmnDe;		//안심인증심사대상일
	private String inspctJdgmnDe;		//확인검사심사대상일
	
	
	
	// 검색조건
	private String searchArea;			// 설치장소
	private String searchCerti;			// 인증검사
	private String searchConfirm;		// 확인검사
	private String searchAreaCl;		// 지역
	
	
	public String getFcltySn() {
		return fcltySn;
	}
	public void setFcltySn(String fcltySn) {
		this.fcltySn = fcltySn;
	}
	public String getFcltyNo() {
		return fcltyNo;
	}
	public void setFcltyNo(String fcltyNo) {
		this.fcltyNo = fcltyNo;
	}
	public String getFcltyNm() {
		return fcltyNm;
	}
	public void setFcltyNm(String fcltyNm) {
		this.fcltyNm = fcltyNm;
	}
	public String getAdres1() {
		return adres1;
	}
	public void setAdres1(String adres1) {
		this.adres1 = adres1;
	}
	public String getAdres2() {
		return adres2;
	}
	public void setAdres2(String adres2) {
		this.adres2 = adres2;
	}
	public String getInstlDt() {
		return instlDt;
	}
	public void setInstlDt(String instlDt) {
		this.instlDt = instlDt;
	}
	public String getPlcstra() {
		return plcstra;
	}
	public void setPlcstra(String plcstra) {
		this.plcstra = plcstra;
	}
	public String getOperSe() {
		return operSe;
	}
	public void setOperSe(String operSe) {
		this.operSe = operSe;
	}
	public String getAreaCl() {
		return areaCl;
	}
	public void setAreaCl(String areaCl) {
		this.areaCl = areaCl;
	}
	public String getPublicSe() {
		return publicSe;
	}
	public void setPublicSe(String publicSe) {
		this.publicSe = publicSe;
	}
	public String getInoutSe() {
		return inoutSe;
	}
	public void setInoutSe(String inoutSe) {
		this.inoutSe = inoutSe;
	}
	public String getFcltySe() {
		return fcltySe;
	}
	public void setFcltySe(String fcltySe) {
		this.fcltySe = fcltySe;
	}
	public String getInstlYaar() {
		return instlYaar;
	}
	public void setInstlYaar(String instlYaar) {
		this.instlYaar = instlYaar;
	}
	public String getSchulClsf() {
		return schulClsf;
	}
	public void setSchulClsf(String schulClsf) {
		this.schulClsf = schulClsf;
	}
	public String getOfcdc() {
		return ofcdc;
	}
	public void setOfcdc(String ofcdc) {
		this.ofcdc = ofcdc;
	}
	public String getPcpskl() {
		return pcpskl;
	}
	public void setPcpskl(String pcpskl) {
		this.pcpskl = pcpskl;
	}
	public String getFondSe() {
		return fondSe;
	}
	public void setFondSe(String fondSe) {
		this.fondSe = fondSe;
	}
	public String getSchulSttus() {
		return schulSttus;
	}
	public void setSchulSttus(String schulSttus) {
		this.schulSttus = schulSttus;
	}
	public String getFcltyTy() {
		return fcltyTy;
	}
	public void setFcltyTy(String fcltyTy) {
		this.fcltyTy = fcltyTy;
	}
	public String getArTotal() {
		return arTotal;
	}
	public void setArTotal(String arTotal) {
		this.arTotal = arTotal;
	}
	public String getArNrtrRoom() {
		return arNrtrRoom;
	}
	public void setArNrtrRoom(String arNrtrRoom) {
		this.arNrtrRoom = arNrtrRoom;
	}
	public String getArBathRoom() {
		return arBathRoom;
	}
	public void setArBathRoom(String arBathRoom) {
		this.arBathRoom = arBathRoom;
	}
	public String getArToilet() {
		return arToilet;
	}
	public void setArToilet(String arToilet) {
		this.arToilet = arToilet;
	}
	public String getArCookRoom() {
		return arCookRoom;
	}
	public void setArCookRoom(String arCookRoom) {
		this.arCookRoom = arCookRoom;
	}
	public String getArOffm() {
		return arOffm;
	}
	public void setArOffm(String arOffm) {
		this.arOffm = arOffm;
	}
	public String getArMdlrtRoom() {
		return arMdlrtRoom;
	}
	public void setArMdlrtRoom(String arMdlrtRoom) {
		this.arMdlrtRoom = arMdlrtRoom;
	}
	public String getArEtc() {
		return arEtc;
	}
	public void setArEtc(String arEtc) {
		this.arEtc = arEtc;
	}
	public String getArPlyRoom() {
		return arPlyRoom;
	}
	public void setArPlyRoom(String arPlyRoom) {
		this.arPlyRoom = arPlyRoom;
	}
	public String getResistDt() {
		return resistDt;
	}
	public void setResistDt(String resistDt) {
		this.resistDt = resistDt;
	}
	public String getResisterId() {
		return resisterId;
	}
	public void setResisterId(String resisterId) {
		this.resisterId = resisterId;
	}
	public String getUpdtDt() {
		return updtDt;
	}
	public void setUpdtDt(String updtDt) {
		this.updtDt = updtDt;
	}
	public String getUdptId() {
		return udptId;
	}
	public void setUdptId(String udptId) {
		this.udptId = udptId;
	}
	public String getAreaDetailCl() {
		return areaDetailCl;
	}
	public void setAreaDetailCl(String areaDetailCl) {
		this.areaDetailCl = areaDetailCl;
	}
	public String getArAboveAt() {
		return arAboveAt;
	}
	public void setArAboveAt(String arAboveAt) {
		this.arAboveAt = arAboveAt;
	}
	public String getCrtfcJdgmnDe() {
		return crtfcJdgmnDe;
	}
	public void setCrtfcJdgmnDe(String crtfcJdgmnDe) {
		this.crtfcJdgmnDe = crtfcJdgmnDe;
	}
	public String getInspctJdgmnDe() {
		return inspctJdgmnDe;
	}
	public void setInspctJdgmnDe(String inspctJdgmnDe) {
		this.inspctJdgmnDe = inspctJdgmnDe;
	}
	public String getSearchArea() {
		return searchArea;
	}
	public void setSearchArea(String searchArea) {
		this.searchArea = searchArea;
	}
	public String getSearchCerti() {
		return searchCerti;
	}
	public void setSearchCerti(String searchCerti) {
		this.searchCerti = searchCerti;
	}
	public String getSearchConfirm() {
		return searchConfirm;
	}
	public void setSearchConfirm(String searchConfirm) {
		this.searchConfirm = searchConfirm;
	}
	public String getSearchAreaCl() {
		return searchAreaCl;
	}
	public void setSearchAreaCl(String searchAreaCl) {
		this.searchAreaCl = searchAreaCl;
	}
}
