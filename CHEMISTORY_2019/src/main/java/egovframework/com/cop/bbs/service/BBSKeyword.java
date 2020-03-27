/**
 * @Name : BBSKeyword.java
 * @Description : 샵태그 검색.
 * @author 이한구
 * @since 2016. 11. 2.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 11. 2.	이한구. 최초 생성.
 */
package egovframework.com.cop.bbs.service;

import java.io.Serializable;

@SuppressWarnings("serial")
public class BBSKeyword implements Serializable {

	/** 일련번호 */
	private String keyId;

	/** 게시판아이디 */
	private String bbsId;

	/** 게시글아이디 */
	private String nttId;

	/** 키워드 */
	private String keyword;

	/** 최초등록시점 */
	private String frstRegisterPnttm;

	/** 최초등록자 아이디 */
	private String frstRegisterId;

	public String getKeyId() {
		return keyId;
	}

	public void setKeyId(String keyId) {
		this.keyId = keyId;
	}

	public String getBbsId() {
		return bbsId;
	}

	public void setBbsId(String bbsId) {
		this.bbsId = bbsId;
	}

	public String getNttId() {
		return nttId;
	}

	public void setNttId(String nttId) {
		this.nttId = nttId;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getFrstRegisterPnttm() {
		return frstRegisterPnttm;
	}

	public void setFrstRegisterPnttm(String frstRegisterPnttm) {
		this.frstRegisterPnttm = frstRegisterPnttm;
	}

	public String getFrstRegisterId() {
		return frstRegisterId;
	}

	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}

}
