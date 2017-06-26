<%@ page contentType="text/html; charset=utf-8"%>
<%@ page session="false" buffer="none"%>
<%@ page import="org.eclipse.birt.report.presentation.aggregation.IFragment,
				 org.eclipse.birt.report.utility.ParameterAccessor,
				 org.eclipse.birt.report.resource.BirtResources"%>
<jsp:useBean id="fragment" type="org.eclipse.birt.report.presentation.aggregation.IFragment" scope="request" />

<%
	String[] supportedFormats = ParameterAccessor.supportedFormats;
%>
<div class="row">
	<div class="col-sm-10 col-sm-offset-1">
		<div class="form-horizontal">
			<div class="form-group">
		    	<label for="exportFormat" class="col-sm-4 control-label"><%=BirtResources.getMessage("birt.viewer.dialog.export.format")%></label>
			    <div class="col-sm-8">
			    	<select class="form-control" id="exportFormat" name="exportFormat">
			    		<%
							ParameterAccessor.sortSupportedFormatsByDisplayName(supportedFormats);
			    			for(int i = 0; i < supportedFormats.length; i++) {
			    				if (!ParameterAccessor.PARAM_FORMAT_HTML.equalsIgnoreCase(supportedFormats[i])) {
		    			%>
		    			<option value="<%=supportedFormats[i]%>"><%=ParameterAccessor.getOutputFormatLabel(supportedFormats[i])%></option>
		    			<%
							}
						}
						%>
			    	</select>
			    </div>
		  	</div>
		  	<div class="form-group">
		  		<label for="exportFormat" class="col-sm-4 control-label"><%=BirtResources.getMessage("birt.viewer.dialog.page")%></label>
			    <div class="col-sm-8" id="exportPageSetting">
					<label class="radio-inline">
						<input type="radio" id="exportPageAll" name="exportPages" checked>
						<%=BirtResources.getHtmlMessage("birt.viewer.dialog.page.all")%>
					</label>
					<label class="radio-inline">
						<input type="radio" id="exportPageCurrent" name="exportPages">
						<%=BirtResources.getHtmlMessage("birt.viewer.dialog.page.current")%>
					</label>
					<label class="radio-inline" style="display:none;">
						<input type="radio" id="exportPageRange" name="exportPages">
						<%=BirtResources.getHtmlMessage("birt.viewer.dialog.page.range")%>
						<input type="text" id="exportPageRange_input" class="form-control" style="display:inline-block;width:150px;" name="exportPages" disabled="disabled">
					</label>
				</div>
		  	</div>
		  	
		  	<div class="form-group" id="exportFitSetting">
		  		<label for="exportFormat" class="col-sm-4 control-label"><%=BirtResources.getMessage("birt.viewer.dialog.export.pdf.fitto")%></label>
			    <div class="col-sm-8">
					<label class="radio-inline">
						<input type="radio" id="exportFitToAuto" name="exportFit" checked>
						<%=BirtResources.getHtmlMessage("birt.viewer.dialog.export.pdf.fittoauto")%>
					</label>
					<label class="radio-inline">
						<input type="radio" id="exportFitToActual" name="exportFit">
						<%=BirtResources.getHtmlMessage("birt.viewer.dialog.export.pdf.fittoactual")%>
					</label>
					<label class="radio-inline">
						<input type="radio" id="exportFitToWhole" name="exportFit">
						<%=BirtResources.getHtmlMessage("birt.viewer.dialog.export.pdf.fittowhole")%>
					</label>
				</div>
		  	</div>
		</div>
	</div>
</div>
