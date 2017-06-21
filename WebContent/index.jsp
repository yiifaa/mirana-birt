<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh_CN">
	<head>
		<meta charset="UTF-8" />
		<TITLE>开源报表-Mirana定制版</TITLE>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="styles/iv/index.css" media="all" />
		<link rel="stylesheet" href="statics/css/bootstrap.css" media="all" />
		<style>
			.warningMessage {
				color:red;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<a href="<%= request.getContextPath( ) + "/frameset?__report=test.rptdesign&sample=my+parameter"%>"> 报表样例</a>
		</div>
	</body>
	<script type="text/javascript" src="statics/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="statics/js/bootstrap.min.js"></script>
</html>