package egovframework.com.adm.contents.noxious.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.adm.contents.noxious.dao.EnvilomentNoxiousDao;
import egovframework.com.adm.contents.noxious.service.EnvilomentNoxiousService;
import egovframework.com.adm.contents.noxious.vo.EnvilomentNoxiousVO;
import egovframework.com.adm.contents.noxious.vo.SearchEnvNoxious;

@Service("envilomentNoxiousService")
public class EnvilomentNoxiousServiceImpl implements EnvilomentNoxiousService {
	
	@Resource(name="envilomentNoxiousDao")
	private EnvilomentNoxiousDao envilomentNoxiousDao;
	
	public List<EnvilomentNoxiousVO> selectEnvNotxiousList(SearchEnvNoxious srchVo) throws Exception {
		return envilomentNoxiousDao.selectEnvNotxiousList(srchVo);
	}

	
	public int selectEnvilomentNoxiousListCnt(SearchEnvNoxious srchVo)throws Exception {
		return envilomentNoxiousDao.selectEnvilomentNoxiousListCnt(srchVo);
	}


	
	public int insertEnviloNoxious(EnvilomentNoxiousVO noxVo) throws Exception {
		return envilomentNoxiousDao.insertEnviloNoxious(noxVo);
	}


	public EnvilomentNoxiousVO selectEnviloNoxDetail(EnvilomentNoxiousVO envo) throws Exception {
		return envilomentNoxiousDao.selectEnviloNoxDetail(envo);
	}


	public int deleteAdmEnvilomentNoxious(EnvilomentNoxiousVO noxvo) throws Exception {
		return envilomentNoxiousDao.deleteAdmEnvilomentNoxious(noxvo);
	}


	public int updateAdmEnvilomentNoxious(EnvilomentNoxiousVO noxvo) throws Exception {
		return envilomentNoxiousDao.updateAdmEnvilomentNoxious(noxvo);
	}

	public void deleteNoxiousAttachFileId(EnvilomentNoxiousVO deleteVO) throws Exception {
		envilomentNoxiousDao.deleteNoxiousAttachFileId(deleteVO);
	}

}
