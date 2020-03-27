package egovframework.com.cop.api.service;

import java.util.List;

public interface EgovScheduleService {

	public int selectReverseCnt(EgovScheduleVO searchVO) throws Exception;
	
	public List selectDiarySechdule(EgovScheduleVO searchVO) throws Exception;
	
	public boolean insertSchdulList(EgovScheduleVO searchVO) throws Exception;
	
	public EgovScheduleVO selectSchedule(EgovScheduleVO searchVO) throws Exception;
	
	public void updateSchdul(EgovScheduleVO searchVO) throws Exception;
	
	public void deleteSchedule(EgovScheduleVO searchVO) throws Exception;
}
