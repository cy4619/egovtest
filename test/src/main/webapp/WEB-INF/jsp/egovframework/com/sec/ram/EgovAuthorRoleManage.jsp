<%

/**
 * @Class Name : EgovAuthorRoleManage.java
 * @Description : EgovAuthorRoleManage.jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2009.02.01    lee.m.j     최초 생성
 *
 *  @author lee.m.j
 *  @since 2009.03.21
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
    var checkRegYn = document.listForm.regYn;
    var returnValue = "";
    var returnRegYns = "";
    var checkedCount = 0;
    var returnBoolean = false;

    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i<checkField.length; i++) {
                if(checkField[i].checked) {
                	checkedCount++;
                    checkField[i].value = checkId[i].value;

	                if(returnValue == "") {
	                    returnValue = checkField[i].value;
	                    returnRegYns = checkRegYn[i].value;
	                }
	                else {
	                    returnValue = returnValue + ";" + checkField[i].value;
	                    returnRegYns = returnRegYns + ";" + checkRegYn[i].value;
	                }
                }
            }

            if(checkedCount > 0)
            	returnBoolean = true;
            else {
                alert("선택된  롤이 없습니다.");
                returnBoolean = false;
            }
        } else {
        	 if(document.listForm.delYn.checked == false) {
                alert("선택된 롤이 없습니다.");
            	returnBoolean = false;
            }
            else {
            	returnValue = checkId.value;
                returnRegYns = checkRegYn.value;

                returnBoolean = true;
            }
        }
    } else {
        alert("조회된 결과가 없습니다.");
    }

    document.listForm.roleCodes.value = returnValue;
    document.listForm.regYns.value = returnRegYns;

    return returnBoolean;

}

function fncSelectAuthorRoleList() {
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = "1";
    document.listForm.action = "<c:url value='/sec/ram/EgovAuthorRoleList.do'/>";
    document.listForm.submit();
}

function fncSelectAuthorList(){
   // document.listForm.searchCondition.value = "1";
   // document.listForm.pageIndex.value = "1";
    document.listForm.searchKeyword.value = "";
    document.listForm.action = "<c:url value='/sec/ram/EgovAuthorList.do'/>";
    document.listForm.submit();
}

function fncSelectAuthorRole(roleCode) {
    document.listForm.roleCode.value = roleCode;
    document.listForm.action = "<c:url value='/sec/ram/EgovRole.do'/>";
    document.listForm.submit();
}

function fncAddAuthorRoleInsert() {
	if(fncManageChecked()) {
	    if(confirm("등록하시겠습니까?")) {
            document.listForm.action = "<c:url value='/sec/ram/EgovAuthorRoleInsert.do'/>";
            document.listForm.submit();
	    }
	} else return;
}

function linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sec/ram/EgovAuthorRoleList.do'/>";
    document.listForm.submit();
}


function press() {

    if (event.keyCode==13) {
    	fncSelectAuthorRoleList();
    }
}
-->
</script>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">권한롤관리</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>

<form:form name="listForm" action="${pageContext.request.contextPath}/sec/ram/EgovAuthorRoleList.do" method="post">
	<div class="row">
		<div class="col-lg-6">
			<bt:inputgroup name="searchKeyword" label="권한명" value="${authorRoleManageVO.searchKeyword}" onkeypress="press();" readonly="true" />
		</div>
		<div class="col-lg-6">
			<button type="button" class="btn btn-info" onclick="javascript:fncSelectAuthorList()">목록</button>
			<button type="button" class="btn btn-info" onclick="javascript:fncSelectAuthorRoleList()">조회</button>
			<button type="button" class="btn btn-primary" onclick="javascript:fncAddAuthorRoleInsert()">등록</button>
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
									<th>롤 ID</th>
									<th>롤 명</th>
									<th>롤 타입</th>
									<th>롤 Sort</th>
									<th>롤 설명</th>
									<th>등록일자</th>
									<th>등록여부</th>
								</tr>
							</thead>
							<tbody>
							  <%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
								<c:if test="${fn:length(authorRoleList) == 0}">
								<tr>
								<td  colspan="9">
									<spring:message code="common.nodata.msg" />
								</td>
								</tr>
								</c:if>
								
								  <c:forEach var="authorRole" items="${authorRoleList}" varStatus="status">
								  <tr>
								    <td width="10%">
								    <bt:checkbox cssClass="checkbox-danger" name="delYn" label="삭제" />
								    <input type="hidden" name="checkId" value="<c:out value="${authorRole.roleCode}"/>" />
								    </td>
								    <td width="15%"><c:out value="${authorRole.roleCode}"/></td>
								    <td width="15%"><c:out value="${authorRole.roleNm}"/></td>
								    <td width="5%"><c:out value="${authorRole.roleTyp}"/></td>
								    <td width="5%"><c:out value="${authorRole.roleSort}"/></td>
								    <td width="25%"><c:out value="${authorRole.roleDc}"/></td>
								    <td width="15%"><c:out value="${authorRole.creatDt}"/></td>
								    <td width="20%">
								    <div class="form-group">
							        <select name="regYn" title="등록여부" class="form-control">
							            <option value="Y" <c:if test="${authorRole.regYn == 'Y'}">selected</c:if> >등록</option>
							            <option value="N" <c:if test="${authorRole.regYn == 'N'}">selected</c:if> >미등록</option>
							        </select>
							        </div>
								    </td>
								  </tr>
								 </c:forEach>
							</tbody>
						</table>
	
						<c:if test="${!empty authorRoleManageVO.pageIndex }">
						<div align="center">
						    <div>
						        <ui:pagination paginationInfo = "${paginationInfo}"
						            type="default"
						            jsFunction="linkPage"
						            />
						    </div>
						    <div align="right">
						        <input type="text" name="message" value="<c:out value='${message}'/>" size="30" readonly="readonly" title="메시지"/>
						    </div>
						</div>
						</c:if>
						<input type="hidden" name="roleCodes"/>
						<input type="hidden" name="regYns"/>
						<input type="hidden" name="pageIndex" value="<c:out value='${authorRoleManageVO.pageIndex}'/>"/>
						<input type="hidden" name="authorCode" value="<c:out value="${authorRoleManageVO.searchKeyword}"/>"/>
						<input type="hidden" name="searchCondition"/>

						</div>
					<!-- /.table-responsive -->
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
	</div>
</form:form>	
</div>