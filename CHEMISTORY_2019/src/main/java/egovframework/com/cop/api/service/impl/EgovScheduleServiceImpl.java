package egovframework.com.cop.api.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cop.api.service.EgovScheduleService;
import egovframework.com.cop.api.service.EgovScheduleVO;
import egovframework.com.cop.bbs.service.Board;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service("EgovScheduleService")
public class EgovScheduleServiceImpl extends AbstractServiceImpl implements EgovScheduleService {

	@Resource(name="EgovScheduleMgmDao")
	private EgovScheduleMgmDao dao;
	
	public int selectReverseCnt(EgovScheduleVO searchVO) throws Exception{
		return (Integer)dao.selectReverseCnt(searchVO);
	}
	
	public List selectDiarySechdule(EgovScheduleVO searchVO) throws Exception{
		return (List)dao.selectDiarySechdule(searchVO);
	}
	
	public boolean insertSchdulList(EgovScheduleVO searchVO) throws Exception {
		dao.insertNierSchdulList(searchVO);
    	return true;
	}
	
	public EgovScheduleVO selectSchedule(EgovScheduleVO searchVO) throws Exception {
		return dao.selectNierSchedule(searchVO);
	}
	
	public void updateSchdul(EgovScheduleVO searchVO) throws Exception {
		dao.updateNierSchdul(searchVO);
    }
	
	public void deleteSchedule(EgovScheduleVO searchVO) throws Exception {

		dao.deleteNierSchedule(searchVO);

    }
}
