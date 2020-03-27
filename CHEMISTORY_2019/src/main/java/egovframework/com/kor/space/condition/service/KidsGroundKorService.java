package egovframework.com.kor.space.condition.service;

import java.util.List;

import egovframework.com.adm.contents.kidsGround.vo.KidsGroundFaciltyVO;
import egovframework.com.kor.space.condition.vo.KidsGroundFaciltyKorVO;
import egovframework.com.kor.space.condition.vo.KidsGroundReliefKorVO;

public interface KidsGroundKorService {

	List<KidsGroundFaciltyKorVO> selectKidsGroundFaciltyKorList(KidsGroundFaciltyKorVO kfvo) throws Exception;

	int selectKidsGroundFaciltyKorListCnt(KidsGroundFaciltyKorVO kfvo) throws Exception;

	KidsGroundFaciltyKorVO detailKidsGroundCurrent(KidsGroundFaciltyKorVO kfvo) throws Exception;

	List<KidsGroundReliefKorVO> selectKidsGroundReliefKorList(KidsGroundReliefKorVO krvo) throws Exception;

	int selectKidsGroundReliefKorListCnt(KidsGroundReliefKorVO krvo) throws Exception;

	KidsGroundReliefKorVO detailKidsGroundReliefKor(KidsGroundReliefKorVO krvo) throws Exception; 

}
