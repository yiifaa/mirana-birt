<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="false" buffer="none" %>
<%@ page import="org.eclipse.birt.report.presentation.aggregation.IFragment,
				 org.eclipse.birt.report.resource.BirtResources" %>
<jsp:useBean id="fragment" type="org.eclipse.birt.report.presentation.aggregation.IFragment" scope="request" />
<jsp:useBean id="attributeBean" type="org.eclipse.birt.report.context.BaseAttributeBean" scope="request" />

<div class="modal fade" tabindex="-1" role="dialog" id="progressBar">
	<div class="modal-dialog" role="document" style="width : 320px;">
		<div class="modal-content panel-primary">
			<div class="modal-header panel-heading">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h5 class="modal-title"><%= BirtResources.getMessage("birt.viewer.progressbar.prompt")%></h5>
			</div>
			<div class="modal-body">
				<p style="margin-top : 15px;">
					<IMG SRC="<%="birt/images/" + (attributeBean.isRtl()?"Loading_rtl":"Loading") + ".gif" %>" style="display:block; margin:0px auto;"/>
				</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-warning" data-dismiss="modal" id="cancelTaskButton" style="margin : 0px auto;">取消</button>
			</div>
		</div>
	</div>
	<input type="hidden" id="taskid" value=""/>
</div>
