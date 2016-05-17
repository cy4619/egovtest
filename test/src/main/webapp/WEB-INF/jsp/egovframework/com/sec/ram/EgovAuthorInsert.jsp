<%--
/**
 * @Class Name  : EgovAuthorInsert.java
 * @Description : EgovAuthorInsert jsp
 * @Modification Information
 * @
 * @  수정일         수정자          수정내용
 * @ -------    --------    ---------------------------
 * @ 2009.02.01    lee.m.j          최초 생성
 *
 *  @author lee.m.j
 *  @since 2009.03.11
 *  @version 1.0
 *  @see
 *
 */
--%>

<c:set var="registerFlag" value="${empty authorManageVO.authorCode ? 'INSERT' : 'UPDATE'}"/>
<c:set var="registerFlagName" value="${empty authorManageVO.authorCode ? '권한 등록' : '권한 수정'}"/>

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="authorManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
<!--
function fncSelectAuthorList() {
	var varFrom = document.getElementById("authorManage");
	varFrom.action = "<c:url value='/sec/ram/EgovAuthorList.do'/>";
	varFrom.submit();
}

function fncAuthorInsert() {

    var varFrom = document.getElementById("authorManage");
    varFrom.action = "<c:url value='/sec/ram/EgovAuthorInsert.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateAuthorManage(varFrom)){
            return;
        }else{
            varFrom.submit();
        }
    }
}

function fncAuthorUpdate() {
	var varFrom = document.getElementById("authorManage");
	varFrom.action = "<c:url value='/sec/ram/EgovAuthorUpdate.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateAuthorManage(varFrom)){
            return;
        }else{
            varFrom.submit();
        }
    }
}

function fncAuthorDelete() {
	var varFrom = document.getElementById("authorManage");
	varFrom.action = "<c:url value='/sec/ram/EgovAuthorDelete.do'/>";
	if(confirm("삭제 하시겠습니까?")){
	    varFrom.submit();
	}
}
//-->
</script>

<form:form commandName="authorManage" method="post">
		<div id="page-wrapper" style="min-height: 616px;">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">권한등록</h1>
                </div>
            </div>
            <div class="row">
                <!-- /.col-lg-12 -->
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="panel-title pull-left">
							권한을 등록후 권한계층 설정을 해주시기 바랍니다.
							</div>
							<div class="pull-right">
									<button type="button" class="btn btn-info" onclick="javascript:fncSelectAuthorList()">목록</button>
							    <c:if test="${registerFlag == 'INSERT'}">
									<button type="button" class="btn btn-primary" onclick="javascript:fncAuthorInsert()">등록</button>
								</c:if>
      							<c:if test="${registerFlag == 'UPDATE'}">
      								<button type="button" class="btn btn-orange" onclick="javascript:fncAuthorUpdate()">수정</button>
									<button type="button" class="btn btn-danger" onclick="javascript:fncAuthorDelete()">삭제</button>
      							</c:if>								
	                		</div>  
	                		 <div class="clearfix"></div>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-12">
										<bt:inputgroup name="authorCode" value="${authorManage.authorCode}" label="권한  코드" placeholder=""/>
										<form:errors path="authorCode" />
										<bt:inputgroup name="authorNm" value="${authorManage.authorNm}" label="권한 명" placeholder=""/>
										<form:errors path="authorNm" />
										<bt:inputgroup name="authorDc" value="${authorManage.authorDc}" label="권한 설명" placeholder=""/>
										<bt:inputgroup name="authorCreatDe" value="${authorManage.authorCreatDe}" label="등록일자" placeholder="" readonly="true"/>					
								</div>
							</div>
							<!-- /.row (nested) -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
			</div>

			<!-- 검색조건 유지 -->
			<c:if test="${registerFlag == 'UPDATE'}">
			<input type="hidden" name="searchCondition" value="<c:out value='${authorManageVO.searchCondition}'/>"/>
			<input type="hidden" name="searchKeyword" value="<c:out value='${authorManageVO.searchKeyword}'/>"/>
			<input type="hidden" name="pageIndex" value="<c:out value='${authorManageVO.pageIndex}'/>"/>
			</c:if>
			</form:form>
			    <div align="right">
			        <input type="text" name="message" value="<c:out value='${message}'/>" size="30" readonly="readonly" title="메시지" />
			    </div>

		</div><!-- /.page-wrapper -->