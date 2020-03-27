package egovframework.com.adm.contents.material.vo;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

public class NoxiousMaterialVO extends ComDefaultVO {
	private static final long serialVersionUID = 1L;
	
	private String envId;
	private String envName;
	private String matId;
	private String matName;
	private List<NoxiousMaterialMappingVO> mappingList;
	
	public String getEnvId() {
		return envId;
	}
	public void setEnvId(String envId) {
		this.envId = envId;
	}
	public String getEnvName() {
		return envName;
	}
	public void setEnvName(String envName) {
		this.envName = envName;
	}
	public String getMatId() {
		return matId;
	}
	public void setMatId(String matId) {
		this.matId = matId;
	}
	public String getMatName() {
		return matName;
	}
	public void setMatName(String matName) {
		this.matName = matName;
	}
	public List<NoxiousMaterialMappingVO> getMappingList() {
		return mappingList;
	}
	public void setMappingList(List<NoxiousMaterialMappingVO> mappingList) {
		this.mappingList = mappingList;
	}
}
