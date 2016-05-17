package egovframework.com.sym.mnu.mpm.service;

import java.util.ArrayList;
import java.util.List;

/** 
 * 메뉴목록관리 처리를 위한 VO 클래스를 정의한다
 * @author 개발환경 개발팀 이용
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.20  이  용          최초 생성
 *   2016.05.11  김성천         트리구성을 위한 리스트, 레벨변수, 프로그램 URL 변수추가
 * </pre>
 */

public class MenuManageVO{

   /** 메뉴정보 */
   /** 메뉴번호 */
   private   int      menuNo;
   /** 메뉴순서 */
   private   int      menuOrdr;
   /** 메뉴명 */
   private   String   menuNm;
   /** 상위메뉴번호 */
   private   int      upperMenuId;
   /** 메뉴설명 */
   private   String   menuDc;
   /** 관련이미지경로 */
   private   String   relateImagePath;
   /** 관련이미지명 */
   private   String   relateImageNm;
   /** 프로그램파일명 */
   private   String   progrmFileNm;

   /** 사이트맵 */
   /** 생성자ID **/
   private   String   creatPersonId;

   /** 권한정보설정 */
   /** 권한코드 */
   private   String   authorCode;

   /** 기타VO변수 */
   private   String   tempValue;
   private   int      tempInt; 

   /** Login 메뉴관련 VO변수 */
   /** tmp_Id */
   private   String   tmpId;
   /** tmp_Password */
   private   String   tmpPassword;
   /** tmp_Name */
   private   String   tmpName;
   /** tmp_UserSe */
   private   String   tmpUserSe;
   /** tmp_Email */
   private   String   tmpEmail;
   /** tmp_OrgnztId */
   private   String   tmpOrgnztId;
   /** tmp_UniqId */
   private   String   tmpUniqId;
   /** tmp_Cmd */
   private   String   tmpCmd;
   
   /** 트리구성시 필요한 자식리스트 */
   List<MenuManageVO> children = new ArrayList<MenuManageVO>();
   
   /** 메뉴 레벨 */
   private	int		depth;
   
   /** 프로그램 URL */
   private	String		progrmUrl;
   
   /** 부모번호 */
	private Integer parentNo;
   
	/**
	 * menuNo attribute를 리턴한다.
	 * @return int
	 */
	public int getMenuNo() {
		return menuNo;
	}
	/**
	 * menuNo attribute 값을 설정한다.
	 * @param menuNo int
	 */
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	/**
	 * menuOrdr attribute를 리턴한다.
	 * @return int
	 */
	public int getMenuOrdr() {
		return menuOrdr;
	}
	/**
	 * menuOrdr attribute 값을 설정한다.
	 * @param menuOrdr int
	 */
	public void setMenuOrdr(int menuOrdr) {
		this.menuOrdr = menuOrdr;
	}
	/**
	 * menuNm attribute를 리턴한다.
	 * @return String
	 */
	public String getMenuNm() {
		return menuNm;
	}
	/**
	 * menuNm attribute 값을 설정한다.
	 * @param menuNm String
	 */
	public void setMenuNm(String menuNm) {
		this.menuNm = menuNm;
	}
	/**
	 * upperMenuId attribute를 리턴한다.
	 * @return int
	 */
	public int getUpperMenuId() {
		return upperMenuId;
	}
	/**
	 * upperMenuId attribute 값을 설정한다.
	 * @param upperMenuId int
	 */
	public void setUpperMenuId(int upperMenuId) {
		this.upperMenuId = upperMenuId;
	}
	/**
	 * menuDc attribute를 리턴한다.
	 * @return String
	 */
	public String getMenuDc() {
		return menuDc;
	}
	/**
	 * menuDc attribute 값을 설정한다.
	 * @param menuDc String
	 */
	public void setMenuDc(String menuDc) {
		this.menuDc = menuDc;
	}
	/**
	 * relateImagePath attribute를 리턴한다.
	 * @return String
	 */
	public String getRelateImagePath() {
		return relateImagePath;
	}
	/**
	 * relateImagePath attribute 값을 설정한다.
	 * @param relateImagePath String
	 */
	public void setRelateImagePath(String relateImagePath) {
		this.relateImagePath = relateImagePath;
	}
	/**
	 * relateImageNm attribute를 리턴한다.
	 * @return String
	 */
	public String getRelateImageNm() {
		return relateImageNm;
	}
	/**
	 * relateImageNm attribute 값을 설정한다.
	 * @param relateImageNm String
	 */
	public void setRelateImageNm(String relateImageNm) {
		this.relateImageNm = relateImageNm;
	}
	/**
	 * progrmFileNm attribute를 리턴한다.
	 * @return String
	 */
	public String getProgrmFileNm() {
		return progrmFileNm;
	}
	/**
	 * progrmFileNm attribute 값을 설정한다.
	 * @param progrmFileNm String
	 */
	public void setProgrmFileNm(String progrmFileNm) {
		this.progrmFileNm = progrmFileNm;
	}
	/**
	 * creatPersonId attribute를 리턴한다.
	 * @return String
	 */
	public String getCreatPersonId() {
		return creatPersonId;
	}
	/**
	 * creatPersonId attribute 값을 설정한다.
	 * @param creatPersonId String
	 */
	public void setCreatPersonId(String creatPersonId) {
		this.creatPersonId = creatPersonId;
	}
	/**
	 * authorCode attribute를 리턴한다.
	 * @return String
	 */
	public String getAuthorCode() {
		return authorCode;
	}
	/**
	 * authorCode attribute 값을 설정한다.
	 * @param authorCode String
	 */
	public void setAuthorCode(String authorCode) {
		this.authorCode = authorCode;
	}

	/**
	 * tmp_Id attribute를 리턴한다.
	 * @return String
	 */
	public String getTmpId() {
		return tmpId;
	}
	/**
	 * tmp_Id attribute 값을 설정한다.
	 * @param tmp_Id String
	 */
	public void setTmpId(String tmp_Id) {
		this.tmpId = tmp_Id;
	}
	/**
	 * tmp_Password attribute를 리턴한다.
	 * @return String
	 */
	public String getTmpPassword() {
		return tmpPassword;
	}
	/**
	 * tmp_Password attribute 값을 설정한다.
	 * @param tmp_Password String
	 */
	public void setTmpPassword(String tmp_Password) {
		this.tmpPassword = tmp_Password;
	}
	/**
	 * tmp_Name attribute를 리턴한다.
	 * @return String
	 */
	public String getTmpName() {
		return tmpName;
	}
	/**
	 * tmp_Name attribute 값을 설정한다.
	 * @param tmp_Name String
	 */
	public void setTmpName(String tmp_Name) {
		this.tmpName = tmp_Name;
	}
	/**
	 * tmp_UserSe attribute를 리턴한다.
	 * @return String
	 */
	public String getTmpUserSe() {
		return tmpUserSe;
	}
	/**
	 * tmp_UserSe attribute 값을 설정한다.
	 * @param tmp_UserSe String
	 */
	public void setTmpUserSe(String tmp_UserSe) {
		this.tmpUserSe = tmp_UserSe;
	}
	/**
	 * tmp_Email attribute를 리턴한다.
	 * @return String
	 */
	public String getTmpEmail() {
		return tmpEmail;
	}
	/**
	 * tmp_Email attribute 값을 설정한다.
	 * @param tmp_Email String
	 */
	public void setTmpEmail(String tmp_Email) {
		this.tmpEmail = tmp_Email;
	}
	/**
	 * tmp_OrgnztId attribute를 리턴한다.
	 * @return String
	 */
	public String getTmpOrgnztId() {
		return tmpOrgnztId;
	}
	/**
	 * tmp_OrgnztId attribute 값을 설정한다.
	 * @param tmp_OrgnztId String
	 */
	public void setTmpOrgnztId(String tmp_OrgnztId) {
		this.tmpOrgnztId = tmp_OrgnztId;
	}
	/**
	 * tmp_UniqId attribute를 리턴한다.
	 * @return String
	 */
	public String getTmpUniqId() {
		return tmpUniqId;
	}
	/**
	 * tmp_UniqId attribute 값을 설정한다.
	 * @param tmp_UniqId String
	 */
	public void setTmpUniqId(String tmpUniqId) {
		this.tmpUniqId = tmpUniqId;
	}
	/**
	 * tmp_Cmd attribute를 리턴한다.
	 * @return String
	 */
	public String getTmpCmd() {
		return tmpCmd;
	}
	/**
	 * tmp_Cmd attribute 값을 설정한다.
	 * @param tmp_Cmd String
	 */
	public void setTmpCmd(String tmp_Cmd) {
		this.tmpCmd = tmp_Cmd;
	}
	   
	  /**
	 * tempValue attribute를 리턴한다.
	 * @return String
	 */
	public String getTempValue() {
		return tempValue;
	}
	/**
	 * tempValue attribute 값을 설정한다.
	 * @param tempValue String
	 */
	public void setTempValue(String tempValue) {
		this.tempValue = tempValue;
	}
	/**
	 * tempInt attribute를 리턴한다.
	 * @return int
	 */
	public int getTempInt() {
		return tempInt;
	}
	/**
	 * tempInt attribute 값을 설정한다.
	 * @param tempInt int
	 */
	public void setTempInt(int tempInt) {
		this.tempInt = tempInt;
	}
	public List<MenuManageVO> getChildren() {
		return children;
	}
	public void setChildren(List<MenuManageVO> children) {
		this.children = children;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getProgrmUrl() {
		return progrmUrl;
	}
	public void setProgrmUrl(String progrmUrl) {
		this.progrmUrl = progrmUrl;
	}
	public Integer getParentNo() {
		return parentNo;
	}
	public void setParentNo(Integer parentNo) {
		this.parentNo = parentNo;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((authorCode == null) ? 0 : authorCode.hashCode());
		result = prime * result
				+ ((children == null) ? 0 : children.hashCode());
		result = prime * result
				+ ((creatPersonId == null) ? 0 : creatPersonId.hashCode());
		result = prime * result + depth;
		result = prime * result + ((menuDc == null) ? 0 : menuDc.hashCode());
		result = prime * result + ((menuNm == null) ? 0 : menuNm.hashCode());
		result = prime * result + menuNo;
		result = prime * result + menuOrdr;
		result = prime * result
				+ ((parentNo == null) ? 0 : parentNo.hashCode());
		result = prime * result
				+ ((progrmFileNm == null) ? 0 : progrmFileNm.hashCode());
		result = prime * result
				+ ((progrmUrl == null) ? 0 : progrmUrl.hashCode());
		result = prime * result
				+ ((relateImageNm == null) ? 0 : relateImageNm.hashCode());
		result = prime * result
				+ ((relateImagePath == null) ? 0 : relateImagePath.hashCode());
		result = prime * result + tempInt;
		result = prime * result
				+ ((tempValue == null) ? 0 : tempValue.hashCode());
		result = prime * result + ((tmpCmd == null) ? 0 : tmpCmd.hashCode());
		result = prime * result
				+ ((tmpEmail == null) ? 0 : tmpEmail.hashCode());
		result = prime * result + ((tmpId == null) ? 0 : tmpId.hashCode());
		result = prime * result + ((tmpName == null) ? 0 : tmpName.hashCode());
		result = prime * result
				+ ((tmpOrgnztId == null) ? 0 : tmpOrgnztId.hashCode());
		result = prime * result
				+ ((tmpPassword == null) ? 0 : tmpPassword.hashCode());
		result = prime * result
				+ ((tmpUniqId == null) ? 0 : tmpUniqId.hashCode());
		result = prime * result
				+ ((tmpUserSe == null) ? 0 : tmpUserSe.hashCode());
		result = prime * result + upperMenuId;
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MenuManageVO other = (MenuManageVO) obj;
		if (authorCode == null) {
			if (other.authorCode != null)
				return false;
		} else if (!authorCode.equals(other.authorCode))
			return false;
		if (children == null) {
			if (other.children != null)
				return false;
		} else if (!children.equals(other.children))
			return false;
		if (creatPersonId == null) {
			if (other.creatPersonId != null)
				return false;
		} else if (!creatPersonId.equals(other.creatPersonId))
			return false;
		if (depth != other.depth)
			return false;
		if (menuDc == null) {
			if (other.menuDc != null)
				return false;
		} else if (!menuDc.equals(other.menuDc))
			return false;
		if (menuNm == null) {
			if (other.menuNm != null)
				return false;
		} else if (!menuNm.equals(other.menuNm))
			return false;
		if (menuNo != other.menuNo)
			return false;
		if (menuOrdr != other.menuOrdr)
			return false;
		if (parentNo == null) {
			if (other.parentNo != null)
				return false;
		} else if (!parentNo.equals(other.parentNo))
			return false;
		if (progrmFileNm == null) {
			if (other.progrmFileNm != null)
				return false;
		} else if (!progrmFileNm.equals(other.progrmFileNm))
			return false;
		if (progrmUrl == null) {
			if (other.progrmUrl != null)
				return false;
		} else if (!progrmUrl.equals(other.progrmUrl))
			return false;
		if (relateImageNm == null) {
			if (other.relateImageNm != null)
				return false;
		} else if (!relateImageNm.equals(other.relateImageNm))
			return false;
		if (relateImagePath == null) {
			if (other.relateImagePath != null)
				return false;
		} else if (!relateImagePath.equals(other.relateImagePath))
			return false;
		if (tempInt != other.tempInt)
			return false;
		if (tempValue == null) {
			if (other.tempValue != null)
				return false;
		} else if (!tempValue.equals(other.tempValue))
			return false;
		if (tmpCmd == null) {
			if (other.tmpCmd != null)
				return false;
		} else if (!tmpCmd.equals(other.tmpCmd))
			return false;
		if (tmpEmail == null) {
			if (other.tmpEmail != null)
				return false;
		} else if (!tmpEmail.equals(other.tmpEmail))
			return false;
		if (tmpId == null) {
			if (other.tmpId != null)
				return false;
		} else if (!tmpId.equals(other.tmpId))
			return false;
		if (tmpName == null) {
			if (other.tmpName != null)
				return false;
		} else if (!tmpName.equals(other.tmpName))
			return false;
		if (tmpOrgnztId == null) {
			if (other.tmpOrgnztId != null)
				return false;
		} else if (!tmpOrgnztId.equals(other.tmpOrgnztId))
			return false;
		if (tmpPassword == null) {
			if (other.tmpPassword != null)
				return false;
		} else if (!tmpPassword.equals(other.tmpPassword))
			return false;
		if (tmpUniqId == null) {
			if (other.tmpUniqId != null)
				return false;
		} else if (!tmpUniqId.equals(other.tmpUniqId))
			return false;
		if (tmpUserSe == null) {
			if (other.tmpUserSe != null)
				return false;
		} else if (!tmpUserSe.equals(other.tmpUserSe))
			return false;
		if (upperMenuId != other.upperMenuId)
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "MenuManageVO [menuNo=" + menuNo + ", menuOrdr=" + menuOrdr
				+ ", menuNm=" + menuNm + ", upperMenuId=" + upperMenuId
				+ ", menuDc=" + menuDc + ", relateImagePath=" + relateImagePath
				+ ", relateImageNm=" + relateImageNm + ", progrmFileNm="
				+ progrmFileNm + ", creatPersonId=" + creatPersonId
				+ ", authorCode=" + authorCode + ", tempValue=" + tempValue
				+ ", tempInt=" + tempInt + ", tmpId=" + tmpId
				+ ", tmpPassword=" + tmpPassword + ", tmpName=" + tmpName
				+ ", tmpUserSe=" + tmpUserSe + ", tmpEmail=" + tmpEmail
				+ ", tmpOrgnztId=" + tmpOrgnztId + ", tmpUniqId=" + tmpUniqId
				+ ", tmpCmd=" + tmpCmd + ", children=" + children + ", depth="
				+ depth + ", progrmUrl=" + progrmUrl + ", parentNo=" + parentNo
				+ "]";
	}
}