package tree;

import java.util.Comparator;

public class MenuOrderComparator implements Comparator<TreeNode>{

	@Override
	public int compare(TreeNode o1, TreeNode o2) {
		return o1.getMenuOrdr() < o2.getMenuOrdr() ? -1 : o1.getMenuOrdr() > o2.getMenuOrdr() ? 1 : 0;
	}
}
