package egovframework.com.sts.sst.web;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.sts.com.StatsVO;
import egovframework.com.sts.sst.service.EgovScrinStatsService;
import egovframework.com.sym.mnu.mcm.service.MenuSiteMapVO;
import egovframework.com.sym.mnu.mpm.service.EgovMenuManageService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 화면 통계 검색 컨트롤러 클래스
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
 *  2011.06.30  이기하          패키지 분리(sts -> sts.sst)
 *  2011.8.26	정진오			IncludedInfo annotation 추가
 *
 *  </pre>
 */

@Controller
public class EgovScrinStatsController {

	/** EgovConectStatsService */
	@Resource(name = "scrinStatsService")
    private EgovScrinStatsService scrinStatsService;

	/** EgovMenuManageService */
	@Resource(name = "meunManageService")
    private EgovMenuManageService menuManageService;

    /** log */
    protected static final Log LOG = LogFactory.getLog(EgovScrinStatsController.class);

    /**
	 * 화면 통계를 조회한다
	 * @param statsVO StatsVO
	 * @return String
	 * @exception Exception
	 */
    @IncludedInfo(name="화면통계", listUrl="/sts/sst/selectScrinStats.do", order = 150 ,gid = 30)
    @RequestMapping(value="/sts/sst/selectScrinStats.do")
	public String selectUserStats(@ModelAttribute("statsVO") StatsVO statsVO,
			ModelMap model) throws Exception {

    	// 트리메뉴 조회
    	List list_menulist = menuManageService.selectMenuList(new ComDefaultVO());
        model.addAttribute("list_menulist", list_menulist);

		if (statsVO.getFromDate() != null && !"".equals(statsVO.getFromDate())) {

			List scrinStats = scrinStatsService.selectScrinStats(statsVO);
			// 그래프에 표시될 이미지 길이를 결정한다.
			float iMaxUnit = 50.0f;
			for (int i = 0; i < scrinStats.size(); i++) {
				StatsVO sVo = (StatsVO)scrinStats.get(i);
				int iCnt = sVo.getStatsCo();
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

			model.addAttribute("scrinStats", scrinStats);
			model.addAttribute("statsInfo", statsVO);
		}
        return "egovframework/com/sts/sst/EgovScrinStats";
	}

    /**
     * 화면통계 화면
     * @param statsVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/sts/sst/selectScrinStatsTopN.do")
	public String selectScrinStatsTopN(@ModelAttribute("statsVO") StatsVO statsVO,
			ModelMap model) throws Exception {
    	
//		if (statsVO.getFromDate() != null && !"".equals(statsVO.getFromDate())) {
//
//			List scrinStats = scrinStatsService.selectScrinStatsTopN(statsVO);
//			model.addAttribute("scrinStats", scrinStats);
//		}
        return "egovframework/com/sts/sst/EgovScrinStatsTopN";
	}
    
    /**
     * 화면 통계 정보
     * @param statsVO
     * @param response
     * @param model
     * @throws Exception
     */
    @RequestMapping("/sts/sst/selectScrinStatsTopList.do")
    public void selectScrinStatsTopList(@ModelAttribute("statsVO") StatsVO statsVO, HttpServletResponse response, ModelMap model) throws Exception {

    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	
    	// 차트 데이터
		resultMap.put("viewList", scrinStatsService.selectScrinStatsTopList(statsVO));
		
		// 게시물 데이터
		resultMap.put("viewListData", scrinStatsService.selectScrinStatsTopN(statsVO));

		String rtnVal = JSONSerializer.toJSON(resultMap).toString();
		EgovWebUtil.sendMessage(response, rtnVal);

    }
    
	/**
	 * 메뉴 트리 정보 조회
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/sts/sst/menuTree.do")
	public void menuTree(HttpServletResponse response) throws Exception {
		
		JSONObject jsObj = new JSONObject();
		Map<String, List<EgovMap>> resultMap = new HashMap<String, List<EgovMap>>();
		resultMap.put("resultMap", scrinStatsService.selectMenuTree());
		
		jsObj.putAll(resultMap);
		EgovWebUtil.sendMessage(response, jsObj.toString());
		resultMap.clear();
	}
	
	@RequestMapping(value = "/sts/sst/getScrinStats.do")
	public void getScrinStats(@ModelAttribute("statsVO") StatsVO statsVO, HttpServletResponse response) throws Exception {
		
		JSONObject jsObj = new JSONObject();
		Map<String, List<EgovMap>> resultMap = new HashMap<String, List<EgovMap>>();
		resultMap.put("viewList", scrinStatsService.selectScrinStats(statsVO));
		
		jsObj.putAll(resultMap);
		EgovWebUtil.sendMessage(response, jsObj.toString());
		resultMap.clear();
	}
	
	@RequestMapping(value="/bbsTest.do")
	public String bbsTest() throws Exception {
        return "bbsTest";
	}
	
	@RequestMapping(value = "/getBbsCont.do")
	public void getBbsCont(@ModelAttribute("statsVO") StatsVO statsVO, HttpServletResponse response) throws Exception {
		
		JSONObject jsObj = new JSONObject();
		Map<String, List<EgovMap>> resultMap = new HashMap<String, List<EgovMap>>();
		resultMap.put("resultMap", scrinStatsService.selectBbsCont(statsVO));
		
		jsObj.putAll(resultMap);
		EgovWebUtil.sendMessage(response, jsObj.toString());
		resultMap.clear();
	}
	
	


}