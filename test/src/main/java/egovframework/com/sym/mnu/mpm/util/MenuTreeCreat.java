package egovframework.com.sym.mnu.mpm.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import egovframework.com.sym.mnu.mpm.service.MenuManageVO;

/**
 * 메뉴를 트리로 구성하는 클래스
 * @author 기술지원팀 김성천
 * @since 2016.05.11
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2016.05.11  김성천          최초 생성
 *
 * </pre>
 */
public class MenuTreeCreat {
	//최상위 트리 ID
	private int rootId;
	//레벨 검색결과
	private List<MenuManageVO> levelSearchResult=new ArrayList<MenuManageVO>();
	/* 상위 검색결과 단일 노드 */
	private MenuManageVO searchParentNode;
	/* 검색결과 단일 노드 */
	private MenuManageVO searchNode;
	/* 검색결과 리스트*/
	private List<MenuManageVO> searchNodeList;
	/* 최종적인 트리 데이터 */
	private List<MenuManageVO> treeModel=new ArrayList<MenuManageVO>();

	/* 전체 데이터 길이 */
	int listLength;

	/* 트리 크기 */
	int treeLength = 0;

	/* 반복 횟수 */
	int loopLength = 0;
	

	/**
	 * 트리 데이터 초기화
	 * @param nodeList
	 * @param rootId
	 */
	public MenuTreeCreat(List<MenuManageVO> nodeList, int rootId) {
		this.searchNodeList=nodeList;
		this.rootId=rootId;
		this.listLength=nodeList.size();
		treeMake();
	}
	
	/**
	 * 트리변환 실행
	 */
	public void treeMake(){
		/* 트리 변환 여부 + 무한 루프 방지 */
		while(treeLength != listLength && listLength != loopLength++){
			/* 전체 리스트를 탐색 */
			for(int i=0 ; i < searchNodeList.size() ; i++){
				MenuManageVO item=searchNodeList.get(i);
				/* 최상위 객체면, */
				if ( item.getUpperMenuId() == rootId ) {
					/* 현재 요소를 추가하고, */
					treeModel.add(item);
					/* 데이터상에서는 삭제 */
					searchNodeList.remove(item);
					/* 현재 트리 계층을 정렬 */
					Collections.sort(searchNodeList, new MenuTreeOrderComparator());
					break;
				
				/* 하위 객체면, */
				}else{
					getParentNode( treeModel, item );
				}
			}
		}
		/* 객체에 레벨 부여 */
		depthAdd(treeModel, 0);
		this.treeModel=treeModel;
	}
	
	/**
	 * 자식노드를 재귀호출
	 * @param _children
	 * @param item
	 */
	private void getParentNode(List<MenuManageVO> _children, MenuManageVO item) {
		
		/* 전체 리스트를 탐색 */
		for(int i=0 ; i < _children.size() ; i++){
			MenuManageVO child=_children.get(i);
			/* 부모를 찾았으면, */
			if ( child.getMenuNo() == item.getUpperMenuId() ) {
				/* 현재 요소를 추가하고 */
				item.setParentNo(child.getMenuNo());
				child.getChildren().add(item);
				/* 데이터상에서는 삭제 */
				searchNodeList.remove(item);
				/* 현재 트리 계층을 정렬 */
				Collections.sort( child.getChildren(), new MenuTreeOrderComparator());
				break;
			}
			/* 부모가 아니면, */
			else {
				if( child.getChildren().size() != 0 ) {
					getParentNode( child.getChildren(), item );
				}
			}
		}
	}
	
	/**
	 * 리스트를 순환하면서 레벨 부여
	 * @param children
	 * @param depth
	 */
	public void depthAdd(List<MenuManageVO> children,int depth){
		depth++;
		for(int i=0;  i < children.size(); i++){
			children.get(i).setDepth(depth);
			if(children.get(i).getChildren().size() > 0){
				depthAdd( children.get(i).getChildren(), depth);
			}
		}
	}
	
	/**
	 * 트리데이터(전체데이터) 반환
	 * @return
	 */
	public List<MenuManageVO> getTreeModel() {
		return treeModel;
	}

	/**
	 * 상위 레벨의 메뉴를 검색 하고 검색된 부모를 반환
	 * @param menuNo
	 * @param depth
	 * @return
	 */
	public MenuManageVO getParentMenu(int menuNo,int depth){
		MenuManageVO item=searchMenuCall(this.treeModel, menuNo);
		return searchParentCall(this.treeModel,item,depth);
	}
	public MenuManageVO searchParentCall(List<MenuManageVO> treeList,MenuManageVO item, int depth){
		//부모 엘리먼트 찾기
		item=searchMenuCall(treeList, item.getParentNo());
		//부모 엘리먼트의 레벨이 찾고자하는 레벨과 같다면
		if(item.getDepth() == depth){
			return this.searchParentNode=item;
		}
		if(item.getDepth() == 1 || item == null){
			return this.searchParentNode=new MenuManageVO();
		}
		//부모 레벨을 찾을때까지 재귀호출
		searchParentCall(treeList,item,depth);
		return this.searchParentNode;
	}
	
	/**
	 * 메뉴번호에 해당되는 엘리먼트를 반환
	 * @param menuNo
	 * @return
	 */
	public MenuManageVO getMenu(int menuNo){
		return searchMenuCall(this.treeModel,menuNo);
	}
	public MenuManageVO searchMenuCall(List<MenuManageVO> children, int menuNo){
		//재귀호출 여부 플래그
		boolean searchChk = false;
		for(int i=0;  i < children.size(); i++){
			if(children.get(i).getMenuNo() == menuNo){
				this.searchNode=children.get(i);
				searchChk=true;
				break;
			}
			if(children.get(i).getChildren().size() > 0 && searchChk == false)
				searchMenuCall( children.get(i).getChildren(), menuNo);
		}
		return this.searchNode;
	}
	
	/**
	 * 레벨에 해당되는 리스트 반환
	 * @param depth
	 * @return
	 */
	public List<MenuManageVO> getLevelMenu(int depth){
		return searchLevelMenuCall(this.treeModel,depth);
	}
	public List<MenuManageVO> searchLevelMenuCall(List<MenuManageVO> children,int depth){
		for(int i=0;  i < children.size(); i++){
			if(children.get(i).getDepth() == depth)
				this.levelSearchResult.add(children.get(i));
			if(children.get(i).getChildren().size() > 0)
				searchLevelMenuCall( children.get(i).getChildren(), depth);
		}
		return this.levelSearchResult;
	}

}
