<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="false" buffer="none" %>
<%@ page import="org.eclipse.birt.report.context.ScalarParameterBean,
				 org.eclipse.birt.report.context.BaseAttributeBean,
				 org.eclipse.birt.report.utility.ParameterAccessor" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="attributeBean" type="org.eclipse.birt.report.context.BaseAttributeBean" scope="request" />
<%
	ScalarParameterBean parameterBean = ( ScalarParameterBean ) attributeBean.getParameterBean( );
	String encodedParameterName = ParameterAccessor.htmlEncode( parameterBean.getName( ) );
%>
<div class="form-group">
	<label for="${encodedParameterName}" class="col-sm-4 control-label">
   		<%=parameterBean.getDisplayName() != null ? parameterBean.getDisplayName() : parameterBean.getToolTip() %>
   		
   		<c:if test="${parameterBean.isRequired()}">
   			<FONT COLOR="red">*</FONT>
   		</c:if>
   	</label>
   	<div class="col-sm-8">
   		<INPUT TYPE="HIDDEN" ID="control_type" VALUE="checkbox">
		<INPUT TYPE="HIDDEN"
			ID="<%= encodedParameterName + "_hidden" %>"
			NAME="<%= encodedParameterName %>"
			VALUE="<%= parameterBean.getValue( ) %>">
		<div class="checkbox">
			<label>
					<INPUT TYPE="CHECKBOX"
							ID="<%= encodedParameterName %>"
							TITLE="<%= parameterBean.getToolTip() %>"
							VALUE="<%= encodedParameterName %>"
							<%= "true".equalsIgnoreCase( parameterBean.getValue( ) ) ? "CHECKED" : "" %>
							> 
					<c:out value="${parameterBean.getToolTip()}"></c:out>
			</label>
		</div>
	</div>
</div>