package  egovframework.com.sym.mnu.mpm.service;

import java.io.InputStream;
import java.util.List;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cop.bbs.service.Board;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.com.sym.mnu.mcm.service.MenuSiteMapVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 메뉴관리에 관한 서비스 인터페이스 클래스를 정의한다.
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

public interface EgovMenuManageService {

	/**
	 * 메뉴 상세정보를 조회
	 * @param vo ComDefaultVO
	 * @return MenuManageVO
	 * @exception Exception
	 */
	MenuManageVO selectMenuManage(ComDefaultVO vo) throws Exception;

	/**
	 * 메뉴 목록을 조회
	 * @param vo ComDefaultVO
	 * @return List
	 * @exception Exception
	 */
	List selectMenuManageList(ComDefaultVO vo) throws Exception;

	/**
	 * 메뉴목록 총건수를 조회한다.
	 * @param vo ComDefaultVO
	 * @return int
	 * @exception Exception
	 */
	int selectMenuManageListTotCnt(ComDefaultVO vo) throws Exception;

	/**
	 * 메뉴번호 존재 여부를 조회한다.
	 * @param vo ComDefaultVO
	 * @return int
	 * @exception Exception
	 */
	int selectMenuNoByPk(MenuManageVO vo) throws Exception;


	int selectUpperMenuNoByPk(MenuManageVO vo) throws Exception;

	/**
	 * 메뉴 정보를 등록
	 * @param vo MenuManageVO
	 * @exception Exception
	 */
	void insertMenuManage(MenuManageVO vo) throws Exception;

	/**
	 * 메뉴 정보를 수정
	 * @param vo MenuManageVO
	 * @exception Exception
	 */
	void updateMenuManage(MenuManageVO vo) throws Exception;

	/**
	 * 메뉴 정보를 삭제
	 * @param vo MenuManageVO
	 * @exception Exception
	 */
	void deleteMenuManage(MenuManageVO vo) throws Exception;

	/**
	 * 화면에 조회된 메뉴 목록 정보를 데이터베이스에서 삭제
	 * @param checkedMenuNoForDel String
	 * @exception Exception
	 */
	void deleteMenuManageList(String checkedMenuNoForDel) throws Exception;


	/*  메뉴 생성 관리  */

	/**
	 * 메뉴 목록을 조회
	 * @param searchVO
	 * @return List
	 * @exception Exception
	 */
	List selectMenuList(ComDefaultVO vo) throws Exception;


	/*### 메뉴관련 프로세스 ###*/
	/**
	 * MainMenu Head Menu 조회
	 * @param vo MenuManageVO
	 * @return List
	 * @exception Exception
	 */
	List selectMainMenuHead(MenuManageVO vo) throws Exception;

	/**
	 * Admin Left Menu 조회
	 *
	 * @param menuManageVO
	 * @return
	 * @throws Exception
	 */
	List selectAdminMenuLeft(MenuManageVO menuManageVO) throws Exception;

	/**
	 * Main Left Menu 조회
	 * @param vo MenuManageVO
	 * @return List
	 * @exception Exception
	 */
	List selectMainMenuLeft(MenuManageVO menuManageVO) throws Exception;

	/**
	 * MainMenu Head MenuURL 조회
	 * @param iMenuNo int
	 * @param sUniqId String
	 * @return String
	 * @exception Exception
	 */
	String selectLastMenuURL(Long iMenuNo, String sUniqId) throws Exception;

	/* 일괄처리 프로세스   */

	/**
	 * 메뉴일괄초기화 프로세스 메뉴목록테이블, 프로그램 목록테이블 전체 삭제
	 * @return boolean
	 */
	boolean menuBndeAllDelete() throws Exception;

	/**
	 * 메뉴일괄등록 프로세스
	 * @param  vo MenuManageVO
	 * @param  inputStream InputStream
	 * @exception Exception
	 */
	String menuBndeRegist(MenuManageVO vo, InputStream inputStream) throws Exception;




	List selectNoLoginMainMenuHead(MenuManageVO vo) throws Exception;


	List selectNoLoginMenuLeft_3D(MenuManageVO vo) throws Exception;


	MenuManageVO selectMenuInfo_PRGM(ComDefaultVO vo) throws Exception;
	
	MenuManageVO selectMenuInfo_PRGM(MenuManageVO vo) throws Exception;


	MenuManageVO selectMenuAdminManage(ComDefaultVO vo) throws Exception;
	
	void updateMenuAdminManage(MenuManageVO vo) throws Exception;

	void insertMenuAdminManage(MenuManageVO vo) throws Exception;
	
	/**
	 * 메뉴 트리 정보 조회
	 * @param menuSiteMapVO
	 * @return
	 * @throws Exception
	 */
	List<EgovMap> selectMenuTree(ComDefaultVO searchVO) throws Exception;
	
	public int selectContentYN(MenuManageVO vo) throws Exception;
	
    /**
     * DB 컨텐츠 이력 조회
     * @param MenuManageVO
     * @return
     * @throws Exception
     */
    List<MenuManage> selectContentDBHistory(MenuManageVO vo) throws Exception;
    
    /**
     * DB 컨텐츠 이력 미리보기
     * @param MenuManageVO
     * @return
     * @throws Exception
     */
    MenuManage contentDBHistoryPreview(MenuManageVO vo) throws Exception;
    
    /**
     * DB 컨텐츠 복원
     * @param MenuManageVO
     * @return
     * @throws Exception
     */
    int restorationContentDBHistory(MenuManageVO vo) throws Exception;

}