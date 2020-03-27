package egovframework.com.cmm.service;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import egovframework.com.cmm.EgovWebUtil;

public class PageUtil {
	private final HttpServletRequest req;
	HttpSession ses;

	public PageUtil(HttpServletRequest request) {
		this.req = request;
		this.ses = req.getSession();
	}

	/**
	 * Request Parameter정보를 input type="hidden" 문자열 생성
	 *
	 * @return 문자열
	 */
	public String getRequestToHiddenTag() {
		Enumeration e = req.getParameterNames();
		String key = "";
		String requestInfo = "";
		while (e.hasMoreElements()) {
			key = (String) e.nextElement();
			String[] value = req.getParameterValues(key);
			for (int i = 0; i < value.length; i++) {
				requestInfo += "<input type=\"hidden\" name=\"" + EgovWebUtil.clearXSSMinimum(key) + "\" id=\""
						+ EgovWebUtil.clearXSSMinimum(key) + "\" value=\"" + EgovWebUtil.clearXSSMinimum(value[i]) + "\" />\n";
			}
		}

		return requestInfo;
	}

	public String getRequestSNSURL() {
		
		Enumeration e = req.getParameterNames();
		String key = "";
		String requestInfo = "";
		while (e.hasMoreElements()) {
			key = (String) e.nextElement();
			String[] value = req.getParameterValues(key);
			for (int i = 0; i < value.length; i++) {
				if(i==0){
					requestInfo += "?"+EgovWebUtil.clearXSSMinimum(key)+"="+EgovWebUtil.clearXSSMinimum(value[i]);	
				}else{
					requestInfo += "&"+EgovWebUtil.clearXSSMinimum(key)+"="+EgovWebUtil.clearXSSMinimum(value[i]);
				}
			}
		}
		
		return requestInfo;
	}	
}