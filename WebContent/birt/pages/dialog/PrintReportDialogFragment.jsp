<%@ page contentType="text/html; charset=utf-8"%>
<%@ page session="false" buffer="none"%>
<%@ page import="org.eclipse.birt.report.presentation.aggregation.IFragment,
				 org.eclipse.birt.report.resource.BirtResources"%>
<jsp:useBean id="fragment" type="org.eclipse.birt.report.presentation.aggregation.IFragment" scope="request" />


<div class="row">
	<div class="col-sm-10 col-sm-offset-1">
		<div class="form-horizontal">
				<div class="form-group" id="printFormatSetting">
					<label for="printAsHTML" class="col-sm-4 control-label"><%=BirtResources.getMessage("birt.viewer.dialog.print.format")%></label>
				    <div class="col-sm-8">
						<div class="radio">
							<label> 
								<input type="radio" name="printFormat" id="printAsHTML" checked>
								<%=BirtResources.getMessage("birt.viewer.dialog.print.format.html")%>
							</label>
						</div>
						<div>
							<label> 
								<input type="radio" name="printFormat" id="printAsPDF">
								<%=BirtResources.getMessage("birt.viewer.dialog.print.format.pdf")%>
							</label>
							<SELECT	ID="printFitSetting" CLASS="form-control" DISABLED="true" style="display:inline-block;width:auto;">
								<option value="0" selected><%=BirtResources.getMessage( "birt.viewer.dialog.export.pdf.fittoauto" )%></option>
								<option value="1"><%=BirtResources.getMessage( "birt.viewer.dialog.export.pdf.fittoactual" )%></option>
								<option value="2"><%=BirtResources.getMessage( "birt.viewer.dialog.export.pdf.fittowhole" )%></option>
							</SELECT>
						</div>
					</div>
				</div>
			
				<div class="form-group" id="printPageSetting">
					<label for="exportPages" class="col-sm-4 control-label"><%=BirtResources.getMessage("birt.viewer.dialog.page")%></label>
				    <div class="col-sm-8">
				    	<label class="radio-inline">
							<input type="radio" name="printPages" id="printPageAll" checked>
							<%=BirtResources.getMessage("birt.viewer.dialog.page.all")%>
						</label>
						<label class="radio-inline">
							<input type="radio" name="printPages" id="printPageCurrent">
							<%=BirtResources.getMessage("birt.viewer.dialog.page.current")%>
						</label>
						<INPUT TYPE="hidden" CLASS="birtviewer_printreport_dialog_input" ID="printPageRange_input" DISABLED="true"/>
					</div>
				</div>				
		</div>
	</div>
</div>