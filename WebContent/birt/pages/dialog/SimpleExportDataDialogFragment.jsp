<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="false" buffer="none" %>
<%@ page import="org.eclipse.birt.report.presentation.aggregation.IFragment,
				 org.eclipse.birt.report.utility.ParameterAccessor,
				 org.eclipse.birt.report.context.BaseAttributeBean,
				 org.eclipse.birt.report.engine.api.DataExtractionFormatInfo,
				 org.eclipse.birt.report.resource.BirtResources" %>
<jsp:useBean id="fragment" type="org.eclipse.birt.report.presentation.aggregation.IFragment" scope="request" />
<jsp:useBean id="attributeBean" type="org.eclipse.birt.report.context.BaseAttributeBean" scope="request" />

<%
	DataExtractionFormatInfo[] dataExtractInfos = ParameterAccessor.supportedDataExtractions;
%>

<div class="row">
	<div class="col-sm-10 col-sm-offset-1">
		<div class="form-horizontal" id="simpleExportDialogBody">
			<div class="form-group">
		    	<label for="resultsets" class="col-sm-4 control-label"><%=BirtResources.getMessage("birt.viewer.dialog.exportdata.resultsets")%></label>
			    <div class="col-sm-8">
			    	<select class="form-control" id="resultsets">
			    	</select>
			    </div>
		  	</div>			
			<div class="form-group">
				<table class="table table-bordered">
					<tr>
						<td style="width:45%;">
							<LABEL for="availableColumnSelect"><%= BirtResources.getMessage( "birt.viewer.dialog.exportdata.availablecolumn" )%></LABEL>
						</td>
						<td></td>
						<td style="width:45%;">
							<LABEL FOR="selectedColumnSelect"><%= BirtResources.getMessage( "birt.viewer.dialog.exportdata.selectedcolumn" )%></LABEL>
						</td>
					</tr>
					<tr>
						<td>
							<SELECT ID="availableColumnSelect" MULTIPLE="true" SIZE="10" CLASS="form-control">
							</SELECT>
						</td>
						<td style="text-align:center;" id="action-buttons">
							<button class="btn btn-default btn-xs" name="Addall">
								<span class="glyphicon glyphicon-forward"></span>
							</button>
							<button class="btn btn-default btn-xs" name="Add">
								<span class="glyphicon glyphicon-triangle-right"></span>
							</button>
							<button class="btn btn-default btn-xs" name="Remove">
								<span class="glyphicon glyphicon-triangle-left"></span>
							</button>
							<button class="btn btn-default btn-xs" name="Removeall">
								<span class="glyphicon glyphicon-backward"></span>
							</button>
							<button class="btn btn-default btn-xs" name="Up">
								<span class="glyphicon glyphicon-triangle-top"></span>
							</button>
							<button class="btn btn-default btn-xs" name="Down">
								<span class="glyphicon glyphicon-triangle-bottom"></span>
							</button>
						</td>
						<td>
							<SELECT ID="selectedColumnSelect" MULTIPLE="true" SIZE="10" CLASS="form-control">
							</SELECT>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="form-group">
		    	<label for="exportDataExtension" class="col-sm-4 control-label"><%=BirtResources.getMessage("birt.viewer.dialog.exportdata.extension")%></label>
			    <div class="col-sm-8">
			    	<SELECT ID="exportDataExtension" CLASS="form-control">
						<%
							for ( int i = 0; i < dataExtractInfos.length; i++ )
							{
								DataExtractionFormatInfo extensionInfo  = dataExtractInfos[i];
								if( extensionInfo.getId() == null 
									|| extensionInfo.getFormat() == null 
									|| ( extensionInfo.isHidden() != null && extensionInfo.isHidden().booleanValue() ) )
									continue;
								
								String extensionName = extensionInfo.getName( );
								if( extensionName == null )
									extensionName = "";
						%>
								<OPTION VALUE="<%= extensionInfo.getId() %>"><%= extensionName %>(*.<%= extensionInfo.getFormat() %>)</OPTION>
						<%
							}
						%>
						</SELECT>
			    </div>
		  	</div>	
		  	
		  		
			<div class="form-group" id="exportDataEncodingSetting">
		    	<label for="exportDataEncoding_UTF8" class="col-sm-4 control-label"><%=BirtResources.getMessage("birt.viewer.dialog.exportdata.encoding")%></label>
			    <div class="col-sm-8">
			    	<label class="radio-inline">
						<input type="radio" name="exportDataEncoding" id="exportDataEncoding_UTF8" checked value="UTF-8">
						UTF-8
					</label>
					<label class="radio-inline">
						<input type="radio" name="exportDataEncoding" id="exportDataEncoding_GBK" value="GBK">
						GBK
					</label>
					
					<label class="radio-inline" style="display:none;">
						<input type="radio" name="exportDataEncoding" id="exportDataEncoding_other">
						<%=BirtResources.getMessage("birt.viewer.dialog.exportdata.encoding.other")%>
						<INPUT TYPE="text" NAME="exportDataOtherEncoding" ID="exportDataOtherEncoding_input" CLASS="birtviewer_exportdata_dialog_input" DISABLED="true">
					</label>
			    </div>
		  	</div>	
		  	
		  	<div class="form-group">
		    	<label for="exportDataCSVSeparator" class="col-sm-4 control-label"><%=BirtResources.getMessage("birt.viewer.dialog.exportdata.separator")%></label>
			    <div class="col-sm-8">
			    	<SELECT ID="exportDataCSVSeparator" CLASS="form-control">
						<OPTION VALUE="0" SELECTED><%= BirtResources.getMessage( "birt.viewer.sep.0" )%></OPTION>
						<OPTION VALUE="1"><%= BirtResources.getMessage( "birt.viewer.sep.1" )%></OPTION>
						<OPTION VALUE="2"><%= BirtResources.getMessage( "birt.viewer.sep.2" )%></OPTION>
						<OPTION VALUE="3"><%= BirtResources.getMessage( "birt.viewer.sep.3" )%></OPTION>
						<OPTION VALUE="4"><%= BirtResources.getMessage( "birt.viewer.sep.4" )%></OPTION>
					</SELECT>
			    </div>
		  	</div>
		  	
		  	<div class="form-group" style="display:none;">
			    <div class="col-sm-offset-4 col-sm-8">
			    	<div class="checkbox">
					  <label>
					    <input type="checkbox" id="exportColumnDataType">
					    <%= BirtResources.getMessage("birt.viewer.dialog.exportdata.datatype")%>
					  </label>
					</div>
					<div class="checkbox">
					  <label>
					    <input type="checkbox" id="exportColumnLocaleNeutral">
					    <%= BirtResources.getMessage("birt.viewer.dialog.exportdata.localeneutral")%>
					  </label>
					</div>
					<div class="checkbox">
					  <label>
					    <input type="checkbox" id="exportDataWithCR">
					    <%= BirtResources.getMessage("birt.viewer.dialog.exportdata.carriage_return")%>
					  </label>
					</div>
			    </div>
		  	</div>	
		</div>
	</div>
</div>
<style>
	#action-buttons > .btn {
		margin-bottom: 5px;
	}
	
	#action-buttons > .btn:last-child {
		margin-bottom: 0px;
	}
	
	#availableColumnSelect,  #selectedColumnSelect {
		height: 165px;
	}
</style>	