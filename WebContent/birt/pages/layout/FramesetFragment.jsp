<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="false" buffer="none" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="org.eclipse.birt.report.presentation.aggregation.IFragment,
				 org.eclipse.birt.report.context.BaseAttributeBean,
				 org.eclipse.birt.report.resource.ResourceConstants,
				 org.eclipse.birt.report.resource.BirtResources,
				 org.eclipse.birt.report.utility.ParameterAccessor" %>
				 
<jsp:useBean id="fragment" type="org.eclipse.birt.report.presentation.aggregation.IFragment" scope="request" />
<jsp:useBean id="attributeBean" type="org.eclipse.birt.report.context.BaseAttributeBean" scope="request" />

<%
	String baseHref = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
	if(!attributeBean.isDesigner())
	{
		String baseURL = ParameterAccessor.getBaseURL();
		if(baseURL != null)
			baseHref = baseURL;
	}
	baseHref += request.getContextPath() + fragment.getJSPRootPath();
%>
<!doctype html>
<html lang="<%=ParameterAccessor.htmlEncode(attributeBean.getLanguage())%>">
	<head>
		<meta charset="UTF-8" />
		<title><%= ParameterAccessor.htmlEncode(attributeBean.getReportTitle()) %></title>
		<link rel="stylesheet" href="<c:url value='/birt/styles/style.css'/>" media="all" />
		<c:if test="attributeBean.isRtl()">
			<link rel="stylesheet" href="<c:url value='/birt/styles/dialogbase_rtl.css'/>" media="all" />
		</c:if>
		<c:if test="!attributeBean.isRtl()">
			<link rel="stylesheet" href="<c:url value='/birt/styles/dialogbase.css'/>" media="all" />
		</c:if>
		<link rel="stylesheet" href="<c:url value='/statics/css/bootstrap.css'/>" media="all" />
		<script>
			var soapURL = '${SoapURL}',
				rtl = ${attributeBean.isRtl()};
			if(!soapURL) {
				soapURL = document.location.href;
			}
			<c:out value="${attributeBean.getClientInitialize()}"/>
		</script>
		
		<!-- 引入JS文件 -->
		<script src="<c:url value='/birt/ajax/utility/Debug.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/lib/prototype.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/lib/head.js'/>" type="text/javascript"></script>
		
		<!-- Mask -->
		<script src="<c:url value='/birt/ajax/core/Mask.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/utility/BrowserUtility.js'/>" type="text/javascript"></script>
		
		<!-- Drag and Drop -->
		<script src="<c:url value='/birt/ajax/core/BirtDndManager.js'/>" type="text/javascript"></script>
		
		<script src="<c:url value='/birt/ajax/utility/Constants.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/utility/BirtUtility.js'/>" type="text/javascript"></script>
		
		<script src="<c:url value='/birt/ajax/core/BirtEventDispatcher.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/core/BirtEvent.js'/>" type="text/javascript"></script>
		
		<script src="<c:url value='/birt/ajax/mh/BirtBaseResponseHandler.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/mh/BirtGetUpdatedObjectsResponseHandler.js'/>" type="text/javascript"></script>

		<script src="<c:url value='/birt/ajax/ui/app/AbstractUIComponent.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/ui/app/AbstractBaseToolbar.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/ui/app/BirtToolbar.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/ui/app/BirtNavigationBar.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/ui/app/AbstractBaseToc.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/ui/app/BirtToc.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/ui/app/BirtProgressBar.js'/>" type="text/javascript"></script>

 		<script src="<c:url value='/birt/ajax/ui/report/AbstractReportComponent.js'/>" type="text/javascript"></script>
 		<script src="<c:url value='/birt/ajax/ui/report/AbstractBaseReportDocument.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/ui/report/BirtReportDocument.js'/>" type="text/javascript"></script>

		<script src="<c:url value='/birt/ajax/ui/dialog/AbstractBaseDialog.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/ui/dialog/BirtTabedDialogBase.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/ui/dialog/AbstractParameterDialog.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/ui/dialog/BirtParameterDialog.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/ui/dialog/BirtSimpleExportDataDialog.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/ui/dialog/BirtExportReportDialog.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/ui/dialog/BirtPrintReportDialog.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/ui/dialog/BirtPrintReportServerDialog.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/ui/dialog/AbstractExceptionDialog.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/ui/dialog/BirtExceptionDialog.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/ui/dialog/BirtConfirmationDialog.js'/>" type="text/javascript"></script>
		
		<script src="<c:url value='/birt/ajax/utility/BirtPosition.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/utility/Printer.js'/>" type="text/javascript"></script>

		<script src="<c:url value='/birt/ajax/core/BirtCommunicationManager.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/core/BirtSoapRequest.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/birt/ajax/core/BirtSoapResponse.js'/>" type="text/javascript"></script>
		<script type="text/javascript" src="<c:url value='/statics/js/jquery-3.2.1.min.js'/>"></script>
		<script>
			$.noConflict();
		</script>
		<script type="text/javascript" src="<c:url value='statics/js/bootstrap.min.js'/>"></script>
	</head>
	
	<body style='overflow:hidden; direction: ${attributeBean.isRtl()?"rtl":"ltr"}; scroll:no;padding-top:50px;'>
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">收缩菜单</span> 
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="<c:url value='/'/>">报表预览</a>
				</div>
				<%
					if (fragment != null) {
						fragment.callBack(request, response);
					}
				%>

	</body>

	<%@include file="../common/Locale.jsp" %>	
	<%@include file="../common/Attributes.jsp" %>	

	<script type="text/javascript">
		var hasSVGSupport = false;
		var useVBMethod = false;
		if ((!!document.createElementNS && !!document.createElementNS(
				'http://www.w3.org/2000/svg', 'svg').createSVGRect)
				|| navigator.mimeTypes != null
				&& navigator.mimeTypes.length > 0
				&& navigator.mimeTypes["image/svg+xml"] != null) {
			hasSVGSupport = true;
		} else {
			useVBMethod = true;
		}
	</script>
	
	<script type="text/vbscript">
		On Error Resume Next
		If useVBMethod = true Then
		    hasSVGSupport = IsObject(CreateObject("Adobe.SVGCtl"))
		End If
	</script>

	<script type="text/javascript">
		var debugWindow = {
				closed : false
		}
		var Mask =  new Mask(false); //create mask using "div"
		var BrowserUtility = new BrowserUtility();
		DragDrop = new BirtDndManager();

		var birtToolbar = new BirtToolbar('toolbar');
		var navigationBar = new BirtNavigationBar('navigationBar');
		var birtToc = new BirtToc('display0');
		var birtProgressBar = new BirtProgressBar('progressBar');
		var birtReportDocument = new BirtReportDocument("Document", birtToc);

		var birtParameterDialog = new BirtParameterDialog('parameterDialog', 'frameset');
		var birtSimpleExportDataDialog = new BirtSimpleExportDataDialog('simpleExportDataDialog');
		var birtExportReportDialog = new BirtExportReportDialog('exportReportDialog');
		var birtPrintReportDialog = new BirtPrintReportDialog('printReportDialog');
		var birtPrintReportServerDialog = new BirtPrintReportServerDialog('printReportServerDialog');
		var birtExceptionDialog = new BirtExceptionDialog('exceptionDialog');
		var birtConfirmationDialog = new BirtConfirmationDialog('confirmationDialog');

		// register the base elements to the mask, so their input
		// will be disabled when a dialog is popped up.
		Mask.setBaseElements(new Array(birtToolbar.__instance, navigationBar.__instance, birtReportDocument.__instance));
		
		
		// When link to internal bookmark, use javascript to fire an Ajax request
		function catchBookmark(bookmark) {	
			birtEventDispatcher.broadcastEvent(birtEvent.__E_GETPAGE, { name : "__bookmark", value : bookmark });		
		}
		//
		//	birtParameterDialog = new ReportParameterDialog('parameterDialog')
		jQuery(document).ready(function() {
			function init() {
				//	是否显示参数对话框
				var shown = ${attributeBean.isShowParameterPage()};
				soapURL = birtUtility.initSessionId(soapURL);
				if(shown) {
					birtParameterDialog.__cb_bind();
				} else {
					soapURL = birtUtility.initDPI(soapURL);
					navigationBar.__init_page();
				}
			}
			
			init();
		})
	</script>
</html>