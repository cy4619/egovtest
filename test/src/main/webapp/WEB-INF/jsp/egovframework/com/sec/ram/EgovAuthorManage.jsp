<%
 /**
  * @Class Name : EgovAuthorManage.java
  * @Description : EgovAuthorManage List 화면
  * @Modification Information
  * @
  * @  수정일                     수정자                    수정내용
  * @ -------       --------    ---------------------------
  * @ 2009.03.01    Lee.m.j       최초 생성
  *
  *  @author 실행환경 개발팀 홍길동
  *  @since 2009.02.01
  *  @version 1.0
  *  @see
  *
  */
%>
 <script type="text/javaScript" language="javascript" defer="defer">
<!--

function fncCheckAll() {
    var checkField = document.listForm.delYn;
    if(document.listForm.checkAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
                for(var i=0; i < checkField.length; i++) {
                    checkField[i].checked = true;
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if(checkField) {
            if(checkField.length > 1) {
                for(var j=0; j < checkField.length; j++) {
                    checkField[j].checked = false;
                }
            } else {
                checkField.checked = false;
            }
        }
    }
}

function fncManageChecked() {

    var checkField = document.listForm.delYn;
    var checkId = document.listForm.checkId;
    var returnValue = "";

    var returnBoolean = false;
    var checkCount = 0;

    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i<checkField.length; i++) {
                if(checkField[i].checked) {
                    checkField[i].value = checkId[i].value;
                    if(returnValue == "")
                        returnValue = checkField[i].value;
                    else
                	    returnValue = returnValue + ";" + checkField[i].value;
                    checkCount++;
                }
            }
            if(checkCount > 0)
                returnBoolean = true;
            else {
                alert("선택된 권한이 없습니다.");
                returnBoolean = false;
            }
        } else {
            if(document.listForm.delYn.checked == false) {
                alert("선택된 권한이 없습니다.");
                returnBoolean = false;
            }
            else {
                returnValue = checkId.value;
                returnBoolean = true;
            }
        }
    } else {
        alert("조회된 결과가 없습니다.");
    }

    document.listForm.authorCodes.value = returnValue;

    return returnBoolean;
}

function fncSelectAuthorList(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sec/ram/EgovAuthorList.do'/>";
    document.listForm.submit();
}

function fncSelectAuthor(author) {
    document.listForm.authorCode.value = author;
    document.listForm.action = "<c:url value='/sec/ram/EgovAuthor.do'/>";
    document.listForm.submit();
}

function fncAddAuthorInsert() {
    location.replace("<c:url value='/sec/ram/EgovAuthorInsertView.do'/>");
}

function fncAuthorDeleteList() {

    if(fncManageChecked()) {
        if(confirm("삭제하시겠습니까?")) {
            document.listForm.action = "<c:url value='/sec/ram/EgovAuthorListDelete.do'/>";
            document.listForm.submit();
        }
    }
}

function fncAddAuthorView() {
    document.listForm.action = "<c:url value='/sec/ram/EgovAuthorUpdate.do'/>";
    document.listForm.submit();
}

function fncSelectAuthorRole(author) {
    document.listForm.searchKeyword.value = author;
    document.listForm.action = "<c:url value='/sec/ram/EgovAuthorRoleList.do'/>";
    document.listForm.submit();
}

function linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sec/ram/EgovAuthorList.do'/>";
    document.listForm.submit();
}


function press() {

    if (event.keyCode==13) {
    	fncSelectAuthorList('1');
    }
}


-->
</script>
 


<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">권한관리</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>

	<form:form name="listForm" action="${pageContext.request.contextPath}/sec/ram/EgovAuthorList.do" method="post">
	<div class="row">
		<div class="col-lg-6">
			<bt:inputgroup name="searchKeyword" label="권한명" value="${authorManageVO.searchKeyword}" onkeypress="press();"/>
<%-- 			<div class="form-group">
			<label for="inputType" class="col-md-2 control-label">권한명</label>
			<div class="col-md-10">
			<input class="form-control" name="searchKeyword" type="text" value="<c:out value='${authorManageVO.searchKeyword}'/>" onkeypress="press();">
			</div>
			</div> --%>
		</div>
	
		<div class="col-lg-6">
			<button type="button" class="btn btn-info" onclick="javascript:fncSelectAuthorList('1')">조회</button>
			<button type="button" class="btn btn-primary" onclick="javascript:fncAddAuthorInsert()">등록</button>
			<button type="button" class="btn btn-danger" onclick="javascript:fncAuthorDeleteList()">삭제</button>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">권한관리</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>
										<bt:checkbox cssClass="checkbox-primary" name="checkAll" label="전체선택" onclick="javascript:fncCheckAll()"/>
									</th>
									<th>권한 ID</th>
									<th>권한명</th>
									<th>설명</th>
									<th>등록일자</th>
									<th>롤 정보</th>
								</tr>
							</thead>
							<tbody>
								 <c:forEach var="author" items="${authorList}" varStatus="status">
								  <tr>
								    <td width="10%">
								    <bt:checkbox cssClass="checkbox-danger" name="delYn" label="삭제" />
								    <input type="hidden" name="checkId" value="<c:out value="${author.authorCode}"/>" />
								    </td>
								    <td width="20%"><a href="#LINK" onclick="javascript:fncSelectAuthor('<c:out value="${author.authorCode}"/>')"><c:out value="${author.authorCode}"/></a></td>
								    <td width="20%"><c:out value="${author.authorNm}"/></td>
								    <td width="20%"><c:out value="${author.authorDc}"/></td>
								    <td width="20%"><c:out value="${author.authorCreatDe}"/></td>
								    <td width="10%">
								    <button type="button" class="btn btn-default btn-circle" onclick="javascript:fncSelectAuthorRole('<c:out value="${author.authorCode}"/>')"><i class="fa fa-search-plus"></i></button>
								    <%-- <a href="#LINK" onclick="javascript:fncSelectAuthorRole('<c:out value="${author.authorCode}"/>')"><img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif'/>" width="15" height="15" align="middle" alt="롤 정보"></a> --%>
								    </td>
								  </tr>
								 </c:forEach>
							</tbody>
						</table>


							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td height="10"></td>
								</tr>
							</table>

							<c:if test="${!empty authorManageVO.pageIndex }">
								<div align="center">
									<div>
										<ui:pagination paginationInfo="${paginationInfo}"
											type="default" jsFunction="linkPage" />
									</div>
									<div align="right">
										<input type="text" name="message"
											value="<c:out value='${message}'/>" size="30"
											readonly="readonly" title="메시지" />
									</div>
								</div>
							</c:if>
							<input type="hidden" name="authorCode" /> <input type="hidden"
								name="authorCodes" /> <input type="hidden" name="pageIndex"
								value="<c:out value='${authorManageVO.pageIndex}'/>" /> <input
								type="hidden" name="searchCondition" />

						</div>
					<!-- /.table-responsive -->
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
	</div>
	<!-- /.row -->
	</form:form>
</div>
<!-- /#page-wrapper -->