package egovframework.com.adm.contents.noxious.service;

import java.util.List;

import egovframework.com.adm.contents.noxious.vo.EnvilomentNoxiousVO;
import egovframework.com.adm.contents.noxious.vo.SearchEnvNoxious;

public interface EnvilomentNoxiousService {

	List<EnvilomentNoxiousVO> selectEnvNotxiousList(SearchEnvNoxious srchVo) throws Exception;

	int selectEnvilomentNoxiousListCnt(SearchEnvNoxious srchVo) throws Exception;

	int insertEnviloNoxious(EnvilomentNoxiousVO noxVo) throws Exception;

	EnvilomentNoxiousVO selectEnviloNoxDetail(EnvilomentNoxiousVO envo) throws Exception;

	int deleteAdmEnvilomentNoxious(EnvilomentNoxiousVO noxvo) throws Exception;

	int updateAdmEnvilomentNoxious(EnvilomentNoxiousVO noxvo) throws Exception;

	void deleteNoxiousAttachFileId(EnvilomentNoxiousVO deleteVO) throws Exception;

}
