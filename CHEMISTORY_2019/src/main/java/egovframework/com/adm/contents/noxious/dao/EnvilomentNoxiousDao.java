package egovframework.com.adm.contents.noxious.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.adm.contents.noxious.vo.EnvilomentNoxiousVO;
import egovframework.com.adm.contents.noxious.vo.SearchEnvNoxious;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("envilomentNoxiousDao")
public class EnvilomentNoxiousDao extends EgovComAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<EnvilomentNoxiousVO> selectEnvNotxiousList(SearchEnvNoxious srchVo) throws Exception{		
		return (List<EnvilomentNoxiousVO>) list("EnvilomentNoxiousDao.selectEnvNotxiousList", srchVo);
	}

	public int selectEnvilomentNoxiousListCnt(SearchEnvNoxious srchVo) throws Exception {
		return (Integer) select("EnvilomentNoxiousDao.selectEnvilomentNoxiousListCnt", srchVo);
	}

	public int insertEnviloNoxious(EnvilomentNoxiousVO noxVo) throws Exception {
		return update("EnvilomentNoxiousDao.insertEnviloNoxious", noxVo);
	}

	public EnvilomentNoxiousVO selectEnviloNoxDetail(EnvilomentNoxiousVO envo) throws Exception {
		return (EnvilomentNoxiousVO) select("EnvilomentNoxiousDao.selectEnviloNoxDetail", envo);
	}

	public int deleteAdmEnvilomentNoxious(EnvilomentNoxiousVO noxvo) throws Exception {
		return update("EnvilomentNoxiousDao.deleteAdmEnvilomentNoxious", noxvo);
	}

	public int updateAdmEnvilomentNoxious(EnvilomentNoxiousVO noxvo) throws Exception {
		return update("EnvilomentNoxiousDao.updateAdmEnvilomentNoxious", noxvo);
	}

	public void deleteNoxiousAttachFileId(EnvilomentNoxiousVO deleteVO) throws Exception {
		update("EnvilomentNoxiousDao.deleteNoxiousAttachFileId", deleteVO);
	}

}
