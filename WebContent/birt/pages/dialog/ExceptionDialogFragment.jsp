<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="false" buffer="none" %>
<%@ page import="org.eclipse.birt.report.presentation.aggregation.IFragment,
				 org.eclipse.birt.report.resource.ResourceConstants,
				 org.eclipse.birt.report.resource.BirtResources"  %>
<jsp:useBean id="fragment" type="org.eclipse.birt.report.presentation.aggregation.IFragment" scope="request" />

<TABLE CELLSPACING="2" CELLPADDING="4" CLASS="birtviewer_exception_dialog_container" style="max-height:400px;">
	<TR>
		<TD>
		<DIV ID="faultStringContainer" CLASS="birtviewer_exception_dialog_message">
			<B><SPAN ID='faultstring'></SPAN><B>
		</DIV>
		</TD>
	</TR>
	<TR>
		<TD>
			<DIV ID="showTraceLabel" CLASS="birtviewer_exception_dialog_label">
				<%= BirtResources.getMessage( ResourceConstants.EXCEPTION_DIALOG_SHOW_STACK_TRACE ) %> 
			</DIV>																				
			<DIV ID="hideTraceLabel" CLASS="birtviewer_exception_dialog_label" STYLE="display:none">
				<%= BirtResources.getMessage( ResourceConstants.EXCEPTION_DIALOG_HIDE_STACK_TRACE ) %> 
			</DIV>									
		</TD>
	</TR>
	<TR>
		<TD>
			<DIV ID="exceptionTraceContainer" STYLE="display:none">
				<TABLE WIDTH="100%">
					<TR>
						<TD>
							<%= 
								BirtResources.getMessage( ResourceConstants.EXCEPTION_DIALOG_STACK_TRACE )
							%><BR>
						</TD>
					</TR>
					<TR>
						<TD>
							<DIV CLASS="birtviewer_exception_dialog_detail">
								<SPAN ID='faultdetail'></SPAN>
							</DIV>
						</TD>
					</TR>											
				</TABLE>
			</DIV>
		</TD>
	</TR>	
</TABLE>