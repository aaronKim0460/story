package egovframework.com.kor.space.condition.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.kor.space.condition.vo.KidsGroundFaciltyKorVO;
import egovframework.com.kor.space.condition.vo.KidsGroundReliefKorVO;

@Repository("kidsGroundKorDao")
public class KidsGroundKorDao extends EgovComAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<KidsGroundFaciltyKorVO> selectKidsGroundFaciltyKorList(KidsGroundFaciltyKorVO kfvo) throws Exception{
		return (List<KidsGroundFaciltyKorVO>) list("KidsGroundKorDao.selectKidsGroundFaciltyKorList", kfvo);
	}

	public int selectKidsGroundFaciltyKorListCnt(KidsGroundFaciltyKorVO kfvo) throws Exception{
		return (Integer) select("KidsGroundKorDao.selectKidsGroundFaciltyKorListCnt", kfvo);
	}

	public KidsGroundFaciltyKorVO detailKidsGroundCurrent(KidsGroundFaciltyKorVO kfvo) throws Exception{
		return (KidsGroundFaciltyKorVO) select("KidsGroundKorDao.detailKidsGroundCurrent", kfvo);
	}

	@SuppressWarnings("unchecked")
	public List<KidsGroundReliefKorVO> selectKidsGroundReliefKorList(KidsGroundReliefKorVO krvo) throws Exception{
		return (List<KidsGroundReliefKorVO>) list("KidsGroundKorDao.selectKidsGroundReliefKorList", krvo);
	}

	public int selectKidsGroundReliefKorListCnt(KidsGroundReliefKorVO krvo) throws Exception{
		return (Integer) select("KidsGroundKorDao.selectKidsGroundReliefKorListCnt", krvo);
	}

	public KidsGroundReliefKorVO detailKidsGroundReliefKor(KidsGroundReliefKorVO krvo) throws Exception{
		return (KidsGroundReliefKorVO) select("KidsGroundKorDao.detailKidsGroundReliefKor", krvo);
	}

}
