package egovframework.com.kids.common.vo;

import egovframework.com.cmm.ComDefaultVO;

@SuppressWarnings("serial")
public class NewsLetterVo extends ComDefaultVO {
	
	private String emailId;
	private String email;
	private String firstRegistPnttm;
	private String lastUpdtPnttm;
	private String useAt;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFirstRegistPnttm() {
		return firstRegistPnttm;
	}
	public void setFirstRegistPnttm(String firstRegistPnttm) {
		this.firstRegistPnttm = firstRegistPnttm;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getLastUpdtPnttm() {
		return lastUpdtPnttm;
	}
	public void setLastUpdtPnttm(String lastUpdtPnttm) {
		this.lastUpdtPnttm = lastUpdtPnttm;
	}
	public String getUseAt() {
		return useAt;
	}
	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}

	
	
	
}
