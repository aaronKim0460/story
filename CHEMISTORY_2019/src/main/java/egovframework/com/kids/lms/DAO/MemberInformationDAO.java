/**
 * @Name : MemberInformationDAO.java
 * @Description : 회원정보 DAO.
 * @author 이한구
 * @since 2016. 12. 1.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 12. 1.	이한구. 최초 생성.
 */
package egovframework.com.kids.lms.DAO;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.kids.lms.vo.MemberInformationVO;

@Repository("memberInformationDAO")
public class MemberInformationDAO extends EgovComAbstractDAO {

	/**
	 * 이메일로 회원정보 가져오기
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MemberInformationVO selectMemberInformationByEmail(MemberInformationVO vo) throws Exception {
		return (MemberInformationVO) select("MemberInformationDAO.selectMemberInformationByEmail", vo);
	}

	/**
	 * 회원 정보 저장
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void insertMemberInformation(MemberInformationVO vo) throws Exception {
		insert("MemberInformationDAO.insertMemberInformation", vo);
	}

}
