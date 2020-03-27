/**
 * @Name : CalenderServiceImpl.java
 * @Description : 달력 serviceImpl.
 * @author 이한구
 * @since 2016. 11. 22.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 11. 22.	이한구. 최초 생성.
 */
package egovframework.com.kids.calender.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.kids.calender.DAO.CalenderDAO;
import egovframework.com.kids.calender.service.CalenderService;
import egovframework.com.kids.calender.vo.CalenderVO;

@Service("calenderService")
public class CalenderServiceImpl implements CalenderService {

	@Resource(name = "calenderDAO")
	private CalenderDAO calenderDAO;

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.calender.service.CalenderService#selectCalenderList(egovframework.com.kids.calender.vo.CalenderVO)
	 */
	@Override
	public List<CalenderVO> selectCalenderList(CalenderVO vo) throws Exception {
		return calenderDAO.selectCalenderList(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.calender.service.CalenderService#selectCalenderCount(egovframework.com.kids.calender.vo.CalenderVO)
	 */
	@Override
	public int selectCalenderCount(CalenderVO vo) throws Exception {
		return calenderDAO.selectCalenderCount(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.calender.service.CalenderService#selectCalenderViewList(egovframework.com.kids.calender.vo.CalenderVO)
	 */
	@Override
	public List<CalenderVO> selectCalenderViewList(CalenderVO vo) throws Exception {
		return calenderDAO.selectCalenderViewList(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.calender.service.CalenderService#selectCalender(egovframework.com.kids.calender.vo.CalenderVO)
	 */
	@Override
	public CalenderVO selectCalender(CalenderVO vo) throws Exception {
		return calenderDAO.selectCalender(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.calender.service.CalenderService#insertCalender(egovframework.com.kids.calender.vo.CalenderVO)
	 */
	@Override
	public void insertCalender(CalenderVO vo) throws Exception {
		calenderDAO.insertCalender(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.calender.service.CalenderService#updateCalender(egovframework.com.kids.calender.vo.CalenderVO)
	 */
	@Override
	public void updateCalender(CalenderVO vo) throws Exception {
		calenderDAO.updateCalender(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.calender.service.CalenderService#deleteCalender(egovframework.com.kids.calender.vo.CalenderVO)
	 */
	@Override
	public void deleteCalender(CalenderVO vo) throws Exception {
		calenderDAO.deleteCalender(vo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.kids.calender.service.CalenderService#selectCalenderViewList(egovframework.com.kids.calender.vo.CalenderVO)
	 */
	@Override
	public List<CalenderVO> selectCalenderUserList(CalenderVO vo) throws Exception {
		return calenderDAO.selectCalenderUserList(vo);
	}
}
