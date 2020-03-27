package egovframework.com.kor.contents.noxiousMaterial.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.kor.contents.noxiousMaterial.dao.NoxiousMaterialKorDao;
import egovframework.com.kor.contents.noxiousMaterial.service.NoxiousMaterialKorService;
import egovframework.com.kor.contents.noxiousMaterial.vo.NoxiouMaterialBbsVO;
import egovframework.com.kor.contents.noxiousMaterial.vo.NoxiousEnvilomentVO;
import egovframework.com.kor.contents.noxiousMaterial.vo.NoxiousInfoKorVO;
import egovframework.com.kor.contents.noxiousMaterial.vo.NoxiousMaterialKorMapVO;
import egovframework.com.kor.contents.noxiousMaterial.vo.NoxiousMaterialKorVO;


@Service("noxiousMaterialKorService")
public class NoxiousMaterialKorServiceImpl implements NoxiousMaterialKorService{
	
	@Resource(name="noxiousMaterialKorDao")
	private NoxiousMaterialKorDao noxiousMaterialKorDao;

	public List<NoxiousMaterialKorVO> selectNoxiousMaterialKorList(NoxiousMaterialKorVO nvo) throws Exception {
		return  noxiousMaterialKorDao.selectNoxiousMaterialKorList(nvo);
	}

	public int selectNoxiousMaterialKorListCnt(NoxiousMaterialKorVO nvo) throws Exception {
		return  noxiousMaterialKorDao.selectNoxiousMaterialKorListCnt(nvo);
	}

	public NoxiousMaterialKorMapVO selectNoxiousMaterialMapKorList() throws Exception {
		return  noxiousMaterialKorDao.selectNoxiousMaterialMapKorList();
	}

	public List<NoxiousMaterialKorVO> selectNoxiousMaterialMapKorListData(NoxiousMaterialKorVO nkvo) throws Exception {
		return  noxiousMaterialKorDao.selectNoxiousMaterialMapKorListData(nkvo);
	}

	public NoxiousMaterialKorVO detailNoxiousMaterialKor(NoxiousMaterialKorVO nvo) throws Exception {
		return noxiousMaterialKorDao.detailNoxiousMaterialKor(nvo);
	}

	public List<NoxiousEnvilomentVO> selectNoxiousEnviloMentKorList() throws Exception {
		return noxiousMaterialKorDao.selectNoxiousEnviloMentKorList();
	}

	public List<NoxiousEnvilomentVO> selectNoxiousEnviloMentKorListData(NoxiousEnvilomentVO evo) throws Exception {
		return noxiousMaterialKorDao.selectNoxiousEnviloMentKorListData(evo);
	}

	public List<NoxiousInfoKorVO> selectNoxiousInfoList(NoxiousInfoKorVO ivo) throws Exception {
		return noxiousMaterialKorDao.selectNoxiousInfoList(ivo);
	}

	public int selectNoxiousInfoListCnt(NoxiousInfoKorVO ivo) throws Exception {
		return noxiousMaterialKorDao.selectNoxiousInfoListCnt(ivo);
	}

	public NoxiousInfoKorVO detailNoxiousKorInfo(NoxiousInfoKorVO ivo)throws Exception {
		return noxiousMaterialKorDao.detailNoxiousKorInfo(ivo);
	}

	public String selectNttid(NoxiouMaterialBbsVO bbsvo) throws Exception {
		return noxiousMaterialKorDao.selectNttid(bbsvo);
	}

	@Override
	public int selectNoxiousEnviloMentKorListDataCnt(NoxiousEnvilomentVO evo) throws Exception {
		return noxiousMaterialKorDao.selectNoxiousEnviloMentKorListDataCnt(evo);
	}

}
