<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="cssClass"%>
<%@ attribute name="name"%>
<%@ attribute name="value"%>
<%@ attribute name="label"%>
<%@ attribute name="onclick"%>
<%@ attribute name="onkeypress"%>
<%@ attribute name="placeholder"%>
<%@ attribute name="readonly"%>
<div class="form-group input-group">
    <span class="input-group-addon">${label }</span>
    <c:choose>
        <c:when test="${readonly ne null}">
 		    <input id="${name }" type="text" name="${name }" class="form-control" placeholder="${placeholder }" value="<c:out value='${value }'/>" onkeypress="${onkeypress}" title="${label }" readonly="readonly">
    	</c:when>
    	<c:otherwise>
		    <input id="${name }" type="text" name="${name }" class="form-control" placeholder="${placeholder }" value="<c:out value='${value }'/>" onkeypress="${onkeypress}" title="${label }">
    	</c:otherwise>
    </c:choose>
</div>