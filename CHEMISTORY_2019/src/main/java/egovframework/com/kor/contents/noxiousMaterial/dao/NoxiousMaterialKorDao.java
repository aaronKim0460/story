package egovframework.com.kor.contents.noxiousMaterial.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.kor.contents.noxiousMaterial.vo.NoxiouMaterialBbsVO;
import egovframework.com.kor.contents.noxiousMaterial.vo.NoxiousEnvilomentVO;
import egovframework.com.kor.contents.noxiousMaterial.vo.NoxiousInfoKorVO;
import egovframework.com.kor.contents.noxiousMaterial.vo.NoxiousMaterialKorMapVO;
import egovframework.com.kor.contents.noxiousMaterial.vo.NoxiousMaterialKorVO;

@Repository("noxiousMaterialKorDao")
public class NoxiousMaterialKorDao extends EgovComAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<NoxiousMaterialKorVO> selectNoxiousMaterialKorList(NoxiousMaterialKorVO nvo) throws Exception{
		return (List<NoxiousMaterialKorVO>) list("NoxiousMaterialKorDao.selectNoxiousMaterialKorList", nvo);
	}

	public int selectNoxiousMaterialKorListCnt(NoxiousMaterialKorVO nvo) throws Exception{
		return (Integer) select("NoxiousMaterialKorDao.selectNoxiousMaterialKorListCnt", nvo);
	}

	public NoxiousMaterialKorMapVO selectNoxiousMaterialMapKorList() throws Exception{
		return (NoxiousMaterialKorMapVO) select("NoxiousMaterialKorDao.selectNoxiousMaterialMapKorList");
	}

	@SuppressWarnings("unchecked")
	public List<NoxiousMaterialKorVO> selectNoxiousMaterialMapKorListData(NoxiousMaterialKorVO nkvo) throws Exception{
		return (List<NoxiousMaterialKorVO>) list("NoxiousMaterialKorDao.selectNoxiousMaterialMapKorListData", nkvo);
	}

	public NoxiousMaterialKorVO detailNoxiousMaterialKor(NoxiousMaterialKorVO nvo) throws Exception{
		return (NoxiousMaterialKorVO) select("NoxiousMaterialKorDao.detailNoxiousMaterialKor", nvo);
	}

	@SuppressWarnings("unchecked")
	public List<NoxiousEnvilomentVO> selectNoxiousEnviloMentKorList() throws Exception{
		return (List<NoxiousEnvilomentVO>) list("NoxiousMaterialKorDao.selectNoxiousEnviloMentKorList");
	}

	@SuppressWarnings("unchecked")
	public List<NoxiousEnvilomentVO> selectNoxiousEnviloMentKorListData(NoxiousEnvilomentVO evo) throws Exception{
		return (List<NoxiousEnvilomentVO>) list("NoxiousMaterialKorDao.selectNoxiousEnviloMentKorListData", evo);
	}
	
	public int selectNoxiousEnviloMentKorListDataCnt(NoxiousEnvilomentVO evo) throws Exception{
		return (Integer) select("NoxiousMaterialKorDao.selectNoxiousEnviloMentKorListDataCnt", evo);
	}

	@SuppressWarnings("unchecked")
	public List<NoxiousInfoKorVO> selectNoxiousInfoList(NoxiousInfoKorVO ivo) throws Exception{
		return (List<NoxiousInfoKorVO>) list("NoxiousMaterialKorDao.selectNoxiousInfoList", ivo);
	}

	public int selectNoxiousInfoListCnt(NoxiousInfoKorVO ivo) throws Exception{
		return (Integer) select("NoxiousMaterialKorDao.selectNoxiousInfoListCnt", ivo);
	}

	public NoxiousInfoKorVO detailNoxiousKorInfo(NoxiousInfoKorVO ivo) throws Exception{
		return (NoxiousInfoKorVO) select("NoxiousMaterialKorDao.detailNoxiousKorInfo", ivo);
	}

	public String selectNttid(NoxiouMaterialBbsVO bbsvo) throws Exception{
		return (String) select("NoxiousMaterialKorDao.selectNttid", bbsvo);
	}

}
