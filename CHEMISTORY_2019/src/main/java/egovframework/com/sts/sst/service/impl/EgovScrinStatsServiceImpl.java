package egovframework.com.sts.sst.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.sts.com.StatsVO;
import egovframework.com.sts.sst.service.EgovScrinStatsService;
import egovframework.com.sym.mnu.mcm.service.MenuSiteMapVO;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 화면 통계 검색 비즈니스 구현 클래스
 * @author 공통서비스 개발팀 박지욱
 * @since 2009.03.12
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
 *
 *  </pre>
 */
@Service("scrinStatsService")
public class EgovScrinStatsServiceImpl extends AbstractServiceImpl implements
	EgovScrinStatsService {

    @Resource(name="scrinStatsDAO")
    private ScrinStatsDAO scrinStatsDAO;

    /**
	 * 화면 통계를 조회한다
	 * @param vo StatsVO
	 * @return List
	 * @exception Exception
	 */
    public List selectScrinStats(StatsVO vo) throws Exception {
        return scrinStatsDAO.selectScrinStats(vo);
	}
    
    public List selectScrinStatsTopN(StatsVO vo) throws Exception {
        return scrinStatsDAO.selectScrinStatsTopN(vo);
	}
    
    /* (non-Javadoc)
     * @see egovframework.com.sts.sst.service.EgovScrinStatsService#selectScrinStatsTopList(egovframework.com.sts.com.StatsVO)
     */
    public List<EgovMap> selectScrinStatsTopList(StatsVO vo) throws Exception{
    	
    	return scrinStatsDAO.selectScrinStatsTopList(vo);
    	
    }
    
    /* (non-Javadoc)
     * @see egovframework.com.sts.sst.service.EgovScrinStatsService#selectMenuTree()
     */
    public List<EgovMap> selectMenuTree() throws Exception{
		
		return scrinStatsDAO.selectMenuTree();
	}
    
    public List<EgovMap> selectBbsCont(StatsVO statsVO) throws Exception{
    	return scrinStatsDAO.selectBbsCont(statsVO);
    }
}
