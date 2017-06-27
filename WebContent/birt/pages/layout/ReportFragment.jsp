<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="false" buffer="none" %>
<%@ page import="org.eclipse.birt.report.presentation.aggregation.IFragment" %>

<jsp:useBean id="fragment" type="org.eclipse.birt.report.presentation.aggregation.IFragment" scope="request" />
<%-- 修复table位置 --%>
<table style="width: 100%;">
	<tr>
		<%
			if (fragment != null) {
				fragment.callBack(request, response);
			}
		%>	
	</tr>
</table>

