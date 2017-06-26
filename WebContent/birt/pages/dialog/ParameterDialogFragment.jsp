<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="false" buffer="none" %>
<%@ page import="java.util.Iterator,
				 java.util.Collection,
 				 org.eclipse.birt.report.resource.BirtResources,
 				 org.eclipse.birt.report.presentation.aggregation.IFragment" %>
<jsp:useBean id="fragments" type="java.util.Collection" scope="request" />

<div class="row">
	<div class="col-sm-10 col-sm-offset-1">
		<h6 style="margin-top:0px;">
			<%
				if (fragments.size( ) <= 0) {
			%>
			<%= BirtResources.getMessage("birt.viewer.error.noparameter")%>
			<%
				} else {
			%>
			<%= BirtResources.getMessage("birt.viewer.required") %>
			<% } %>
		</h6>
		<form class="form-horizontal" id="parameter_table">
			<%
				if(fragments != null) {
					Iterator childIterator = fragments.iterator();
					while (childIterator.hasNext()) {
					    IFragment subfragment = (IFragment) childIterator.next();
						if (subfragment != null) {
							subfragment.service(request, response);
						}
					}
				}
			%>
		</form>
	</div>
</div>