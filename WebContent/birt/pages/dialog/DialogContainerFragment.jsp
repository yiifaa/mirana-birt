<%--
	对话框模板
--%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="false" buffer="none" %>
<%@ page import="org.eclipse.birt.report.presentation.aggregation.IFragment,
				 org.eclipse.birt.report.context.BaseAttributeBean,
				 org.eclipse.birt.report.IBirtConstants,
				 org.eclipse.birt.report.utility.ParameterAccessor,
				 org.eclipse.birt.report.resource.BirtResources" %>

<jsp:useBean id="fragment" type="org.eclipse.birt.report.presentation.aggregation.IFragment" scope="request" />
<jsp:useBean id="attributeBean" type="org.eclipse.birt.report.context.BaseAttributeBean" scope="request" />

<div class="modal fade" tabindex="-1" role="dialog" id="<%= fragment.getClientId()%>">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" id="<%= fragment.getClientId() %>dialogTitleBar">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="<%= fragment.getClientId() %>dialogCloseBtn"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><%= fragment.getTitle() %></h4>
      </div>
      <div class="modal-body" id="<%= fragment.getClientId() %>dialogContentContainer">
        <%
			if (fragment != null) {
				fragment.callBack(request, response);
			}
		%>
      </div>
      <div class="modal-footer">
	      		<div id="<%= fragment.getClientId( ) %>dialogCustomButtonContainer" class="dialogBtnBarButtonContainer ">
					<div id="<%= fragment.getClientId() %>cancelButton" style="float:right;">
						<div class="dialogBtnBarButtonLeftBackgroundEnabled"></div>
						<div class="dialogBtnBarButtonRightBackgroundEnabled"></div>
						<input class="btn btn-default" type="button" value="<%= BirtResources.getHtmlMessage( "birt.viewer.dialog.cancel" )%>" 
							title="<%= BirtResources.getHtmlMessage( "birt.viewer.dialog.cancel" )%>"  
							class="dialogBtnBarButtonText dialogBtnBarButtonEnabled"/>
					</div>
					
					<div class="dialogBtnBarDivider"></div> 
					
					<div id="<%= fragment.getClientId( ) %>okButton" style="float:right;margin-right:15px;">
						<div id="<%= fragment.getClientId( ) %>okButtonLeft" class="dialogBtnBarButtonLeftBackgroundEnabled"></div>
						<div id="<%= fragment.getClientId( ) %>okButtonRight" class="dialogBtnBarButtonRightBackgroundEnabled"></div>
						<input type="button" class="btn btn-primary" value="<%= BirtResources.getHtmlMessage( "birt.viewer.dialog.ok" ) %>" 
							title="<%= BirtResources.getHtmlMessage("birt.viewer.dialog.ok" ) %>"  
							class="dialogBtnBarButtonText dialogBtnBarButtonEnabled"/>
					</div>				
					
				</div>		
      </div>
    </div>
  </div>
</div>