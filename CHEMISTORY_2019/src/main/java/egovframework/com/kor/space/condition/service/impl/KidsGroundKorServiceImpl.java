package egovframework.com.kor.space.condition.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.adm.contents.kidsGround.vo.KidsGroundFaciltyVO;
import egovframework.com.kor.space.condition.dao.KidsGroundKorDao;
import egovframework.com.kor.space.condition.service.KidsGroundKorService;
import egovframework.com.kor.space.condition.vo.KidsGroundFaciltyKorVO;
import egovframework.com.kor.space.condition.vo.KidsGroundReliefKorVO;

@Service("kidsGroundKorService")
public class KidsGroundKorServiceImpl implements KidsGroundKorService {
	
	@Resource(name="kidsGroundKorDao")
	private KidsGroundKorDao kidsGroundKorDao;

	public List<KidsGroundFaciltyKorVO> selectKidsGroundFaciltyKorList(KidsGroundFaciltyKorVO kfvo) throws Exception {
		return kidsGroundKorDao.selectKidsGroundFaciltyKorList(kfvo);
	}

	public int selectKidsGroundFaciltyKorListCnt(KidsGroundFaciltyKorVO kfvo)throws Exception {
		return kidsGroundKorDao.selectKidsGroundFaciltyKorListCnt(kfvo);
	}

	public KidsGroundFaciltyKorVO detailKidsGroundCurrent(KidsGroundFaciltyKorVO kfvo) throws Exception {
		return kidsGroundKorDao.detailKidsGroundCurrent(kfvo);
	}

	public List<KidsGroundReliefKorVO> selectKidsGroundReliefKorList(KidsGroundReliefKorVO krvo) throws Exception {
		return kidsGroundKorDao.selectKidsGroundReliefKorList(krvo);
	}

	public int selectKidsGroundReliefKorListCnt(KidsGroundReliefKorVO krvo) throws Exception {
		return kidsGroundKorDao.selectKidsGroundReliefKorListCnt(krvo);
	}

	public KidsGroundReliefKorVO detailKidsGroundReliefKor(KidsGroundReliefKorVO krvo) throws Exception {
		return kidsGroundKorDao.detailKidsGroundReliefKor(krvo);
	}
	
}
