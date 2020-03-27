package egovframework.com.cop.cnn.web;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cop.cnn.service.ConnectVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class EgovConnectController {
	/*
	@RequestMapping("/cop/com/selectUserList.do")
    public String selectUserList(@ModelAttribute("searchVO") ConnectVO connectVo, Map<String, Object> commandMap, ModelMap model) throws Exception {
	String popFlag = (String)commandMap.get("PopFlag");
	String returnUrl = "egovframework/com/cop/com/EgovUserList";
	
	if ("Y".equals(popFlag)) {
	    returnUrl = "egovframework/com/cop/com/EgovUserListPop";
	}

	userVO.setPageUnit(propertyService.getInt("pageUnit"));
	userVO.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();
	
	paginationInfo.setCurrentPageNo(userVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(userVO.getPageUnit());
	paginationInfo.setPageSize(userVO.getPageSize());

	userVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	userVO.setLastIndex(paginationInfo.getLastRecordIndex());
	userVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	Map<String, Object> map = userInfService.selectUserList(userVO);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));
	
	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("targetMethod", "selectUserList");
	model.addAttribute("trgetId", "");
	model.addAttribute("paginationInfo", paginationInfo);

	return returnUrl;
    }*/
}
