package egovframework.com.adm.contents.material.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.adm.contents.material.vo.EnviloMentVO;
import egovframework.com.adm.contents.material.vo.NoxiousInfoVO;
import egovframework.com.adm.contents.material.vo.NoxiousMaterialMappingVO;
import egovframework.com.adm.contents.material.vo.NoxiousMaterialVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("noxiousMaterialDao")
public class NoxiousMaterialDao extends EgovComAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<EnviloMentVO> selectEnviloList() throws Exception{
		return (List<EnviloMentVO>) list("NoxiousMaterialDao.selectEnviloList");
	}

	@SuppressWarnings("unchecked")
	public List<NoxiousMaterialVO> selectNoxMaterialList(NoxiousMaterialVO nVo) throws Exception{
		return (List<NoxiousMaterialVO>) list("NoxiousMaterialDao.selectNoxMaterialList", nVo);
	}

	public int selectNoxMaterialListCnt(NoxiousMaterialVO nVo) throws Exception{
		return (Integer) select("NoxiousMaterialDao.selectNoxMaterialListCnt", nVo);
	}

	@SuppressWarnings("unchecked")
	public List<NoxiousMaterialMappingVO> selectEnvNotxiousList(NoxiousMaterialMappingVO npVo) throws Exception{
		return (List<NoxiousMaterialMappingVO>) list("NoxiousMaterialDao.selectNoxMaterialForMappingList", npVo);
	}

	public int selectEnvNotxiousListCnt(NoxiousMaterialMappingVO npVo) throws Exception{
		return (Integer) select("NoxiousMaterialDao.selectNoxMaterialForMappingListCnt", npVo);
	}

	public int existCheckMapping(NoxiousMaterialMappingVO npvo) throws Exception{
		return (Integer) select("NoxiousMaterialDao.existCheckMapping", npvo);
	}

	public int insertMatMapping(NoxiousMaterialMappingVO npvo) throws Exception{
		return update("NoxiousMaterialDao.insertMatMapping", npvo);
	}

	public int deleteMatMapping(NoxiousMaterialMappingVO npvo) throws Exception{
		return update("NoxiousMaterialDao.deleteMatMapping", npvo);
	}

	@SuppressWarnings("unchecked")
	public List<NoxiousInfoVO> selectNoxiousInfoList(NoxiousInfoVO ivo) throws Exception{
		return (List<NoxiousInfoVO>) list("NoxiousInfoDao.selectNoxiousInfoList", ivo);
	}

	public int selectNoxiousInfoListCnt(NoxiousInfoVO ivo) throws Exception{
		return (Integer) select("NoxiousInfoDao.selectNoxiousInfoListCnt", ivo); 
	}

	public int insertNoxiousInfo(NoxiousInfoVO ivo) throws Exception{
		return update("NoxiousInfoDao.insertNoxiousInfo", ivo);
	}

	public NoxiousInfoVO detailNoxiousInfo(NoxiousInfoVO ivo) throws Exception{
		return (NoxiousInfoVO) select("NoxiousInfoDao.detailNoxiousInfo", ivo);
	}

	public int deleteNoxiousInfo(NoxiousInfoVO ivo) throws Exception{
		return update("NoxiousMaterialDao.deleteNoxiousInfo", ivo);
	}

	public int updateNoxiousInfo(NoxiousInfoVO ivo) throws Exception{
		return update("NoxiousMaterialDao.updateNoxiousInfo", ivo);
	}
	
}
