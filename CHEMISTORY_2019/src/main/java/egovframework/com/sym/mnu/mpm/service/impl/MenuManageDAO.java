package egovframework.com.sym.mnu.mpm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.sym.mnu.mpm.service.MenuManage;
import egovframework.com.sym.mnu.mpm.service.MenuManageVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
/**
 * 메뉴관리, 메뉴생성, 사이트맵 생성에 대한 DAO 클래스를 정의한다.
 * @author 개발환경 개발팀 이용
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.20  이  용          최초 생성
 *   2011.07.01  서준식			자기 메뉴 정보를 상위메뉴 정보로 참조하는 메뉴정보가 있는지 조회하는
 *   							selectUpperMenuNoByPk() 메서드 추가
 *
 * </pre>
 */

@Repository("menuManageDAO")
public class MenuManageDAO extends EgovComAbstractDAO{

	/**
	 * 메뉴목록을 조회
	 * @param vo ComDefaultVO
	 * @return List
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	public List selectMenuManageList(ComDefaultVO vo) throws Exception{
		return list("menuManageDAO.selectMenuManageList_D", vo);
	}

    /**
	 * 메뉴목록관리 총건수를 조회한다.
	 * @param vo ComDefaultVO
	 * @return int
	 * @exception Exception
	 */
    public int selectMenuManageListTotCnt(ComDefaultVO vo) {
        return (Integer)getSqlMapClientTemplate().queryForObject("menuManageDAO.selectMenuManageListTotCnt_S", vo);
    }

	/**
	 * 메뉴목록관리 기본정보를 조회
	 * @param vo ComDefaultVO
	 * @return MenuManageVO
	 * @exception Exception
	 */
	public MenuManageVO selectMenuManage(ComDefaultVO vo)throws Exception{
		return (MenuManageVO)selectByPk("menuManageDAO.selectMenuManage_D", vo);
	}

	/**
	 * 메뉴목록 기본정보를 등록
	 * @param vo MenuManageVO
	 * @exception Exception
	 */
	public void insertMenuManage(MenuManageVO vo){
		insert("menuManageDAO.insertMenuManage_S", vo);
	}

	/**
	 * 메뉴목록 기본정보를 수정
	 * @param vo MenuManageVO
	 * @exception Exception
	 */
	public void updateMenuManage(MenuManageVO vo){
		update("menuManageDAO.updateMenuManage_S", vo);
	}

	/**
	 * 메뉴목록 기본정보를 삭제
	 * @param vo MenuManageVO
	 * @exception Exception
	 */
	public void deleteMenuManage(MenuManageVO vo){
		delete("menuManageDAO.deleteMenuManage_S", vo);
	}

	/**
	 * 메뉴 전체목록을 조회
	 *
	 * @param vo
	 * @return list
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	public List selectMenuList(ComDefaultVO vo) throws Exception{
		return list("menuManageDAO.selectMenuListT_D", vo);
	}


	/**
	 * 메뉴번호 존재여부를 조회
	 * @param vo MenuManageVO
	 * @return int
	 * @exception Exception
	 */
	public int selectMenuNoByPk(MenuManageVO vo) throws Exception{
		return (Integer)selectByPk("menuManageDAO.selectMenuNoByPk", vo);
	}



	/**
	 * 메뉴번호를 상위메뉴로 참조하고 있는 메뉴 존재여부를 조회
	 * @param vo MenuManageVO
	 * @return int
	 * @exception Exception
	 */
	public int selectUpperMenuNoByPk(MenuManageVO vo) throws Exception{
		return (Integer)selectByPk("menuManageDAO.selectUpperMenuNoByPk", vo);
	}

	/**
	 * 메뉴정보 전체삭제 초기화
	 * @return boolean
	 * @exception Exception
	 */
	public boolean deleteAllMenuList(){
		MenuManageVO vo = new MenuManageVO();
		insert("menuManageDAO.deleteAllMenuList", vo);
		return true;
	}

    /**
	 * 메뉴정보 존재여부 조회한다.
	 * @return int
	 * @exception Exception
	 */
    public int selectMenuListTotCnt() {
    	MenuManageVO vo = new MenuManageVO();
        return (Integer)getSqlMapClientTemplate().queryForObject("menuManageDAO.selectMenuListTotCnt", vo);
    }


	/*### 메뉴관련 프로세스 ###*/
	/**
	 * MainMenu Head Menu 조회
	 * @param vo MenuManageVO
	 * @return List
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	public List selectMainMenuHead(MenuManageVO vo) throws Exception{
		return list("menuManageDAO.selectMainMenuHead", vo);
	}

	/**
	 * Admin Left Menu 조회
	 * @param menuManageVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	public List selectAdminMenuLeft(MenuManageVO menuManageVO) throws Exception {
		return list("menuManageDAO.selectAdminMenuLeft", menuManageVO);
	}
	/**
	 * MainMenu Left Menu 조회
	 * @param vo MenuManageVO
	 * @return List
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	public List selectMainMenuLeft(MenuManageVO menuManageVO) throws Exception{
		return list("menuManageDAO.selectMainMenuLeft", menuManageVO);
	}

	/**
	 * MainMenu Head MenuURL 조회
	 * @param vo MenuManageVO
	 * @return  String
	 * @exception Exception
	 */
	public String selectLastMenuURL(MenuManageVO vo) throws Exception{
		return (String)getSqlMapClientTemplate().queryForObject("menuManageDAO.selectLastMenuURL", vo);
	}

	/**
	 * MainMenu Left Menu 조회
	 * @param vo MenuManageVO
	 * @return int
	 * @exception Exception
	 */
	public Long selectLastMenuNo(MenuManageVO vo) throws Exception{
		return (Long)getSqlMapClientTemplate().queryForObject("menuManageDAO.selectLastMenuNo", vo);
	}

	/**
	 * MainMenu Left Menu 조회
	 * @param vo MenuManageVO
	 * @return int
	 * @exception Exception
	 */
	public int selectLastMenuNoCnt(MenuManageVO vo) throws Exception{
		return (Integer)getSqlMapClientTemplate().queryForObject("menuManageDAO.selectLastMenuNoCnt", vo);
	}

	@SuppressWarnings("rawtypes")
	public List selectNoLoginMainMenuHead(MenuManageVO vo) throws Exception{
		return list("menuManageDAO.selectNoLoginMainMenuHead", vo);
	}


	@SuppressWarnings("rawtypes")
	public List selectNoLoginMenuLeft_3D(MenuManageVO vo) throws Exception{
		return list("menuManageDAO.selectNoLoginMenuLeft_3D", vo);
	}

	public MenuManageVO selectMenuInfo_PRGM(ComDefaultVO vo)throws Exception{
		return (MenuManageVO)selectByPk("menuManageDAO.selectMenuInfo_Prgm", vo);
	}
	
	public MenuManageVO selectMenuInfo_PRGM(MenuManageVO vo)throws Exception{
		return (MenuManageVO)selectByPk("menuManageDAO.selectAuthorMenuInfo_Prgm", vo);
	}

	public MenuManageVO selectMenuAdminManage(ComDefaultVO vo)throws Exception{
		return (MenuManageVO)selectByPk("menuManageDAO.selectMenuAdminManage", vo);
	}
	
	public void updateMenuAdminManage(MenuManageVO vo){
		update("menuManageDAO.updateMenuAdminManage", vo);
	}

	public void insertMenuAdminManage(MenuManageVO vo){
		insert("menuManageDAO.insertMenuAdminManage", vo);
	}
	
	public int chkContentInsertFlag(MenuManageVO vo) throws Exception {  	
		return (Integer)getSqlMapClientTemplate().queryForObject("menuManageDAO.chkContentInsertFlag", vo);
	}
	
	/**
	 * 메뉴 등록, 수정시 DB 컨텐츠 등록, 수정
	 * @param MenuManageVO
	 * @return
	 * @throws Exception
	 */
	public int mergeProgrmContant(MenuManageVO vo){
		return update("menuManageDAO.mergeProgrmContant", vo);
	}
	
	
	/**
	 * 메뉴 등록, 수정시 DB 컨텐츠 등록여부 조회
	 * @param MenuManageVO
	 * @return
	 * @throws Exception
	 */
	public int getAlreadyContentsInsert(MenuManageVO vo){
		return (Integer) select("menuManageDAO.getAlreadyContentsInsert", vo);
	}
	
	/**
	 * 메뉴 등록, 수정시 DB 컨텐츠 등록
	 * @param MenuManageVO
	 * @return
	 * @throws Exception
	 */
	public void insertProgrmContant(MenuManageVO vo){
		insert("menuManageDAO.insertProgrmContant", vo);
	}
	
	/**
	 * 메뉴 등록, 수정시 DB 컨텐츠 수정
	 * @param MenuManageVO
	 * @return
	 * @throws Exception
	 */
	public int updateProgrmContant(MenuManageVO vo){
		return update("menuManageDAO.updateProgrmContant", vo);
	}
	
	/**
     * 메뉴 트리 정보 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
	List<EgovMap> selectMenuTree(ComDefaultVO searchVO) throws Exception{
    	
		return (List<EgovMap>) list("menuManageDAO.selectSiteMenuTree", searchVO); 
	}
    
    public int selectContentYN(MenuManageVO vo) throws Exception {  	
    	return (Integer)getSqlMapClientTemplate().queryForObject("menuManageDAO.selectContentYN", vo);
    }

    /**
     * DB 컨텐츠 이력 조회
     * @param MenuManageVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
	List<MenuManage> selectContentDBHistory(MenuManageVO vo) throws Exception{
    	
        return (List<MenuManage>) list("menuManageDAO.selectContentDBHistory", vo);
    }
    
    public MenuManage selectContentDBHistoryPreview(MenuManageVO vo) {
		
		return (MenuManage)selectByPk("menuManageDAO.selectContentDBHistoryPreview", vo);
	}
    
	public int insertProgrmContantLog(MenuManageVO vo) throws Exception {
		
    	return Integer.parseInt(insert("menuManageDAO.insertProgrmContantLog", vo) + "");
    }

    /**
     * DB 컨텐츠 이력 
     * @param board
     * @return
     * @throws Exception
     */
    int updateDBContentHistory(MenuManageVO vo) throws Exception {
    	
    	return update("menuManageDAO.updateDBContentHistory", vo);
    }
    
    /**
     * 메뉴 생성 유무 조회
     * @param vo
     * @return
     * @throws Exception
     */
    String selectMenuActionTy(MenuManageVO vo) throws Exception{
    	
    	return (String)selectByPk("menuManageDAO.selectMenuActionTy", vo);
    	
    }

}