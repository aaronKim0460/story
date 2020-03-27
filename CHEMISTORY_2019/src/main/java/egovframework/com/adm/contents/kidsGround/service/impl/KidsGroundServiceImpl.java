package egovframework.com.adm.contents.kidsGround.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.adm.contents.kidsGround.dao.KidsGroundDao;
import egovframework.com.adm.contents.kidsGround.service.KidsGroundService;
import egovframework.com.adm.contents.kidsGround.vo.KidsGroundFaciltyVO;
import egovframework.com.adm.contents.kidsGround.vo.KidsGroundReliefVO;

@Service("kidsGroundService")
public class KidsGroundServiceImpl implements KidsGroundService {
	
	@Resource(name="kidsGroundDao")
	private KidsGroundDao kidsGroundDao;

	public List<KidsGroundFaciltyVO> selectKidsGroundFaciltyList(KidsGroundFaciltyVO kfvo) throws Exception {
		return kidsGroundDao.selectKidsGroundFaciltyList(kfvo);
	}

	public int selectKidsGroundFaciltyListCnt(KidsGroundFaciltyVO kfvo) throws Exception {
		return kidsGroundDao.selectKidsGroundFaciltyListCnt(kfvo);
	}

	public List<KidsGroundFaciltyVO> selectKidsGroundFaciltyExcelList(KidsGroundFaciltyVO kfvo) throws Exception {
		return kidsGroundDao.selectKidsGroundFaciltyExcelList(kfvo);
	}

	public String insertFcltyData(List<KidsGroundFaciltyVO> datalist) throws Exception {
		
		int backUpChk = 0;
		int fcltyChk = 0;
		int delChk = 0;
		int insCnt = 0;
		String result = "";
		
		int backupMax = kidsGroundDao.selectCheckMaxCount();
		int backupCnt = backupMax +1 ;
		
		// 엑셀 업로드시 원래 있던 데이터 백업
		kidsGroundDao.insertBackUpFcltyData(backupCnt);
		
		// 백업이 제대로 됬는지 확인, 백업이 제대로 안되었으면 백업데이터 삭제하고 종료, 백업이 제대로 되면 바로 원래 테이블 삭제하고 엑셀 데이터 인서트
		backUpChk = kidsGroundDao.selectBackUpChkCnt(backupCnt);
		fcltyChk = kidsGroundDao.selectKidsGroundFaciltyListCnt();
		
		if(backUpChk == fcltyChk){
			delChk = kidsGroundDao.deleteFcltyTable();
			
			if(delChk>0){
				for(int i=0; i<datalist.size(); i++){
					KidsGroundFaciltyVO detailvo = datalist.get(i);
					insCnt += kidsGroundDao.insertFcltyData(detailvo);
				}
				
				if(insCnt == datalist.size()){
					result = "success";
				}
			}
		}else{
			kidsGroundDao.deleteFcltyBackUp(backupCnt);
			result = "backupFail";
		}
		
		//System.out.println("insCnt =====> " + insCnt);
		
		//System.out.println("리절트 ==> " + result);
		
		return result;
	}

	public KidsGroundFaciltyVO detailKidsGroundCurrent(KidsGroundFaciltyVO kfvo) throws Exception {
		return kidsGroundDao.detailKidsGroundCurrent(kfvo);
	}

	public List<KidsGroundFaciltyVO> selectKidsGroundRelief(KidsGroundReliefVO krvo) throws Exception {
		return kidsGroundDao.selectKidsGroundRelief(krvo);
	}

	public int selectKidsGroundReliefCnt(KidsGroundReliefVO krvo) throws Exception {
		return kidsGroundDao.selectKidsGroundReliefCnt(krvo);
	}

	public List<KidsGroundReliefVO> selectKidsGroundReliefExcel(KidsGroundReliefVO krvo) throws Exception {
		return kidsGroundDao.selectKidsGroundReliefExcel(krvo);
	}

	public String insertFcltyReliefData(List<KidsGroundReliefVO> datalist) throws Exception {
		
		int backUpChk = 0;
		int fcltyChk = 0;
		int delChk = 0;
		int insCnt = 0;
		String result = "";
		
		int backupMax = kidsGroundDao.selectCheckMaxCountReleif();
		int backupCnt = backupMax +1 ;
		
		// 엑셀 업로드시 원래 있던 데이터 백업
		kidsGroundDao.insertBackUpFcltyReliefData(backupCnt);
		
		// 백업이 제대로 됬는지 확인, 백업이 제대로 안되었으면 백업데이터 삭제하고 종료, 백업이 제대로 되면 바로 원래 테이블 삭제하고 엑셀 데이터 인서트
		backUpChk = kidsGroundDao.selectBackUpReliefChkCnt(backupCnt);
		fcltyChk = kidsGroundDao.selectKidsGroundReliefCnt();
		
		if(backUpChk == fcltyChk){
			delChk = kidsGroundDao.deleteFcltyReliefTable();
			
			if(delChk>0){
				for(int i=0; i<datalist.size(); i++){
					KidsGroundReliefVO detailvo = datalist.get(i);
					insCnt += kidsGroundDao.insertFcltyReliefData(detailvo);
				}
				
				if(insCnt == datalist.size()){
					result = "success";
				}
			}
		}else{
			kidsGroundDao.deleteFcltyReliefBackUp(backupCnt);
			result = "backupFail";
		}
		
		//System.out.println("insCnt =====> " + insCnt);
		
		//System.out.println("리절트 ==> " + result);
		
		return result;
	}

	public KidsGroundReliefVO detailKidsGroundRelief(KidsGroundReliefVO krvo) throws Exception {
		return kidsGroundDao.detailKidsGroundRelief(krvo);
	}

}
