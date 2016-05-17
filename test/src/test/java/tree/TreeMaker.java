package tree;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class TreeMaker {
	//최상위 트리 ID
	private int rootId;
	
	//레벨 검색결과
	private List<TreeNode> levelSearchResult=new ArrayList<TreeNode>();
	
	/* 검색결과 단일 노드 */
	TreeNode searchNode;
	/* 검색결과 리스트*/
	List<TreeNode> searchNodeList;
	
	/* 최종적인 트리 데이터 */
	List<TreeNode> treeModel=new ArrayList<TreeNode>();

	/* 전체 데이터 길이 */
	int listLength;

	/* 트리 크기 */
	int treeLength = 0;

	/* 반복 횟수 */
	int loopLength = 0;
	
	//트리 데이터 초기화
	public TreeMaker(List<TreeNode> nodeList, int rootId) {
		this.searchNodeList=nodeList;
		this.rootId=rootId;
		this.listLength=nodeList.size();
	}
	
	public List<TreeNode> treeMake(){
		/* 트리 변환 여부 + 무한 루프 방지 */
		while(treeLength != listLength && listLength != loopLength++){
			/* 전체 리스트를 탐색 */
			for(int i=0 ; i < searchNodeList.size() ; i++){
				TreeNode item=searchNodeList.get(i);
				/* 최상위 객체면, */
				if ( item.getUpperMenuNo().equals(rootId) ) {
					/* 현재 요소를 추가하고, */
					treeModel.add(item);
					/* 데이터상에서는 삭제 */
					searchNodeList.remove(item);
					/* 현재 트리 계층을 정렬 */
					Collections.sort(searchNodeList, new MenuOrderComparator());
					break;
				
				/* 하위 객체면, */
				}else{
					getParentNode( treeModel, item );
				}
			}
		}
		depthAdd(treeModel, 0);
		return treeModel;
	}
	
	/* 재귀 호출 */
	private void getParentNode(List<TreeNode> _children, TreeNode item) {
		
		/* 전체 리스트를 탐색 */
		for(int i=0 ; i < _children.size() ; i++){
			TreeNode child=_children.get(i);
			/* 부모를 찾았으면, */
			if ( child.getMenuNo().equals(item.getUpperMenuNo()) ) {
				/* 현재 요소를 추가하고 */
				item.setParentNo(child.getMenuNo());
				child.getChildren().add(item);
				/* 데이터상에서는 삭제 */
				searchNodeList.remove(item);
				/* 현재 트리 계층을 정렬 */
				Collections.sort( child.getChildren(), new MenuOrderComparator());
				break;
			}
			/* 부모가 아니면, */
			else {
				if( child.getChildren().size() != 0 ) {
					getParentNode( child.children, item );
				}
			}
		}
	}
	
	//상위 레벨의 메뉴를 검색
	public TreeNode searchParentMenu(int menuNo,int depth){
		TreeNode item=recursiveSearchList(treeModel, menuNo);
		return searchParentCall(treeModel,item,depth);
	}
	
	public TreeNode searchParentCall(List<TreeNode> treeList,TreeNode item, int depth){
		//부모 엘리먼트 찾기
		item=recursiveSearchList(treeList, item.getParentNo());
		//부모 엘리먼트의 레벨이 찾고자하는 레벨과 같다면
		if(item.getDepth().equals(depth)){
			return this.searchNode=item;
		}
		
		if(item.getDepth().equals(1) || item == null){
			return this.searchNode=new TreeNode();
		}
		
		//부모 레벨을 찾을때까지 재귀호출
		searchParentCall(treeList,item,depth);

		return this.searchNode;
	}
	
	//메뉴번호에 해당되는 엘리먼트 반환
	public TreeNode recursiveSearchList(List<TreeNode> children, int menuNo){
		//재귀호출 여부 플래그
		boolean searchChk = false;
		for(int i=0;  i < children.size(); i++){
			if(children.get(i).getMenuNo().equals(menuNo) ){
				this.searchNode=children.get(i);
				searchChk=true;
				break;
			}
			if(children.get(i).getChildren().size() > 0 && searchChk == false)
				recursiveSearchList( children.get(i).children, menuNo);
		}
		return this.searchNode;
	}
	
	//레벨에 해당되는 리스트 반환
	public List<TreeNode> recursiveList(List<TreeNode> children,int depth){
		for(int i=0;  i < children.size(); i++){
			if(children.get(i).getDepth().equals(depth))
				this.levelSearchResult.add(children.get(i));
			if(children.get(i).getChildren().size() > 0)
				recursiveList( children.get(i).children, depth);
		}
		return this.levelSearchResult;
	}
	
	//리스트를 순환하면서 레벨 부여
	public void depthAdd(List<TreeNode> children,int depth){
		depth++;
		for(int i=0;  i < children.size(); i++){
			children.get(i).setDepth(depth);
			if(children.get(i).getChildren().size() > 0){
				depthAdd( children.get(i).children, depth);
			}
		}
	}
}
