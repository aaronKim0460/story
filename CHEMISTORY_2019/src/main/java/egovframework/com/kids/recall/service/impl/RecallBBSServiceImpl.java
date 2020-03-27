/**
 * @Name : RecallBBSServiceImpl.java
 * @Description : 유해용품 리콜 serviceImpl.
 * @author 이한구
 * @since 2016. 11. 17.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 11. 17.	이한구. 최초 생성.
 */
package egovframework.com.kids.recall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hsqldb.lib.StringUtil;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.service.impl.FileManageDAO;
import egovframework.com.cop.bbs.service.BBSKeyword;
import egovframework.com.cop.bbs.service.impl.BBSKeywordDAO;
import egovframework.com.kids.recall.DAO.RecallBBSDAO;
import egovframework.com.kids.recall.service.RecallBBSService;
import egovframework.com.kids.recall.vo.RecallBBSVO;
import egovframework.com.kids.recall.vo.RecallMaterialVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("recallBBSService")
public class RecallBBSServiceImpl implements RecallBBSService {

	@Resource(name = "recallBBSDAO")
	private RecallBBSDAO recallBBSDAO;

	@Resource(name = "FileManageDAO")
	private FileManageDAO fileMngDAO;

	@Resource(name = "recallBBSIdGnrService")
	private EgovIdGnrService recallBBSIdGnrService;

	@Resource(name = "BBSKeywordDAO")
	private BBSKeywordDAO bbsKeywordDAO;

	@Resource(name = "keywordIdGnrService")
	private EgovIdGnrService keywordIdgenService;

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.recall.service.RecallBBSService#selectRecallBBSList(egovframework.com.kids.recall.vo.RecallBBSVO)
	 */
	@Override
	public List<RecallBBSVO> selectRecallBBSList(RecallBBSVO vo) throws Exception {
		return recallBBSDAO.selectRecallBBSList(vo);
	}

	/*
	 * 유해물지 통합검색 (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.recall.service.RecallBBSService#selectRecallBBSList2(egovframework.com.kids.recall.vo.RecallBBSVO)
	 */
	@Override
	public List<RecallBBSVO> selectRecallBBSList2(RecallBBSVO vo) throws Exception {
		return recallBBSDAO.selectRecallBBSList2(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.recall.service.RecallBBSService#selectRecallBBSCount(egovframework.com.kids.recall.vo.RecallBBSVO)
	 */
	@Override
	public int selectRecallBBSCount(RecallBBSVO vo) throws Exception {
		return recallBBSDAO.selectRecallBBSCount(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.recall.service.RecallBBSService#selectRecallBBS(egovframework.com.kids.recall.vo.RecallBBSVO)
	 */
	@Override
	public RecallBBSVO selectRecallBBS(RecallBBSVO vo) throws Exception {
		if (!StringUtil.isEmpty(vo.getViewCountUpdateYn()) && "Y".equals(vo.getViewCountUpdateYn())) {
			recallBBSDAO.updateViewCount(vo);
		}
		return recallBBSDAO.selectRecallBBS(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.recall.service.RecallBBSService#insertRecallBBS(egovframework.com.kids.recall.vo.RecallBBSVO)
	 */
	@Override
	public void insertRecallBBS(RecallBBSVO vo) throws Exception {
		// id를 생성해서 vo에 입력한다.
		String recallId = recallBBSIdGnrService.getNextStringId();
		vo.setRecallId(recallId);

		recallBBSDAO.insertRecallBBS(vo);

		// 유해용품 유해인자 등록
		if (vo.getmIdxs() != null && vo.getmIdxs().length > 0) {
			for (int i = 0; i < vo.getmIdxs().length; i++) {
				RecallMaterialVO insertVO = new RecallMaterialVO();
				insertVO.setRecallId(recallId);
				insertVO.setmIdx(vo.getmIdxs()[i]);

				recallBBSDAO.insertRecallMaterial(insertVO);
			}
		}

		// #tag 검색 process - 전체 삭제 후 다시 입력한다.
		BBSKeyword deleteVO = new BBSKeyword();
		deleteVO.setBbsId(vo.getRecallId());

		bbsKeywordDAO.deleteBBSKeywordByBbsKeys(deleteVO);

		if (vo.getKeywordTag() != null && !"".equals(vo.getKeywordTag())) {
			String[] arrayString = vo.getKeywordTag().split("#");

			if (arrayString.length > 0) {
				for (int i = 0; i < arrayString.length; i++) {
					if (!StringUtil.isEmpty(arrayString[i])) {
						BBSKeyword insertVO = new BBSKeyword();
						insertVO.setKeyId(keywordIdgenService.getNextStringId());
						insertVO.setBbsId(vo.getRecallId());
						if ("Y".equals(vo.getDomesticYn())) {
							// 국내
							insertVO.setNttId(String.valueOf("11007"));
						} else {
							// 국외
							insertVO.setNttId(String.valueOf("11008"));
						}
						insertVO.setFrstRegisterId(vo.getFrstRegisterId());
						insertVO.setKeyword(arrayString[i]);

						bbsKeywordDAO.insertBBSKeyword(insertVO);
					}
				}
			}
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.recall.service.RecallBBSService#updateRecallBBS(egovframework.com.kids.recall.vo.RecallBBSVO)
	 */
	@Override
	public void updateRecallBBS(RecallBBSVO vo) throws Exception {
		recallBBSDAO.updateRecallBBS(vo);

		// 유해용품 유해인자를 모두 삭제하고 다시 등록한다.
		recallBBSDAO.deleteRecallMaterialByRecallId(vo.getRecallId());
		if (vo.getmIdxs() != null && vo.getmIdxs().length > 0) {
			for (int i = 0; i < vo.getmIdxs().length; i++) {
				RecallMaterialVO insertVO = new RecallMaterialVO();
				insertVO.setRecallId(vo.getRecallId());
				insertVO.setmIdx(vo.getmIdxs()[i]);

				recallBBSDAO.insertRecallMaterial(insertVO);
			}
		}

		// #tag 검색 process - 전체 삭제 후 다시 입력한다.
		BBSKeyword deleteVO = new BBSKeyword();
		deleteVO.setBbsId(vo.getRecallId());

		bbsKeywordDAO.deleteBBSKeywordByBbsKeys(deleteVO);

		if (vo.getKeywordTag() != null && !"".equals(vo.getKeywordTag())) {
			String[] arrayString = vo.getKeywordTag().split("#");

			if (arrayString.length > 0) {
				for (int i = 0; i < arrayString.length; i++) {
					if (!StringUtil.isEmpty(arrayString[i])) {
						BBSKeyword insertVO = new BBSKeyword();
						insertVO.setKeyId(keywordIdgenService.getNextStringId());
						insertVO.setBbsId(vo.getRecallId());
						if ("Y".equals(vo.getDomesticYn())) {
							// 국내
							insertVO.setNttId(String.valueOf("11007"));
						} else {
							// 국외
							insertVO.setNttId(String.valueOf("11008"));
						}
						insertVO.setFrstRegisterId(vo.getLastUpdusrId());
						insertVO.setKeyword(arrayString[i]);

						bbsKeywordDAO.insertBBSKeyword(insertVO);
					}
				}
			}
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.recall.service.RecallBBSService#deleteRecallBBS(egovframework.com.kids.recall.vo.RecallBBSVO)
	 */
	@Override
	public void deleteRecallBBS(RecallBBSVO vo) throws Exception {
		recallBBSDAO.deleteRecallBBS(vo);

		// 유해용품 유해인자를 모두 삭제한다.
		recallBBSDAO.deleteRecallMaterialByRecallId(vo.getRecallId());

		// #tag 검색 process - 전체 삭제 후 다시 입력한다.
		BBSKeyword deleteVO = new BBSKeyword();
		deleteVO.setBbsId(vo.getRecallId());

		bbsKeywordDAO.deleteBBSKeywordByBbsKeys(deleteVO);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.recall.service.RecallBBSService#deleteRecallBBSAtchFileId(egovframework.com.kids.recall.vo.RecallBBSVO)
	 */
	@Override
	public void deleteRecallBBSAtchFileId(RecallBBSVO vo) throws Exception {
		// 1.파일정보를 삭제한다. - 데이터 복원을 위해 삭제를 하지 않는것으로 변경 2016.11.04 이한구
		FileVO deleteVO = new FileVO();
		deleteVO.setAtchFileId(vo.getAtchFileId());
		deleteVO.setFileSn("0");
		fileMngDAO.deleteFileInf(deleteVO);

		recallBBSDAO.deleteRecallBBSAtchFileId(vo);

	}
}
