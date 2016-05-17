package tree;

import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;


import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class MainTest {

	public static void main(String[] args) throws JsonGenerationException, JsonMappingException, IOException {
		
		List<TreeNode> nodeList=new ArrayList<TreeNode>();
		
		TreeNode tn=new TreeNode();
		tn=new TreeNode();
		tn.setMenuNm("메뉴1-2");
		tn.setMenuNo(101);
		tn.setMenuOrdr(2);
		tn.setUpperMenuNo(1);
		nodeList.add(tn);

		tn=new TreeNode();
		tn.setMenuNm("메뉴1");
		tn.setMenuNo(1);
		tn.setMenuOrdr(1);
		tn.setUpperMenuNo(0);
		nodeList.add(tn);
		
		tn=new TreeNode();
		tn.setMenuNm("메뉴2-1-1");
		tn.setMenuNo(1001);
		tn.setMenuOrdr(2);
		tn.setUpperMenuNo(200);
		nodeList.add(tn);
		
		tn=new TreeNode();
		tn.setMenuNm("메뉴2-1-2");
		tn.setMenuNo(1000);
		tn.setMenuOrdr(1);
		tn.setUpperMenuNo(200);
		nodeList.add(tn);
		
		tn=new TreeNode();
		tn.setMenuNm("메뉴2-1-2-1");
		tn.setMenuNo(10001);
		tn.setMenuOrdr(1);
		tn.setUpperMenuNo(1000);
		nodeList.add(tn);
		
		tn=new TreeNode();
		tn.setMenuNm("메뉴1-1");
		tn.setMenuNo(100);
		tn.setMenuOrdr(1);
		tn.setUpperMenuNo(1);
		nodeList.add(tn);
		
		
		tn=new TreeNode();
		tn.setMenuNm("메뉴2-1");
		tn.setMenuNo(200);
		tn.setMenuOrdr(2);
		tn.setUpperMenuNo(2);
		nodeList.add(tn);

		tn=new TreeNode();
		tn.setMenuNm("메뉴2-2");
		tn.setMenuNo(201);
		tn.setMenuOrdr(1);
		tn.setUpperMenuNo(2);
		nodeList.add(tn);
		
		tn=new TreeNode();
		tn.setMenuNm("메뉴2");
		tn.setMenuNo(2);
		tn.setMenuOrdr(1);
		tn.setUpperMenuNo(0);
		nodeList.add(tn);
		
		//TreeMaker tm=new TreeMaker(nodeList,0);
		//List<TreeNode> resultList=new TreeMaker(nodeList,0);
		//List<TreeNode> resultList=tm.treeMake();

		//System.out.println(resultList);
/*		System.out.println(resultList);
		System.out.println("=======================result ====================");
		
		for (TreeNode treeNode : resultList) {
			System.out.println("----------------depth1");
			System.out.println(treeNode);
			for (TreeNode treeNode2 : treeNode.getChildren()) {
				System.out.println("----------------depth2");
				System.out.println(treeNode2);
				for (TreeNode treeNode3 : treeNode.getChildren()) {
					System.out.println("----------------depth3");
					System.out.println(treeNode3);
				}
			}
		}*/
/*	   StringWriter sw =new StringWriter();
	   ObjectMapper mapper = new ObjectMapper();
	   
	    mapper.writeValue(sw, resultList);
	    System.out.println(sw.toString());
		sw.close();
	    
	    System.out.println("================search Parent=================");*/
		//TreeNode searchParentMenu=tm.searchParentMenu(10001, 0);
/*		sw =new StringWriter();
		mapper = new ObjectMapper();
	    mapper.writeValue(sw, searchParentMenu);
	    System.out.println(sw.toString());
		System.out.println(searchParentMenu);*/
		//sw.close();
/*		System.out.println("===========================================");
		List<TreeNode> searchList=tm.recursiveList(resultList, 1);
		System.out.println(searchList);
		
		System.out.println("================search MenuNo=================");
		TreeNode searchNode=tm.recursiveSearchList(resultList, 101);
		System.out.println(searchNode);*/
		
/*		System.out.println("================search Parent=================");
		TreeNode searchParentMenu=tm.searchParentMenu(10001, 1);
		System.out.println(searchParentMenu);*/
	}
	
}
