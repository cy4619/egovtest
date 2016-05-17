package egovframework.com.sym.mnu.mpm.util;

import java.util.Comparator;

import egovframework.com.sym.mnu.mpm.service.MenuManageVO;

public class MenuTreeOrderComparator implements Comparator<MenuManageVO>{

	@Override
	public int compare(MenuManageVO o1, MenuManageVO o2) {
		return o1.getMenuOrdr() < o2.getMenuOrdr() ? -1 : o1.getMenuOrdr() > o2.getMenuOrdr() ? 1 : 0;
	}

}
