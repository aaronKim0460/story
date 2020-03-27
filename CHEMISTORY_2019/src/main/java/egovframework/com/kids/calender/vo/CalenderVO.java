/**
 * @Name : CalenderVO.java
 * @Description : 달력 VO.
 * @author 이한구
 * @since 2016. 11. 21.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 11. 21.	이한구. 최초 생성.
 */
package egovframework.com.kids.calender.vo;

import egovframework.com.cmm.ComDefaultVO;

@SuppressWarnings("serial")
public class CalenderVO extends ComDefaultVO {

	/** 달력_id */
	private Long idx;

	/** 제목 */
	private String title;

	/** 내용 */
	private String contents;

	/** 시작일 */
	private String sDate;

	/** 종료일 */
	private String eDate;

	/** 구분 */
	private String gubun;

	/** 등록일 */
	private String inputDate;

	/** 검색조건 */
	private String srchYear;

	/** 검색조건 */
	private String srchMonth;

	/** 검색조건 */
	private String srchGubun;

	/** 달력보기 여부 */
	private String calendarViewYn;

	public Long getIdx() {
		return idx;
	}

	public void setIdx(Long idx) {
		this.idx = idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getsDate() {
		return sDate;
	}

	public void setsDate(String sDate) {
		this.sDate = sDate;
	}

	public String geteDate() {
		return eDate;
	}

	public void seteDate(String eDate) {
		this.eDate = eDate;
	}

	public String getGubun() {
		return gubun;
	}

	public void setGubun(String gubun) {
		this.gubun = gubun;
	}

	public String getInputDate() {
		return inputDate;
	}

	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}

	public String getSrchYear() {
		return srchYear;
	}

	public void setSrchYear(String srchYear) {
		this.srchYear = srchYear;
	}

	public String getSrchMonth() {
		return srchMonth;
	}

	public void setSrchMonth(String srchMonth) {
		this.srchMonth = srchMonth;
	}

	public String getSrchGubun() {
		return srchGubun;
	}

	public void setSrchGubun(String srchGubun) {
		this.srchGubun = srchGubun;
	}

	public String getCalendarViewYn() {
		return calendarViewYn;
	}

	public void setCalendarViewYn(String calendarViewYn) {
		this.calendarViewYn = calendarViewYn;
	}

}
