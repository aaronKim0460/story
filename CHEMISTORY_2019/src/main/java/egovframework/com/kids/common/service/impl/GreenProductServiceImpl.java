package egovframework.com.kids.common.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.kids.common.dao.GreenProductDAO;
import egovframework.com.kids.common.service.GreenProductService;
import egovframework.com.kids.common.vo.GreenProductVo;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("greenProductService")
public class GreenProductServiceImpl implements GreenProductService {
	@Resource(name="greenProductDao")
	private GreenProductDAO greenDao;
	
	@Override
	public List selectProductList(GreenProductVo gvo) throws Exception {
		return greenDao.selectProductList(gvo);
	}

	@Override
	public int selectProductListCnt(GreenProductVo gvo) throws Exception {
		return greenDao.selectProductListCnt(gvo);
	}

	@Override
	public List selectMiddleCategoryList(GreenProductVo gvo) throws Exception {
		return greenDao.selectMiddleCategoryList(gvo);
	}

}
