package egovframework.com.kids.common.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import egovframework.com.kids.common.vo.GreenProductVo;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface GreenProductService {
	List selectProductList(GreenProductVo gvo) throws Exception;

	int selectProductListCnt(GreenProductVo gvo) throws Exception;
	
	List selectMiddleCategoryList(GreenProductVo gvo) throws Exception;
}
