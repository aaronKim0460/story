package egovframework.com.kids.common.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.kids.common.vo.GreenProductVo;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("greenProductDao")
public class GreenProductDAO extends EgovComAbstractDAO {
	public List selectProductList(GreenProductVo gvo) throws Exception{
		return (List<GreenProductVo>) list("greenProductDao.selectProductList", gvo);
	}

	public int selectProductListCnt(GreenProductVo gvo) {
		return (Integer) select("greenProductDao.selectProductListCnt", gvo);
	}
	
	public List selectMiddleCategoryList(GreenProductVo gvo) throws Exception{
		return (List<GreenProductVo>) list("greenProductDao.selectMiddleCategoryList", gvo);
	}
}
