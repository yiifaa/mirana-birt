<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="false" buffer="none" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="org.eclipse.birt.report.utility.BirtUtility,
				 org.eclipse.birt.report.IBirtConstants,	
				 org.eclipse.birt.report.resource.BirtResources" %>
<!doctype html>
<html lang="zh_CN">
	<head>
		<meta charset="UTF-8" />
		<title><%= BirtResources.getMessage("birt.viewer.title.message")%></title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="<c:url value='/birt/styles/style.css'/>" media="all" />
		<link rel="stylesheet" href="<c:url value='/statics/css/bootstrap.css'/>" media="all" />
	</head>
	<body>
		<%
			String taskid = request.getParameter(IBirtConstants.OPRAND_TASKID);
			try {
				BirtUtility.cancelTask(request, taskid);
			} catch(Exception e) {
				e.printStackTrace();
			}
		%>
		<div class="container">
			<h1><%= BirtResources.getMessage("birt.viewer.message.taskcanceled")%></h1>
		</div>
	</body>
</html>