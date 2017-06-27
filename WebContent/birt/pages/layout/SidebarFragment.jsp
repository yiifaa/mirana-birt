<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="false" buffer="none" %>
<%@ page import="org.eclipse.birt.report.presentation.aggregation.IFragment" %>
<jsp:useBean id="fragment" type="org.eclipse.birt.report.presentation.aggregation.IFragment" scope="request" />

<TD ID='sidebar' STYLE='width:0%;vertical-align:top'>
<%
	if ( fragment != null )
	{
		fragment.callBack( request, response );
	}
%>
</TD>