package egovframework.com.sts.bst.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONSerializer;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cop.bbs.service.Board;
import egovframework.com.sts.bst.service.EgovBbsStatsService;
import egovframework.com.sts.com.StatsVO;

/**
 * 게시물 통계 검색 컨트롤러 클래스
 * @author 공통서비스 개발팀 박지욱
 * @since 2009.03.19
 * @version 1.0
 * @see
 *  
 * <pre>
 * << 개정이력(Modification Information) >>
 * 
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.03.19  박지욱          최초 생성
 *  2011.06.30  이기하          패키지 분리(sts -> sts.bst)
 *  2011.8.26	정진오			IncludedInfo annotation 추가
 *  
 *  </pre>
 */


@Controller
public class EgovBbsStatsController {
	
	/** EgovBbsStatsService */
	@Resource(name = "bbsStatsService")
    private EgovBbsStatsService bbsStatsService;
	
	/** EgovCmmUseService */
	@Resource(name="EgovCmmUseService")
	private EgovCmmUseService cmmUseService;
	
    /** log */
    protected static final Log LOG = LogFactory.getLog(EgovBbsStatsController.class);
    
    /**
	 * 게시물 통계를 조회한다
	 * @param statsVO StatsVO
	 * @return String
	 * @exception Exception
	 */
    @IncludedInfo(name="게시물통계", listUrl="/sts/bst/selectBbsStats.do", order = 120 ,gid = 30)
    @RequestMapping(value="/sts/bst/selectBbsStats.do")
	public String selectBbsStats(@ModelAttribute("statsVO") StatsVO statsVO, ModelMap model) throws Exception {
    	
    	//-------- COM78 은 사이트 구분 _ HGB-----------------
    	ComDefaultCodeVO vo = new ComDefaultCodeVO();
    	vo.setCodeId("COM078");
    	List codeResult = cmmUseService.selectCmmCodeDetail(vo);
    	//-------- COM78 은 사이트 구분 _ HGB-----------------
    	
    	model.addAttribute("siteType",codeResult);
    	
        return "egovframework/com/sts/bst/EgovBbsStats";
	}
    
    
    @RequestMapping(value="/sts/bst/selectBbsStatsNier.do")
	public String selectBbsStatsNier(@ModelAttribute("statsVO") StatsVO statsVO,
			ModelMap model) throws Exception {
    	
		if (statsVO.getFromDate() != null && !"".equals(statsVO.getFromDate())) {
			
			// 탭구분 : 생성글수(tab1), 총조회수(tab2), 평균조회수(tab3) 
			List bbsStatsList = null;
			List bbsMaxStatsList = null;
			List bbsMinStatsList = null;
			List bbsMaxNtcrList = null;
			
			// 1. 조회수(tab1)
			if ("tab1".equals(statsVO.getTabKind())) {
				// 생성글수 조회
				bbsStatsList = bbsStatsService.selectBbsTotCntStats_N(statsVO);
				// 결과 리턴
				statsVO.setTabKind("tab1");
				model.addAttribute("bbsStatsList", bbsStatsList);
				
			// 2. 첨부파일 다운로드회수(tab2)	
			} else if ("tab2".equals(statsVO.getTabKind())) {
				// 총조회수 조회
				bbsStatsList = bbsStatsService.selectBbsTotCntStats(statsVO);
				// 그래프 길이 설정
				float iMaxUnit = 50.0f;
				for (int i = 0; i < bbsStatsList.size(); i++) {
					StatsVO sVO = (StatsVO)bbsStatsList.get(i);
					int iCnt = sVO.getStatsCo();
					if (iCnt > 10 && iCnt <= 100) {
						if (iMaxUnit > 5.0f) {
							iMaxUnit = 5.0f;
						}
					} else if (iCnt > 100 && iCnt <= 1000) {
						if (iMaxUnit > 0.5f) {
							iMaxUnit = 0.5f;
						}
					} else if (iCnt > 1000) {
						if (iMaxUnit > 0.05f) {
							iMaxUnit = 0.05f;
						}
					}
				}
				statsVO.setMaxUnit(iMaxUnit);
				// 결과 리턴
				model.addAttribute("bbsStatsList", bbsStatsList);
				model.addAttribute("statsInfo", statsVO);
			
			} 
			
		} else {
			statsVO.setTabKind("tab1");
			model.addAttribute("statsInfo", statsVO);
		}
		
        return "egovframework/com/sts/bst/EgovBbsStats";
	}
    
    @RequestMapping(value="/sts/bst/selectBbsTotCntStats_N.do")
	public String selectBbsTotCntStats_N(@ModelAttribute("statsVO") StatsVO statsVO,
			ModelMap model) throws Exception {
    	
		if (statsVO.getFromDate() != null && !"".equals(statsVO.getFromDate())) {
			
			// 탭구분 : 생성글수(tab1), 총조회수(tab2), 평균조회수(tab3) 
			List bbsStatsList = null;
			
			// 1. 조회수(tab1)
			if ("tab1".equals(statsVO.getTabKind())) {
				// 생성글수 조회
				bbsStatsList = bbsStatsService.selectBbsTotCntStats_N(statsVO);
				// 결과 리턴
				statsVO.setTabKind("tab1");
				model.addAttribute("statsInfo", statsVO);
				model.addAttribute("bbsStatsList", bbsStatsList);
				
			// 2. 첨부파일 다운로드회수(tab2)	
			} else if ("tab2".equals(statsVO.getTabKind())) {
				// 총조회수 조회 
				bbsStatsList = bbsStatsService.selectBbsTotCntStats_A(statsVO);
				// 결과 리턴
				
				statsVO.setTabKind("tab2");
				model.addAttribute("statsInfo", statsVO);
				model.addAttribute("bbsStatsList", bbsStatsList);
			
			} 
			
		} else {
			statsVO.setTabKind("tab1");
			model.addAttribute("statsInfo", statsVO);
		}
		
        return "egovframework/com/sts/bst/EgovBbsStats";
	}
    
    
	/**
	 * 게시물 통계 조회
	 * @param statsVO
	 * @param response
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping("/sts/bst/selectBbsStatsList.do")
    public void selectBbsStatsList(@ModelAttribute("statsVO") StatsVO statsVO, HttpServletResponse response, ModelMap model) throws Exception {

    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	
    	// 차트 데이터
		resultMap.put("readList", bbsStatsService.selectBbsReadList(statsVO));
		resultMap.put("downList", bbsStatsService.selectBbsDownList(statsVO));
		
		// 게시물 데이터
		resultMap.put("readListData", bbsStatsService.selectBbsReadListData(statsVO));
		resultMap.put("downListData", bbsStatsService.selectBbsDownListData(statsVO));

		String rtnVal = JSONSerializer.toJSON(resultMap).toString();
		EgovWebUtil.sendMessage(response, rtnVal);

    }
	
	/**
	 * 게시판별 생성 수
	 * 
	 * @param statsVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/sts/bst/selectBbsRegistStats.do")
	public String selectBbsRegistStats(@ModelAttribute("statsVO") StatsVO statsVO,
			ModelMap model) throws Exception {
    	
        return "egovframework/com/sts/bst/EgovBbsRegistStats";
	}
	
	/**
	 * 게시판별 생성 수 통계 조회
	 * 
	 * @param statsVO
	 * @param response
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping("/sts/bst/selectBbsRegistStatsList.do")
    public void selectBbsRegistStatsList(@ModelAttribute("statsVO") StatsVO statsVO, HttpServletResponse response, ModelMap model) throws Exception {

    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	
		// 게시물 데이터
		resultMap.put("readListData", bbsStatsService.selectBbsRegistListData(statsVO));

		String rtnVal = JSONSerializer.toJSON(resultMap).toString();
		EgovWebUtil.sendMessage(response, rtnVal);

    }
}