<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="false" buffer="none" %>
<%@ page import="org.eclipse.birt.report.utility.ParameterAccessor,
				 org.eclipse.birt.report.context.BaseAttributeBean,
				 org.eclipse.birt.report.context.ScalarParameterBean" %>
<jsp:useBean id="attributeBean" type="org.eclipse.birt.report.context.BaseAttributeBean" scope="request" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	ScalarParameterBean parameterBean = (ScalarParameterBean) attributeBean.getParameterBean();
	String encodedParameterName = ParameterAccessor.htmlEncode( parameterBean.getName());
%>
<div class="form-group">
   	<label for="${encodedParameterName}" class="col-sm-4 control-label">
   		<%=parameterBean.getDisplayName() != null ? parameterBean.getDisplayName() : parameterBean.getToolTip() %>
   		
   		<% if(parameterBean.isRequired()) {%>
   			<FONT COLOR="red">*</FONT>
   		<% }%>	
   	</label>
    <div class="col-sm-8">
    	<input type="hidden" id="control_type" value="text"/>
    	<input type="hidden" id="data_type" value="<%="" + parameterBean.getParameter().getDataType()%>"/>
    	
    	<%
			if(!parameterBean.isRequired()) {
		%>
		<label class="radio-inline" for="<%= encodedParameterName + "_radio_notnull" %>">
			<input type="radio" name="<%=encodedParameterName + "_radio"%>" id="<%= encodedParameterName + "_radio_notnull" %>" value="<%=encodedParameterName%>" <%=(parameterBean.getValue() != null)? "checked" : "" %>/>
			请输入
		</label>
		<%}%>	
		<INPUT CLASS="form-control" style="display:inline-block;width:auto;"
			TYPE="<%= parameterBean.isValueConcealed()? "PASSWORD" : "TEXT" %>"
			NAME="<%= encodedParameterName %>"
			ID="<%= encodedParameterName %>" 
			TITLE="<%= parameterBean.getToolTip( ) %>"
			VALUE="<%= ParameterAccessor.htmlEncode( ( parameterBean.getDisplayText( ) == null )? "" : parameterBean.getDisplayText( ) ) %>" 
			<%= ( !parameterBean.isRequired( ) && parameterBean.getValue( ) == null )? "DISABLED='true'" : "" %>
			<%= parameterBean.isRequired( ) ? "aria-required='true'" : "" %>
            >

		<INPUT TYPE="HIDDEN"
			ID="<%= encodedParameterName + "_value" %>"
			VALUE="<%= ParameterAccessor.htmlEncode( ( parameterBean.getValue( ) == null )? "" : parameterBean.getValue( ) ) %>"
			>
		
		<INPUT TYPE="HIDDEN"
			ID="<%= encodedParameterName + "_displayText" %>"
			VALUE="<%= ParameterAccessor.htmlEncode((parameterBean.getDisplayText() == null )? "" : parameterBean.getDisplayText( ) ) %>"
			>
			
		<% if(!parameterBean.isRequired()) {%>
			<label class="radio-inline" for="<%= encodedParameterName + "_radio_null" %>">
				<input name="<%=encodedParameterName + "_radio"%>" type="radio" id="<%= encodedParameterName + "_radio_null" %>" value="<%=encodedParameterName%>" ${empty parameterBean.getValue()?"checked" : ""}/>
				设置为空
			</label>
		<% }%>
		<input type="hidden" id="isRequired" value="<%=parameterBean.isRequired()? "true": "false"%>"/>
    </div>
</div>
