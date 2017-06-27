<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="false" buffer="none" %>
<%@ page import="org.eclipse.birt.report.presentation.aggregation.IFragment" %>

<%-----------------------------------------------------------------------------
	Expected java beans
-----------------------------------------------------------------------------%>
<jsp:useBean id="fragment" type="org.eclipse.birt.report.presentation.aggregation.IFragment" scope="request" />

<TR VALIGN='top'>
	<TD id="documentView">
		<TABLE cellpadding="0" cellspacing="0" border="0" style="width:100%;">
		<TR>
			<TD style="vertical-align: top;">
				<%
					if ( fragment != null )
					{
						fragment.callBack( request, response );
					}
				%>
			</TD>
			<TD style="vertical-align: top;">
				<DIV ID="Document" CLASS="birtviewer_document_fragment">
				</DIV>
			</TD>
		</TR>
		</TABLE>
	</TD>
</TR>