package egovframework.com.sts.sst.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.sts.com.StatsVO;
import egovframework.com.sym.mnu.mcm.service.MenuSiteMapVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 화면 통계 검색 DAO 클래스
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
@Repository("scrinStatsDAO")
public class ScrinStatsDAO extends EgovComAbstractDAO {

	/**
	 * 화면 통계를 조회한다
	 * @param vo StatsVO
	 * @return List
	 * @exception Exception
	 */
    public List selectScrinStats(StatsVO vo) throws Exception {
        return list("ScrinStatsDAO.selectScrinStats_N", vo);
    }
    
    public List selectScrinStatsTopN(StatsVO vo) throws Exception {
        return list("ScrinStatsDAO.selectScrinStatsTopN", vo);
    }
    
    /**
     * 화면 통계 차트 데이터 조회
     * @param vo
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    List<EgovMap> selectScrinStatsTopList(StatsVO vo) throws Exception{
    	
		return (List<EgovMap>) list("ScrinStatsDAO.selectScrinStatsTopList", vo); 
	}
    
    /**
     * 메뉴 트리 정보 조회
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
	List<EgovMap> selectMenuTree() throws Exception{
    	
		return (List<EgovMap>) list("ScrinStatsDAO.selectMenuTree", ""); 
	}
    
    List<EgovMap> selectBbsCont(StatsVO statsVO) throws Exception{
    	return (List<EgovMap>) list("ScrinStatsDAO.selectBbsCont", statsVO);
    }
}
