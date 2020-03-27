package egovframework.com.cop.com.service;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultVO;



/**
 * 협업 기능에서 사용자 정보를 관리하기 위한 서비스 인터페이스 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.4.6  이삼섭          최초 생성
 *
 * </pre>
 */
public interface EgovUserInfManageService {

	/**
     * 사용자 정보에 대한 목록을 조회한다.
     * 
     * @param userVO
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectUserList(UserInfVO userVO) throws Exception;

    /**
     * 커뮤니티 사용자 목록을 조회한다.
     * 
     * @param userVO
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectCmmntyUserList(UserInfVO userVO) throws Exception;

    /**
     * 커뮤니티 관리자 목록을 조회한다.
     * 
     * @param userVO
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectCmmntyMngrList(UserInfVO userVO) throws Exception;

    /**
     * 동호회 사용자 목록을 조회한다.
     * 
     * @param userVO
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectClubUserList(UserInfVO userVO) throws Exception;

    /**
     * 동호회 운영자 목록을 조회한다.
     * 
     * @param userVO
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectClubOprtrList(UserInfVO userVO) throws Exception;

    /**
     * 동호회에 대한 모든 사용자 목록을 조회한다.
     * 
     * @param userVO
     * @return
     * @throws Exception
     */
    public List<UserInfVO> selectAllClubUser(UserInfVO userVO) throws Exception;

    /**
     * 커뮤니티에 대한 모든 사용자 목록을 조회한다.
     * 
     * @param userVO
     * @return
     * @throws Exception
     */
    public List<UserInfVO> selectAllCmmntyUser(UserInfVO userVO) throws Exception;
    
    
    
    // Cms 직원 / 업무찾기 HGB
    public Map<String, Object> selectCmsUserList(UserInfVO userVO) throws Exception;
    
    UserInfVO selectCmsUser(ComDefaultVO vo) throws Exception;
    
    void updateCmsUserList(UserInfVO vo) throws Exception;
    
    public boolean insertCmsUserList(UserInfVO userVO) throws Exception;
    
    
    /*중복체크용*/
    String selectCmsDptCode(UserInfVO userVO);
    
    /*중복체크용*/
    String selectCmsSectCode(UserInfVO userVO);
    
    void deleteCmsUserList(UserInfVO userVO) throws Exception;
    
    // Cms 부서관리 목록 HGB
    public Map<String, Object> selectCmsDptList(UserInfVO userVO) throws Exception;
    
    // Cms 부서관리 등록 HGB
    public boolean insertCmsDptList(UserInfVO userVO) throws Exception;
    
    // Cms 부서관리 삭제HGB
    void deleteCmsDptList(UserInfVO userVO) throws Exception;

    UserInfVO selectCmsDpt(ComDefaultVO vo) throws Exception;
    
    void updateCmsDptList(UserInfVO vo) throws Exception;
    
    public Map<String, Object> selectCmsSectList(UserInfVO userVO) throws Exception;
    
    public boolean insertCmsSectList(UserInfVO userVO) throws Exception;
    
    void deleteCmsSectList(UserInfVO userVO) throws Exception;
    
    UserInfVO selectCmsSect(ComDefaultVO vo) throws Exception;
    
    void updateCmsSectList(UserInfVO vo) throws Exception;
    
    public Map<String, Object> selectCmsRankList(UserInfVO userVO) throws Exception;
    
    public boolean insertCmsRankList(UserInfVO userVO) throws Exception;
    
    UserInfVO selectCmsRank(ComDefaultVO vo) throws Exception;
    
    void updateCmsRankList(UserInfVO vo) throws Exception;
    
    void deleteCmsRankList(UserInfVO userVO) throws Exception;
    
    public Map<String, Object> selectCmsOrgList(UserInfVO userVO) throws Exception;
}
