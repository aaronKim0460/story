package egovframework.com.cmm;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;
/**
 * ImagePaginationRenderer.java 클래스
 * 
 * @author 서준식
 * @since 2011. 9. 16.
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    -------------    ----------------------
 *   2011. 9. 16.   서준식       이미지 경로에 ContextPath추가
 * </pre>
 */
public class ImagePaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware{

	private ServletContext servletContext;
	
	public ImagePaginationRenderer() {
	
	}
	
	public void initVariables(){
		//firstPageLabel    = "<a href=\"#pageIndex={1}\" onclick=\"{0}({1});return false; \"><img src=\"" + servletContext.getContextPath() +  "/images/egovframework/com/cmm/mod/icon/icon_prevend.gif\" alt=\"처음\"   border=\"0\"/></a>&#160;";
		firstPageLabel    = "<a href=\"#pageIndex={1}\" onclick=\"{0}({1});return false; \" class=\"first prevEnd\"><img src=\"/images/bbs/page_btn_prev1.png\"  alt=\"처음\" /></a>";
        //previousPageLabel = "<a href=\"#pageIndex={1}\" onclick=\"{0}({1});return false; \"><img src=\"" + servletContext.getContextPath() +  "/images/egovframework/com/cmm/mod/icon/icon_prev.gif\"    alt=\"이전\"   border=\"0\"/></a>&#160;";
        previousPageLabel = "<a href=\"#pageIndex={1}\" onclick=\"{0}({1});return false; \" class=\"previouspostslink prev\"><img src=\"/images/bbs/page_btn_prev2.png\"  alt=\"이전\" /></a>";
        currentPageLabel  = "<strong class=\"current\"><span>{0}</span></strong>";
        otherPageLabel    = "<a href=\"#pageIndex={1}\" onclick=\"{0}({1});return false; \" class=\"page\"><span>{2}</span></a>";
        //nextPageLabel     = "<a href=\"#pageIndex={1}\" onclick=\"{0}({1});return false; \"><img src=\"" + servletContext.getContextPath() +  "/images/egovframework/com/cmm/mod/icon/icon_next.gif\"    alt=\"다음\"   border=\"0\"/></a>&#160;";
        nextPageLabel     = "<a href=\"#pageIndex={1}\" onclick=\"{0}({1});return false; \" class=\"nextpostslink next\"><img src=\"/images/bbs/page_btn_next2.png\"  alt=\"다음\" /></a>";
        //lastPageLabel     = "<a href=\"#pageIndex={1}\" onclick=\"{0}({1});return false; \"><img src=\"" + servletContext.getContextPath() +  "/images/egovframework/com/cmm/mod/icon/icon_nextend.gif\" alt=\"마지막\" border=\"0\"/></a>&#160;";
        lastPageLabel     = "<a href=\"#pageIndex={1}\" onclick=\"{0}({1});return false; \" class=\"last nextEnd\"><img src=\"/images/bbs/page_btn_next1.png\"  alt=\"끝\" /></a>";
	}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}

}
