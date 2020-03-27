package egovframework.com.cop.com.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.cop.com.service.UserInfVO;

/**
 * 협업 활용 사용자 정보 조회를 위한 데이터 접근 클래스
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
@Repository("EgovUserInfManageDAO")
public class EgovUserInfManageDAO extends EgovComAbstractDAO {

    /**
     * 사용자 정보에 대한 목록을 조회한다.
     * 
     * @param userVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<UserInfVO> selectUserList(UserInfVO userVO) throws Exception {
	return (List<UserInfVO>) list("EgovUserInfManageDAO.selectUserList", userVO);
    }

    /**
     * 사용자 정보에 대한 목록 전체 건수를 조회한다.
     * 
     * @param userVO
     * @return
     * @throws Exception
     */
    public int selectUserListCnt(UserInfVO userVO) throws Exception {
	return (Integer)getSqlMapClientTemplate().queryForObject("EgovUserInfManageDAO.selectUserListCnt", userVO);
    }

    /**
     * 커뮤니티 사용자 목록을 조회한다.
     * 
     * @param userVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<UserInfVO> selectCmmntyUserList(UserInfVO userVO) throws Exception {
	return (List<UserInfVO>) list("EgovUserInfManageDAO.selectCmmntyUserList", userVO);
    }

    /**
     * 커뮤니티 사용자 목록에 대한 전체 건수를 조회한다.
     * 
     * @param userVO
     * @return
     * @throws Exception
     */
    public int selectCmmntyUserListCnt(UserInfVO userVO) throws Exception {
	return (Integer)getSqlMapClientTemplate().queryForObject("EgovUserInfManageDAO.selectCmmntyUserListCnt", userVO);
    }

    /**
     * 커뮤니티 관리자 목록을 조회한다.
     * 
     * @param userVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<UserInfVO> selectCmmntyMngrList(UserInfVO userVO) throws Exception {
	return (List<UserInfVO>) list("EgovUserInfManageDAO.selectCmmntyMngrList", userVO);
    }

    /**
     * 커뮤니티 관리자 목록에 대한 전체 건수를 조회한다.
     * 
     * @param userVO
     * @return
     * @throws Exception
     */
    public int selectCmmntyMngrListCnt(UserInfVO userVO) throws Exception {
	return (Integer)getSqlMapClientTemplate().queryForObject("EgovUserInfManageDAO.selectCmmntyMngrListCnt", userVO);
    }

    /**
     * 동호회 사용자 목록을 조회한다.
     * 
     * @param userVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<UserInfVO> selectClubUserList(UserInfVO userVO) throws Exception {
	return (List<UserInfVO>) list("EgovUserInfManageDAO.selectClubUserList", userVO);
    }

    /**
     * 동호회 사용자 목록에 대한 전체 건수를 조회한다.
     * 
     * @param userVO
     * @return
     * @throws Exception
     */
    public int selectClubUserListCnt(UserInfVO userVO) throws Exception {
	return (Integer)getSqlMapClientTemplate().queryForObject("EgovUserInfManageDAO.selectClubUserListCnt", userVO);
    }

    /**
     * 동호회 운영자 목록을 조회한다.
     * 
     * @param userVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<UserInfVO> selectClubOprtrList(UserInfVO userVO) throws Exception {
	return (List<UserInfVO>) list("EgovUserInfManageDAO.selectClubOprtrList", userVO);
    }

    /**
     * 동호회 운영자 목록에 대한 전체 건수를 조회한다.
     * 
     * @param userVO
     * @return
     * @throws Exception
     */
    public int selectClubOprtrListCnt(UserInfVO userVO) throws Exception {
	return (Integer)getSqlMapClientTemplate().queryForObject("EgovUserInfManageDAO.selectClubOprtrListCnt", userVO);
    }

    /**
     * 동호회에 대한 모든 사용자 목록을 조회한다.
     * 
     * @param userVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<UserInfVO> selectAllClubUser(UserInfVO userVO) throws Exception {
	return (List<UserInfVO>) list("EgovUserInfManageDAO.selectAllClubUser", userVO);
    }

    /**
     * 커뮤니티에 대한 모든 사용자 목록을 조회한다.
     * 
     * @param userVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<UserInfVO> selectAllCmmntyUser(UserInfVO userVO) throws Exception {
	return (List<UserInfVO>) list("EgovUserInfManageDAO.selectAllCmmntyUser", userVO);
    }
    
    // Cms 직원/업무찾기 목록 조회 HGB
    @SuppressWarnings("unchecked")
    public List<UserInfVO> selectCmsUserList(UserInfVO userVO) throws Exception {
	return (List<UserInfVO>) list("EgovUserInfManageDAO.selectCmsUserList", userVO);
    }
    
    
    // 직원/업무찾기 목록 Cnt HGB
    public int selectCmsUserListCnt(UserInfVO userVO) throws Exception {
    	return (Integer)getSqlMapClientTemplate().queryForObject("EgovUserInfManageDAO.selectCmsUserListCnt", userVO);
    }
    
    public UserInfVO selectCmsUser(ComDefaultVO vo)throws Exception{
		return (UserInfVO)selectByPk("EgovUserInfManageDAO.selectCmsUser", vo); 
	}
    
    public void updateCmsUserList(UserInfVO vo){
		update("EgovUserInfManageDAO.updateCmsUserList", vo);
	}
    
    public void insertCmsUserList(UserInfVO userVO){
		insert("EgovUserInfManageDAO.insertCmsUserList", userVO);
	}
    
    public void deleteCmsUserList(UserInfVO userVO){
		delete("EgovUserInfManageDAO.deleteCmsUserList", userVO);
	}
    
    // 부서 관리 HGB
    @SuppressWarnings("unchecked")
    public List<UserInfVO> selectCmsDptList(UserInfVO userVO) throws Exception {
	return (List<UserInfVO>) list("EgovUserInfManageDAO.selectCmsDptList", userVO);
    }
    
    // 부서관리 Cnt HGB
    public int selectCmsDptListCnt(UserInfVO userVO) throws Exception {
    	return (Integer)getSqlMapClientTemplate().queryForObject("EgovUserInfManageDAO.selectCmsDptListCnt", userVO);
    }
    
    public void insertCmsDptList(UserInfVO userVO){
		insert("EgovUserInfManageDAO.insertCmsDptList", userVO);
	}
    
    public void deleteCmsDptList(UserInfVO userVO){
		delete("EgovUserInfManageDAO.deleteCmsDptList", userVO);
	}
    
    public UserInfVO selectCmsDpt(ComDefaultVO vo)throws Exception{
		return (UserInfVO)selectByPk("EgovUserInfManageDAO.selectCmsDpt", vo); 
	}
    
    public void updateCmsDptList(UserInfVO vo){
		update("EgovUserInfManageDAO.updateCmsDptList", vo);
	}
    
  // 부서 관리 HGB
    @SuppressWarnings("unchecked")
    public List<UserInfVO> selectCmsSectList(UserInfVO userVO) throws Exception {
	return (List<UserInfVO>) list("EgovUserInfManageDAO.selectCmsSectList", userVO);
    }
    
    // 부서관리 Cnt HGB
    public int selectCmsSectListCnt(UserInfVO userVO) throws Exception {
    	return (Integer)getSqlMapClientTemplate().queryForObject("EgovUserInfManageDAO.selectCmsSectListCnt", userVO);
    }
    
    public void insertCmsSectList(UserInfVO userVO){
		insert("EgovUserInfManageDAO.insertCmsSectList", userVO);
	}
    
    /*중복체크용*/
    public String selectCmsDptCode(UserInfVO userVO){
    	return (String)select("EgovUserInfManageDAO.selectCmsDptCode", userVO);
    }
    
    /*중복체크용*/
    public String selectCmsSectCode(UserInfVO userVO){
    	return (String)select("EgovUserInfManageDAO.selectCmsSectCode", userVO);
    }
    
    public void deleteCmsSectList(UserInfVO userVO){
		delete("EgovUserInfManageDAO.deleteCmsSectList", userVO);
	}
    
    
    public UserInfVO selectCmsSect(ComDefaultVO vo)throws Exception{
		return (UserInfVO)selectByPk("EgovUserInfManageDAO.selectCmsSect", vo); 
	}
    
    public void updateCmsSectList(UserInfVO vo){
		update("EgovUserInfManageDAO.updateCmsSectList", vo);
	}
    
    @SuppressWarnings("unchecked")
    public List<UserInfVO> selectCmsRankList(UserInfVO userVO) throws Exception {
	return (List<UserInfVO>) list("EgovUserInfManageDAO.selectCmsRankList", userVO);
    }
    
    // 부서관리 Cnt HGB
    public int selectCmsRankListCnt(UserInfVO userVO) throws Exception {
    	return (Integer)getSqlMapClientTemplate().queryForObject("EgovUserInfManageDAO.selectCmsRankListCnt", userVO);
    }
    
    public void insertCmsRankList(UserInfVO userVO){
		insert("EgovUserInfManageDAO.insertCmsRankList", userVO);
	}
    
    public UserInfVO selectCmsRank(ComDefaultVO vo)throws Exception{
		return (UserInfVO)selectByPk("EgovUserInfManageDAO.selectCmsRank", vo); 
	}
    
    public void updateCmsRankList(UserInfVO vo){
		update("EgovUserInfManageDAO.updateCmsRankList", vo);
	}
    
    public void deleteCmsRankList(UserInfVO userVO){
		delete("EgovUserInfManageDAO.deleteCmsRankList", userVO);
	}
    
    @SuppressWarnings("unchecked")
    public List<UserInfVO> selectCmsOrgList(UserInfVO userVO) throws Exception {
	return (List<UserInfVO>) list("EgovUserInfManageDAO.selectCmsOrgList", userVO);
    }
}
