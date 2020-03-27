package egovframework.com.adm.contents.material.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.adm.contents.material.service.NoxiousMaterialService;
import egovframework.com.adm.contents.material.service.dao.NoxiousMaterialDao;
import egovframework.com.adm.contents.material.vo.EnviloMentVO;
import egovframework.com.adm.contents.material.vo.NoxiousInfoVO;
import egovframework.com.adm.contents.material.vo.NoxiousMaterialMappingVO;
import egovframework.com.adm.contents.material.vo.NoxiousMaterialVO;

@Service("noxiousMaterialService")
public class NoxiousMaterialServiceImpl implements NoxiousMaterialService {
	
	@Resource(name="noxiousMaterialDao")
	private NoxiousMaterialDao noxiousMaterialDao;

	public List<EnviloMentVO> selectEnviloList() throws Exception {
		return noxiousMaterialDao.selectEnviloList();
	}

	public List<NoxiousMaterialVO> selectNoxMaterialList(NoxiousMaterialVO nVo) throws Exception {
		return noxiousMaterialDao.selectNoxMaterialList(nVo);
	}

	public int selectNoxMaterialListCnt(NoxiousMaterialVO nVo) throws Exception {
		return noxiousMaterialDao.selectNoxMaterialListCnt(nVo);
	}

	public List<NoxiousMaterialMappingVO> selectEnvNotxiousList(NoxiousMaterialMappingVO npVo) throws Exception {
		return noxiousMaterialDao.selectEnvNotxiousList(npVo);
	}

	public int selectEnvNotxiousListCnt(NoxiousMaterialMappingVO npVo) throws Exception {
		return noxiousMaterialDao.selectEnvNotxiousListCnt(npVo);
	}

	public int existCheckMapping(NoxiousMaterialMappingVO npvo) throws Exception {
		return noxiousMaterialDao.existCheckMapping(npvo);
	}

	public int insertMatMapping(NoxiousMaterialMappingVO npvo) throws Exception {
		return noxiousMaterialDao.insertMatMapping(npvo);
	}

	public int deleteMatMapping(NoxiousMaterialMappingVO npvo) throws Exception {
		return noxiousMaterialDao.deleteMatMapping(npvo);
	}

	public List<NoxiousInfoVO> selectNoxiousInfoList(NoxiousInfoVO ivo) throws Exception {
		return noxiousMaterialDao.selectNoxiousInfoList(ivo);
	}

	public int selectNoxiousInfoListCnt(NoxiousInfoVO ivo) throws Exception {
		return noxiousMaterialDao.selectNoxiousInfoListCnt(ivo);
	}

	public int insertNoxiousInfo(NoxiousInfoVO ivo) throws Exception {
		return noxiousMaterialDao.insertNoxiousInfo(ivo);
	}

	public NoxiousInfoVO detailNoxiousInfo(NoxiousInfoVO ivo) throws Exception {
		return noxiousMaterialDao.detailNoxiousInfo(ivo);
	}

	public int deleteNoxiousInfo(NoxiousInfoVO ivo) throws Exception {
		return noxiousMaterialDao.deleteNoxiousInfo(ivo);
	}

	public int updateNoxiousInfo(NoxiousInfoVO ivo) throws Exception {
		return noxiousMaterialDao.updateNoxiousInfo(ivo);
	}
}
