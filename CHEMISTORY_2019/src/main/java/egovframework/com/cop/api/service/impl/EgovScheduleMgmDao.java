package egovframework.com.cop.api.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.cop.api.service.EgovScheduleVO;

@Repository("EgovScheduleMgmDao")
public class EgovScheduleMgmDao extends EgovComAbstractDAO {

	@SuppressWarnings("unchecked")
	public int selectReverseCnt(EgovScheduleVO searchVO) throws Exception{
		return (Integer)getSqlMapClientTemplate().queryForObject("DiaryManage.selectReverseCnt", searchVO);
	}
	
	public List<CmmnDetailCode>  selectDiarySechdule(EgovScheduleVO searchVO) throws Exception{
		return (List<CmmnDetailCode>) list("DiaryManage.selectDiarySechdule", searchVO);
	}
	
	public void insertNierSchdulList(EgovScheduleVO searchVO){
		insert("DiaryManage.insertNierSchdulList", searchVO);
	}
	
	public EgovScheduleVO selectNierSchedule(EgovScheduleVO searchVO) throws Exception {
    	
		return (EgovScheduleVO)selectByPk("DiaryManage.selectNierSchedule", searchVO);
	
    }
	
	public void updateNierSchdul(EgovScheduleVO searchVO) throws Exception {
		update("DiaryManage.updateNierSchdul", searchVO);
    }
	
	public void deleteNierSchedule(EgovScheduleVO searchVO) throws Exception {
		update("DiaryManage.deleteNierSchedule", searchVO);
    }
}
