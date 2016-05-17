package tree;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class TreeNode {

	private Integer menuNo;
	private Integer upperMenuNo;
	private Integer menuOrdr;
	private String menuNm;
	private Integer depth;
	
	private Integer parentNo;
	List<TreeNode> children= new ArrayList<TreeNode>();
	public Integer getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(Integer menuNo) {
		this.menuNo = menuNo;
	}
	public Integer getUpperMenuNo() {
		return upperMenuNo;
	}
	public void setUpperMenuNo(Integer upperMenuNo) {
		this.upperMenuNo = upperMenuNo;
	}
	public Integer getMenuOrdr() {
		return menuOrdr;
	}
	public void setMenuOrdr(Integer menuOrdr) {
		this.menuOrdr = menuOrdr;
	}
	public String getMenuNm() {
		return menuNm;
	}
	public void setMenuNm(String menuNm) {
		this.menuNm = menuNm;
	}
	public Integer getDepth() {
		return depth;
	}
	public void setDepth(Integer depth) {
		this.depth = depth;
	}
	public Integer getParentNo() {
		return parentNo;
	}
	public void setParentNo(Integer parentNo) {
		this.parentNo = parentNo;
	}
	public List<TreeNode> getChildren() {
		return children;
	}
	public void setChildren(List<TreeNode> children) {
		this.children = children;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((children == null) ? 0 : children.hashCode());
		result = prime * result + ((depth == null) ? 0 : depth.hashCode());
		result = prime * result + ((menuNm == null) ? 0 : menuNm.hashCode());
		result = prime * result + ((menuNo == null) ? 0 : menuNo.hashCode());
		result = prime * result
				+ ((menuOrdr == null) ? 0 : menuOrdr.hashCode());
		result = prime * result
				+ ((parentNo == null) ? 0 : parentNo.hashCode());
		result = prime * result
				+ ((upperMenuNo == null) ? 0 : upperMenuNo.hashCode());
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
		TreeNode other = (TreeNode) obj;
		if (children == null) {
			if (other.children != null)
				return false;
		} else if (!children.equals(other.children))
			return false;
		if (depth == null) {
			if (other.depth != null)
				return false;
		} else if (!depth.equals(other.depth))
			return false;
		if (menuNm == null) {
			if (other.menuNm != null)
				return false;
		} else if (!menuNm.equals(other.menuNm))
			return false;
		if (menuNo == null) {
			if (other.menuNo != null)
				return false;
		} else if (!menuNo.equals(other.menuNo))
			return false;
		if (menuOrdr == null) {
			if (other.menuOrdr != null)
				return false;
		} else if (!menuOrdr.equals(other.menuOrdr))
			return false;
		if (parentNo == null) {
			if (other.parentNo != null)
				return false;
		} else if (!parentNo.equals(other.parentNo))
			return false;
		if (upperMenuNo == null) {
			if (other.upperMenuNo != null)
				return false;
		} else if (!upperMenuNo.equals(other.upperMenuNo))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "TreeNode [menuNo=" + menuNo + ", upperMenuNo=" + upperMenuNo
				+ ", menuOrdr=" + menuOrdr + ", menuNm=" + menuNm + ", depth="
				+ depth + ", parentNo=" + parentNo + ", children=" + children
				+ "]";
	}
}
