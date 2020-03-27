package egovframework.com.cop.bbs.service;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.service.FileVO;
import egovframework.com.sym.mnu.mcm.service.MenuCreatVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;


/**
 * 게시물 관리를 위한 서비스 인터페이스  클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------      --------    ---------------------------
 *   2009.3.19  이삼섭          최초 생성
 *
 * </pre>
 */
/**
 * @author hsp
 *
 */
public interface EgovBBSManageService {

    /**
     * 게시물 한 건을 삭제 한다.
     * 
     * @param Board
     * @throws Exception
     */
    public void deleteBoardArticle(Board Board) throws Exception;
    
    /**
     * 게시물 여러 건을 삭제해제 한다.
     *
     * @param Board
     * @throws Exception
     */
    public void deleteBoardArticlesUndo(Board board) throws Exception;
    
    /**
     * 게시판에 게시물 또는 답변 게시물을 등록 한다.
     * 
     * @param Board
     * @throws Exception
     */
    public int insertBoardArticle(Board Board) throws Exception;

    /**
     * 게시물 대하여 상세 내용을 조회 한다.
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    public BoardVO selectBoardArticle(BoardVO boardVO) throws Exception;

    /**
     * 조건에 맞는 게시물 목록을 조회 한다.
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectBoardArticles(BoardVO boardVO, String attrbFlag) throws Exception;

    /**
     * 통합검색
     * @param boardVO
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectBoardArticles2(BoardVO boardVO) throws Exception;
    public Map<String, Object> selectBoardArticles3(BoardVO boardVO) throws Exception;

    /**
     * 게시물 한 건의 내용을 수정 한다.
     * 
     * @param Board
     * @throws Exception
     */
    public void updateBoardArticle(Board Board) throws Exception;

    /**
     * 방명록에 대한 목록을 조회 한다.
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectGuestList(BoardVO boardVO) throws Exception;

    /**
     * 방명록 내용을 삭제 한다.
     * 
     * @param boardVO
     * @throws Exception
     */
    public void deleteGuestList(BoardVO boardVO) throws Exception;

    /**
     * 방명록에 대한 패스워드를 조회 한다.
     * 
     * @param Board
     * @return
     * @throws Exception
     */
    public String getPasswordInf(Board Board) throws Exception;

    public String getVodFileSn(Board Board) throws Exception;
    
    public void realDeleteBoardArticles(BoardVO Board) throws Exception;
    
    public Map<String, Object> selectBoardArticles_obj(BoardVO boardVO, String attrbFlag) throws Exception;
    
    /**
     * 게시글 변경이력 생성
     * @param Board
     * @return
     * @throws Exception
     */
    int insertBoardArticleLog(Board Board) throws Exception;
    
    /**
     * 게시물 이력 조회
     * @param Board
     * @return
     * @throws Exception
     */
    List<BoardVO> selectBBSHistory(Board Board) throws Exception;
    
    /**
     * 컨텐츠 이력 미리보기
     * @param boardVO
     * @return
     * @throws Exception
     */
    BoardVO contentBBSHistoryPreview(BoardVO boardVO) throws Exception;
    
    /**
     * 컨텐츠 이력 파일 리스트
     * @param boardVO
     * @return
     * @throws Exception
     */
    List<FileVO> selectBBSHistoryFileList(BoardVO boardVO) throws Exception;
    
    /**
     * 게시물 복원
     * @param Board
     * @return
     * @throws Exception
     */
    int restorationBBSHistory(Board Board) throws Exception;
    
    /**
     * 컨텐츠 이력 미리보기
     * @param boardVO
     * @return
     * @throws Exception
     */
    BoardVO selectWaterMainPhoto(BoardVO boardVO) throws Exception;
    
    /**
     * 파일 정보 입력
     * @param Board
     * @throws Exception
     */
    void updateBoardFileSn(Board Board) throws Exception;
    
    /**
     * 게시판 목록 조회
     * @param Board
     * @return
     * @throws Exception
     */
    List<EgovMap> selectBBSList(Board Board) throws Exception; 
    
    /**
     * 게시물 복사
     * @param Board
     * @return
     * @throws Exception
     */
    int realCopyBoardArticles(Board Board) throws Exception;
    
}
