<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="false" buffer="none" %>
<%@ page import="java.util.Iterator,
				 java.util.Collection,
 				 org.eclipse.birt.report.resource.BirtResources,
 				 org.eclipse.birt.report.presentation.aggregation.IFragment" %>
<jsp:useBean id="fragments" type="java.util.Collection" scope="request" />

<div class="modal fade" tabindex="-1" role="dialog" id="parameterDialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content panel-primary">
			<div class="modal-header panel-heading">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h5 class="modal-title"><%= BirtResources.getMessage("birt.viewer.progressbar.prompt")%></h5>
			</div>
			<div class="modal-body">
				<table class="table-borded table">
					<tr>
						<td></td>
					</tr>
					<%
					if ( fragments.size( ) <= 0 )
					{
					%>
						<TR>
							<TD><%= BirtResources.getMessage( "birt.viewer.error.noparameter" )%>
							</TD>
						</TR>
					<%
					}
					else
					{
					%>
						<TR><TD COLSPAN="2"><%= BirtResources.getMessage("birt.viewer.required")%></TD></TR>
					<%
						if ( fragments != null )
						{
							Iterator childIterator = fragments.iterator( );
							while ( childIterator.hasNext( ) )
							{
							    IFragment subfragment = ( IFragment ) childIterator.next( );
								if ( subfragment != null )
								{
									subfragment.service( request, response );
								}
							}
						}
					}
					%>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-warning" data-dismiss="modal" id="cancelTaskButton" style="margin : 0px auto;">取消</button>
			</div>
		</div>
	</div>
</div>