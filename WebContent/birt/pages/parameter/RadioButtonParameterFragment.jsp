<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="false" buffer="none" %>
<%@ page import="org.eclipse.birt.report.context.ScalarParameterBean,
				 org.eclipse.birt.report.context.BaseAttributeBean,
				 org.eclipse.birt.report.service.api.ParameterSelectionChoice,
				 org.eclipse.birt.report.utility.ParameterAccessor,
				 org.eclipse.birt.report.utility.DataUtil,
				 org.eclipse.birt.report.IBirtConstants" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="attributeBean" type="org.eclipse.birt.report.context.BaseAttributeBean" scope="request" />
<%
	ScalarParameterBean parameterBean = ( ScalarParameterBean ) attributeBean.getParameterBean( );
	String encodedParameterName = ParameterAccessor.htmlEncode( parameterBean.getName( ) );
	boolean isDisplayTextInList = parameterBean.isDisplayTextInList( );
%>

<div class="form-group">
	<label for="${encodedParameterName}" class="col-sm-4 control-label">
   		<%=parameterBean.getDisplayName() != null ? parameterBean.getDisplayName() : parameterBean.getToolTip() %>
   		<c:if test="${parameterBean.isRequired()}">
   			<FONT COLOR="red">*</FONT>
   		</c:if>
   	</label>
   	<div class="col-sm-8">
		<div class="radio">
			<INPUT TYPE="HIDDEN" ID="control_type" VALUE="radio">
			<INPUT TYPE="HIDDEN" ID="data_type" VALUE="<%="" + parameterBean.getParameter( ).getDataType( ) %>">
			<label>
				<%
					if (parameterBean.getSelectionList( ) != null) {
						boolean CHECKED = false;
						boolean isSelected = false;
						for ( int i = 0; i < parameterBean.getSelectionList( ).size( ); i++ )
						{
							ParameterSelectionChoice selectionItem = ( ParameterSelectionChoice )parameterBean.getSelectionList( ).get( i );						
							String label = selectionItem.getLabel( );
							String value = ( String ) selectionItem.getValue( );
							String encodedValue = ParameterAccessor.htmlEncode(( value == null )?IBirtConstants.NULL_VALUE:value);
							
							CHECKED = ( DataUtil.equals( parameterBean.getValue( ), value )
										&& ( !isDisplayTextInList || ( isDisplayTextInList && label.equals( parameterBean.getDisplayText( ) ) ) ) );						
				%>
					<INPUT TYPE="RADIO"
							NAME="<%= encodedParameterName %>"
							ID="<%= encodedParameterName + i %>" 
							TITLE="<%= parameterBean.getToolTip( ) %>"
							VALUE="<%= encodedValue %>"
							<%= !isSelected && CHECKED ? "CHECKED" : "" %>>
					<%= ParameterAccessor.htmlEncode( label ) %>
					<%
							if( CHECKED )
							{
								isSelected = true;
								%><script type="text/javascript">
									document.getElementById("id_" + "<%= parameterBean.getName()%>")
										.setAttribute("FOR", "<%= encodedParameterName + i %>");
								</script><%
							}
						}
					}
				%>
			</label>
		</div>
	</div>
</div>