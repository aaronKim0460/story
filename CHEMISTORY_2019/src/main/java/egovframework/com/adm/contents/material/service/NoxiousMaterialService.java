package egovframework.com.adm.contents.material.service;

import java.util.List;

import egovframework.com.adm.contents.material.vo.EnviloMentVO;
import egovframework.com.adm.contents.material.vo.NoxiousInfoVO;
import egovframework.com.adm.contents.material.vo.NoxiousMaterialMappingVO;
import egovframework.com.adm.contents.material.vo.NoxiousMaterialVO;

public interface NoxiousMaterialService {

	List<EnviloMentVO> selectEnviloList() throws Exception;

	List<NoxiousMaterialVO> selectNoxMaterialList(NoxiousMaterialVO nVo) throws Exception;

	int selectNoxMaterialListCnt(NoxiousMaterialVO nVo) throws Exception;

	List<NoxiousMaterialMappingVO> selectEnvNotxiousList(NoxiousMaterialMappingVO npVo) throws Exception;

	int selectEnvNotxiousListCnt(NoxiousMaterialMappingVO npVo) throws Exception;

	int existCheckMapping(NoxiousMaterialMappingVO npvo) throws Exception;

	int insertMatMapping(NoxiousMaterialMappingVO npvo) throws Exception;

	int deleteMatMapping(NoxiousMaterialMappingVO npvo) throws Exception;

	List<NoxiousInfoVO> selectNoxiousInfoList(NoxiousInfoVO ivo) throws Exception;

	int selectNoxiousInfoListCnt(NoxiousInfoVO ivo) throws Exception;

	int insertNoxiousInfo(NoxiousInfoVO ivo) throws Exception;

	NoxiousInfoVO detailNoxiousInfo(NoxiousInfoVO ivo) throws Exception;

	int deleteNoxiousInfo(NoxiousInfoVO ivo) throws Exception;

	int updateNoxiousInfo(NoxiousInfoVO ivo) throws Exception;

}
