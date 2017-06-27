<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="false" buffer="none" %>
<%@ page import="org.eclipse.birt.report.utility.ParameterAccessor,
				 org.eclipse.birt.report.context.BaseAttributeBean,
				 org.eclipse.birt.report.context.ScalarParameterBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>				 

<jsp:useBean id="attributeBean" type="org.eclipse.birt.report.context.BaseAttributeBean" scope="request" />
<%
	ScalarParameterBean parameterBean = (ScalarParameterBean) attributeBean.getParameterBean();
	String encodedParameterName = ParameterAccessor.htmlEncode(parameterBean.getName());
	String value = parameterBean.getValue();
	
%>
<c:if test="${empty value}">
	<INPUT TYPE="HIDDEN" ID="control_type" VALUE="hidden">
	<INPUT TYPE="HIDDEN"
		NAME="<%= encodedParameterName %>"
		VALUE="<%= ParameterAccessor.htmlEncode(value) %>"/>
	<INPUT TYPE="HIDDEN"
		ID="<%= encodedParameterName + "_displayText" %>"
		VALUE="<%= ParameterAccessor.htmlEncode((parameterBean.getDisplayText() == null)? "" : parameterBean.getDisplayText()) %>" />		
</c:if>