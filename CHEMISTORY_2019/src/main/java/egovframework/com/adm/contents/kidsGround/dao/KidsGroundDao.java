package egovframework.com.adm.contents.kidsGround.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.adm.contents.kidsGround.vo.KidsGroundFaciltyVO;
import egovframework.com.adm.contents.kidsGround.vo.KidsGroundReliefVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("kidsGroundDao")
public class KidsGroundDao extends EgovComAbstractDAO{

	@SuppressWarnings("unchecked")
	public List<KidsGroundFaciltyVO> selectKidsGroundFaciltyList(KidsGroundFaciltyVO kfvo) throws Exception{
		return (List<KidsGroundFaciltyVO>) list("KidsGroundDao.selectKidsGroundFaciltyList", kfvo);
	}

	public int selectKidsGroundFaciltyListCnt(KidsGroundFaciltyVO kfvo) throws Exception{
		return (Integer) select("KidsGroundDao.selectKidsGroundFaciltyListCnt", kfvo);
	}
	
	public int selectKidsGroundFaciltyListCnt() throws Exception{
		return (Integer) select("KidsGroundDao.selectKidsGroundFaciltyListCnt");
	}

	@SuppressWarnings("unchecked")
	public List<KidsGroundFaciltyVO> selectKidsGroundFaciltyExcelList(KidsGroundFaciltyVO kfvo) throws Exception{
		return (List<KidsGroundFaciltyVO>) list("KidsGroundDao.selectKidsGroundFaciltyExcelList", kfvo);
	}

	public int deleteFcltyTable() throws Exception{
		return update("KidsGroundDao.deleteFcltyTable");
	}

	public int insertFcltyData(KidsGroundFaciltyVO detailvo) throws Exception{
		return update("KidsGroundDao.insertFcltyData", detailvo);
	}

	public KidsGroundFaciltyVO detailKidsGroundCurrent(KidsGroundFaciltyVO kfvo) throws Exception{
		return (KidsGroundFaciltyVO) select("KidsGroundDao.detailKidsGroundCurrent", kfvo);
	}

	@SuppressWarnings("unchecked")
	public List<KidsGroundFaciltyVO> selectKidsGroundRelief(KidsGroundReliefVO krvo) throws Exception{
		return (List<KidsGroundFaciltyVO>) list("KidsGroundDao.selectKidsGroundRelief", krvo);
	}

	public int selectKidsGroundReliefCnt(KidsGroundReliefVO krvo) throws Exception{
		return (Integer) select("KidsGroundDao.selectKidsGroundReliefCnt", krvo);
	}
	
	public int selectKidsGroundReliefCnt() throws Exception{
		return (Integer) select("KidsGroundDao.selectKidsGroundReliefCnt");
	}

	@SuppressWarnings("unchecked")
	public List<KidsGroundReliefVO> selectKidsGroundReliefExcel(KidsGroundReliefVO krvo) throws Exception{
		return (List<KidsGroundReliefVO>) list("KidsGroundDao.selectKidsGroundReliefExcel", krvo);
	}

	public int deleteFcltyReliefTable() throws Exception{
		return update("KidsGroundDao.deleteFcltyReliefTable");
	}

	public int insertFcltyReliefData(KidsGroundReliefVO detailvo) throws Exception{
		return update("KidsGroundDao.insertFcltyReliefData", detailvo);
	}

	public KidsGroundReliefVO detailKidsGroundRelief(KidsGroundReliefVO krvo) throws Exception{
		return (KidsGroundReliefVO) select("KidsGroundDao.detailKidsGroundRelief", krvo);
	}

	public int selectCheckMaxCount() throws Exception{
		return (Integer) select("KidsGroundDao.selectCheckMaxCount");
	}

	public void insertBackUpFcltyData(int backupCnt) throws Exception{
		update("KidsGroundDao.insertBackUpFcltyData",backupCnt);
	}
	
	public void deleteFcltyBackUp(int backupCnt) throws Exception{
		update("KidsGroundDao.deleteFcltyBackUp",backupCnt);
	}

	public int selectBackUpChkCnt(int backupCnt) throws Exception{
		return (Integer) select("KidsGroundDao.selectBackUpChkCnt", backupCnt);
	}

	public int selectCheckMaxCountReleif() throws Exception{
		return (Integer) select("KidsGroundDao.selectCheckMaxCountReleif");
	}

	public void insertBackUpFcltyReliefData(int backupCnt) throws Exception{
		update("KidsGroundDao.insertBackUpFcltyReliefData",backupCnt);
	}

	public int selectBackUpReliefChkCnt(int backupCnt) throws Exception{
		return (Integer) select("KidsGroundDao.selectBackUpReliefChkCnt", backupCnt);
	}

	public void deleteFcltyReliefBackUp(int backupCnt) {
		update("KidsGroundDao.deleteFcltyReliefBackUp",backupCnt);
		
	}	
}
