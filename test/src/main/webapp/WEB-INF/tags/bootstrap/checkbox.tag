<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="cssClass"%>
<%@ attribute name="name"%>
<%@ attribute name="label"%>
<%@ attribute name="onclick"%>
<div class="checkbox ${cssClass } checkbox-inline">
	<input name="${name }" type="checkbox" onclick="${onclick}"/>
    <label for="${name }">
     	${label}
    </label>
</div>