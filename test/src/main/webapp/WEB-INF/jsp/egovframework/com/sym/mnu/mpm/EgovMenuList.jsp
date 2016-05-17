<%--
 /**
  * @Class Name : EgovMenuList.jsp
  * @Description : 메뉴목록 화면
  * @Modification Information
  * @
  * @  수정일         수정자         수정내용
  * @ ----------- 	 --------    ---------------------------
  * @ 2009.03.10	   이용          최초 생성
  * @ 2013.10.04	  이기하        메뉴트리 위치 변경
  * @ 2016.05.11	  김성천        메뉴 GUI 변경
  *
  *  @author 공통서비스 개발팀 이용
  *  @since 2009.03.10
  *  @version 1.0
  *  @see
  *
  */
--%>
<link rel="stylesheet" href="<c:url value='/plugin/jqtree/jqtree.css' />" type="text/css">
<script type="text/javascript" src="<c:url value="/plugin/jqtree/static/bower_components/jquery-mockjax/dist/jquery.mockjax.js" />"></script>
<script type="text/javascript" src="<c:url value="/plugin/jqtree/static/example_data.js" />"></script>
<script type="text/javascript" src="<c:url value="/plugin/jqtree/tree.jquery.js" />"></script>
    <script>
        $.mockjax({
            url: '*',
            response: function(options) {
                this.responseText = ExampleData.example_data;
            },
            responseTime: 0
        });

        $(function() {
            var $tree = $('#tree1');
            $tree.tree({
                dragAndDrop: true,
                autoOpen: true,
                selectable: true
            });
            
            $('#tree1').bind(
            	    'tree.move',
            	    function(event) {
            	        console.log('moved_node', event.move_info.moved_node);
            	        console.log('target_node', event.move_info.target_node);
            	        console.log('position', event.move_info.position);
            	        console.log('previous_parent', event.move_info.previous_parent);
            	    }
            	);
        });
    </script>
<script type="text/javascript" src="<c:url value="/validator.do" />"></script>
<script type="text/javascript">
var imgpath = "<c:url value='/images/egovframework/com/cmm/utl/'/>";
</script>
<script language="javascript1.2" type="text/javaScript" src="<c:url value='/js/egovframework/com/sym/mnu/mpm/EgovMenuList.js' />"></script>
<script language="javascript1.2" type="text/javaScript">
<!--
/* ********************************************************
 * 파일검색 화면 호출 함수
 ******************************************************** */
function searchFileNm() {
	document.menuManageVO.tmp_SearchElementName.value = "progrmFileNm";
	window.open("<c:url value='/sym/prm/EgovProgramListSearch.do' />",'','width=500,height=600');
}

/* ********************************************************
 * 메뉴등록 처리 함수
 ******************************************************** */
function insertMenuList() {
	if(!fn_validatorMenuList()){return;}
    if(document.menuManageVO.tmp_CheckVal.value == "U"){alert("상세조회시는 수정혹은 삭제만 가능합니다."); return;}
	document.menuManageVO.action = "<c:url value='/sym/mnu/mpm/EgovMenuListInsert.do'/>";
	menuManageVO.submit();

}

/* ********************************************************
 * 메뉴수정 처리 함수
 ******************************************************** */
function updateMenuList() {
    if(!fn_validatorMenuList()){return;}
    if(document.menuManageVO.tmp_CheckVal.value != "U"){alert("상세조회시는 수정혹은 삭제만 가능합니다. 초기화 하신 후 등록하세요."); return;}
	document.menuManageVO.action = "<c:url value='/sym/mnu/mpm/EgovMenuListUpdt.do'/>";
	menuManageVO.submit();
}

/* ********************************************************
 * 메뉴삭제 처리 함수
 ******************************************************** */
function deleteMenuList() {
    if(!fn_validatorMenuList()){return;}
    if(document.menuManageVO.tmp_CheckVal.value != "U"){alert("상세조회시는 수정혹은 삭제만 가능합니다."); return;}
	document.menuManageVO.action = "<c:url value='/sym/mnu/mpm/EgovMenuListDelete.do'/>";
	menuManageVO.submit();
}

/* ********************************************************
 * 메뉴리스트 조회 함수
 ******************************************************** */
function selectMenuList() {
    document.menuManageVO.action = "<c:url value='/sym/mnu/mpm/EgovMenuListSelect.do'/>";
    document.menuManageVO.submit();
}

/* ********************************************************
 * 메뉴이동 화면 호출 함수
 ******************************************************** */
function mvmnMenuList() {
	window.open("<c:url value='/sym/mnu/mpm/EgovMenuListSelectMvmn.do' />",'Pop_Mvmn','scrollbars=yes,width=600,height=600');
}

/* ********************************************************
 * 초기화 함수
 ******************************************************** */
function initlMenuList() {
	document.menuManageVO.menuNo.value="";
	document.menuManageVO.menuOrdr.value="";
	document.menuManageVO.menuNm.value="";
	document.menuManageVO.upperMenuId.value="";
	document.menuManageVO.menuDc.value="";
	document.menuManageVO.relateImagePath.value="";
	document.menuManageVO.relateImageNm.value="";
	document.menuManageVO.progrmFileNm.value="";
	document.menuManageVO.menuNo.readOnly=false;
	document.menuManageVO.tmp_CheckVal.value = "";
}

/* ********************************************************
 * 조회 함수

 ******************************************************** */
function selectMenuListTmp() {
	document.menuManageVO.req_RetrunPath.value = "/sym/mnu/mpm/EgovMenuList";
    document.menuManageVO.action = "<c:url value='/sym/mnu/mpm/EgovMenuListSelectTmp.do'/>";
    document.menuManageVO.submit();
}

/* ********************************************************
 * 상세내역조회 함수
 ******************************************************** */
 function choiceNodes(nodeNum) {
		var nodeValues = treeNodes[nodeNum].split("|");
		document.menuManageVO.menuNo.value = nodeValues[4];
		document.menuManageVO.menuOrdr.value = nodeValues[5];
		document.menuManageVO.menuNm.value = nodeValues[6];
		document.menuManageVO.upperMenuId.value = nodeValues[7];
		document.menuManageVO.menuDc.value = nodeValues[8];
		document.menuManageVO.relateImagePath.value = nodeValues[9];
		document.menuManageVO.relateImageNm.value = nodeValues[10];
		document.menuManageVO.progrmFileNm.value = nodeValues[11];
		document.menuManageVO.menuNo.readOnly=true;
		document.menuManageVO.tmp_CheckVal.value = "U";
}

/* ********************************************************
 * 입력값 validator 함수
 ******************************************************** */
function fn_validatorMenuList() {

	if(document.menuManageVO.menuNo.value == ""){alert("메뉴번호는 Not Null 항목입니다."); return false;}
	if(!checkNumber(document.menuManageVO.menuNo.value)){alert("메뉴번호는 숫자만 입력 가능합니다."); return false;}

	if(document.menuManageVO.menuOrdr.value == ""){alert("메뉴순서는 Not Null 항목입니다."); return false;}
	if(!checkNumber(document.menuManageVO.menuOrdr.value)){alert("메뉴순서는 숫자만 입력 가능합니다."); return false;}

	if(document.menuManageVO.upperMenuId.value == ""){alert("상위메뉴번호는 Not Null 항목입니다."); return false;}
	if(!checkNumber(document.menuManageVO.upperMenuId.value)){alert("상위메뉴번호는 숫자만 입력 가능합니다."); return false;}

	if(document.menuManageVO.progrmFileNm.value == ""){alert("프로그램파일명은 Not Null 항목입니다."); return false;}
	if(document.menuManageVO.menuNm.value == ""){alert("메뉴명은 Not Null 항목입니다."); return false;}

    return true;
}

/* ********************************************************
 * 필드값 Number 체크 함수
 ******************************************************** */
function checkNumber(str) {
    var flag=true;
    if (str.length > 0) {
        for (i = 0; i < str.length; i++) {
            if (str.charAt(i) < '0' || str.charAt(i) > '9') {
                flag=false;
            }
        }
    }
    return flag;
}
<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>


<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">메뉴정보등록</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>

	<div class="row">
		<div class="col-lg-12">	
		 <div id="tree1" data-url="/example_data/"></div>
		</div>
		<!-- /.col-lg-12 -->
	</div>
		
</div>