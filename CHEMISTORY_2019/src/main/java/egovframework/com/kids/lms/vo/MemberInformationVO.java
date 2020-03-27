/**
 * @Name : MemberInfomationVO.java
 * @Description : 회원정보 VO.
 * @author 이한구
 * @since 2016. 12. 1.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 12. 1.	이한구. 최초 생성.
 */
package egovframework.com.kids.lms.vo;

import egovframework.com.cmm.ComDefaultVO;

@SuppressWarnings("serial")
public class MemberInformationVO extends ComDefaultVO {

	/** 회원_ID */
	private String memberId;

	/** 회원 비밀번호 */
	private String memberPw;

	private String typeCode;

	private String typeDetail;

	/** 회원 이름 */
	private String memberName;

	private String sid1;

	private String sid2;

	/** 회원 이메일 */
	private String email;

	private String phone1;

	private String phone2;

	private String phone3;

	private String mobile1;

	private String mobile2;

	private String mobile3;

	private String company;

	private String duty;

	private String part;

	private String zipcode1;

	private String zipcode2;

	private String address1;

	private String address2;

	private String mailReceiveYn;

	private String knowReceiveYn;

	private String eventReceiveYn;

	private Long lv;

	private Long point;

	private String regDate;

	private Long child_memberEa;

	private String parentId;

	private String imUserCode;

	private String status;

	private String banRegdate;

	private String ipinnum;

	private String consultantYn;

	private String sugangOrderby;

	private String parentName;

	private String parentIpinnum;

	private String parentVirtualno;

	private String agreeTypeYn;

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getTypeCode() {
		return typeCode;
	}

	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}

	public String getTypeDetail() {
		return typeDetail;
	}

	public void setTypeDetail(String typeDetail) {
		this.typeDetail = typeDetail;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getSid1() {
		return sid1;
	}

	public void setSid1(String sid1) {
		this.sid1 = sid1;
	}

	public String getSid2() {
		return sid2;
	}

	public void setSid2(String sid2) {
		this.sid2 = sid2;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public String getMobile1() {
		return mobile1;
	}

	public void setMobile1(String mobile1) {
		this.mobile1 = mobile1;
	}

	public String getMobile2() {
		return mobile2;
	}

	public void setMobile2(String mobile2) {
		this.mobile2 = mobile2;
	}

	public String getMobile3() {
		return mobile3;
	}

	public void setMobile3(String mobile3) {
		this.mobile3 = mobile3;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getDuty() {
		return duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	public String getZipcode1() {
		return zipcode1;
	}

	public void setZipcode1(String zipcode1) {
		this.zipcode1 = zipcode1;
	}

	public String getZipcode2() {
		return zipcode2;
	}

	public void setZipcode2(String zipcode2) {
		this.zipcode2 = zipcode2;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getMailReceiveYn() {
		return mailReceiveYn;
	}

	public void setMailReceiveYn(String mailReceiveYn) {
		this.mailReceiveYn = mailReceiveYn;
	}

	public String getKnowReceiveYn() {
		return knowReceiveYn;
	}

	public void setKnowReceiveYn(String knowReceiveYn) {
		this.knowReceiveYn = knowReceiveYn;
	}

	public String getEventReceiveYn() {
		return eventReceiveYn;
	}

	public void setEventReceiveYn(String eventReceiveYn) {
		this.eventReceiveYn = eventReceiveYn;
	}

	public Long getLv() {
		return lv;
	}

	public void setLv(Long lv) {
		this.lv = lv;
	}

	public Long getPoint() {
		return point;
	}

	public void setPoint(Long point) {
		this.point = point;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public Long getChild_memberEa() {
		return child_memberEa;
	}

	public void setChild_memberEa(Long child_memberEa) {
		this.child_memberEa = child_memberEa;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getImUserCode() {
		return imUserCode;
	}

	public void setImUserCode(String imUserCode) {
		this.imUserCode = imUserCode;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBanRegdate() {
		return banRegdate;
	}

	public void setBanRegdate(String banRegdate) {
		this.banRegdate = banRegdate;
	}

	public String getIpinnum() {
		return ipinnum;
	}

	public void setIpinnum(String ipinnum) {
		this.ipinnum = ipinnum;
	}

	public String getConsultantYn() {
		return consultantYn;
	}

	public void setConsultantYn(String consultantYn) {
		this.consultantYn = consultantYn;
	}

	public String getSugangOrderby() {
		return sugangOrderby;
	}

	public void setSugangOrderby(String sugangOrderby) {
		this.sugangOrderby = sugangOrderby;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public String getParentIpinnum() {
		return parentIpinnum;
	}

	public void setParentIpinnum(String parentIpinnum) {
		this.parentIpinnum = parentIpinnum;
	}

	public String getParentVirtualno() {
		return parentVirtualno;
	}

	public void setParentVirtualno(String parentVirtualno) {
		this.parentVirtualno = parentVirtualno;
	}

	public String getAgreeTypeYn() {
		return agreeTypeYn;
	}

	public void setAgreeTypeYn(String agreeTypeYn) {
		this.agreeTypeYn = agreeTypeYn;
	}

}
