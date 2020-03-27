package egovframework.com.adm.contents.kidsGround.service;

import java.util.List;

import egovframework.com.adm.contents.kidsGround.vo.KidsGroundFaciltyVO;
import egovframework.com.adm.contents.kidsGround.vo.KidsGroundReliefVO;

public interface KidsGroundService {

	List<KidsGroundFaciltyVO> selectKidsGroundFaciltyList(KidsGroundFaciltyVO kfvo) throws Exception;

	int selectKidsGroundFaciltyListCnt(KidsGroundFaciltyVO kfvo) throws Exception;

	List<KidsGroundFaciltyVO> selectKidsGroundFaciltyExcelList(KidsGroundFaciltyVO kfvo) throws Exception;

	String insertFcltyData(List<KidsGroundFaciltyVO> datalist) throws Exception;

	KidsGroundFaciltyVO detailKidsGroundCurrent(KidsGroundFaciltyVO kfvo) throws Exception;

	List<KidsGroundFaciltyVO> selectKidsGroundRelief(KidsGroundReliefVO krvo) throws Exception;

	int selectKidsGroundReliefCnt(KidsGroundReliefVO krvo) throws Exception;

	List<KidsGroundReliefVO> selectKidsGroundReliefExcel(KidsGroundReliefVO krvo) throws Exception;

	String insertFcltyReliefData(List<KidsGroundReliefVO> datalist) throws Exception;

	KidsGroundReliefVO detailKidsGroundRelief(KidsGroundReliefVO krvo) throws Exception;

}
