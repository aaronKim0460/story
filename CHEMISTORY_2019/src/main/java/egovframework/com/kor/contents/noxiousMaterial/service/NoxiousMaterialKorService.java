package egovframework.com.kor.contents.noxiousMaterial.service;

import java.util.List;

import egovframework.com.kor.contents.noxiousMaterial.vo.NoxiouMaterialBbsVO;
import egovframework.com.kor.contents.noxiousMaterial.vo.NoxiousEnvilomentVO;
import egovframework.com.kor.contents.noxiousMaterial.vo.NoxiousInfoKorVO;
import egovframework.com.kor.contents.noxiousMaterial.vo.NoxiousMaterialKorMapVO;
import egovframework.com.kor.contents.noxiousMaterial.vo.NoxiousMaterialKorVO;

public interface NoxiousMaterialKorService {

	List<NoxiousMaterialKorVO> selectNoxiousMaterialKorList(NoxiousMaterialKorVO nvo) throws Exception;

	int selectNoxiousMaterialKorListCnt(NoxiousMaterialKorVO nvo) throws Exception;

	NoxiousMaterialKorMapVO selectNoxiousMaterialMapKorList() throws Exception;

	List<NoxiousMaterialKorVO> selectNoxiousMaterialMapKorListData(NoxiousMaterialKorVO nkvo) throws Exception;

	NoxiousMaterialKorVO detailNoxiousMaterialKor(NoxiousMaterialKorVO nvo) throws Exception;

	List<NoxiousEnvilomentVO> selectNoxiousEnviloMentKorList() throws Exception;

	List<NoxiousEnvilomentVO> selectNoxiousEnviloMentKorListData(NoxiousEnvilomentVO evo) throws Exception;
	
	int selectNoxiousEnviloMentKorListDataCnt(NoxiousEnvilomentVO evo) throws Exception;

	List<NoxiousInfoKorVO> selectNoxiousInfoList(NoxiousInfoKorVO ivo) throws Exception;

	int selectNoxiousInfoListCnt(NoxiousInfoKorVO ivo) throws Exception;

	NoxiousInfoKorVO detailNoxiousKorInfo(NoxiousInfoKorVO ivo) throws Exception;

	String selectNttid(NoxiouMaterialBbsVO bbsvo) throws Exception;

}
