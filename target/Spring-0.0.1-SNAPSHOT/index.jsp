<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>百度一下，你就知道</title>

<style type="text/css">
.btn {
	cursor: pointer;
	width: 102px;
	height: 38px;
	line-height: 38px;
	padding: 0;
	border: 0;
	background: none;
	background-color: #38f;
	font-size: 16px;
	color: white;
	box-shadow: none;
	font-weight: normal;
}

.btn:hover {
	height: 39px;
	_height: 38px;
	background-color: #317ef3;
	border-bottom: 1px solid #2868c8;
	box-shadow: 1px 1px 1px #ccc;
}

#kw {
	width: 480px !important;
	padding-right: 48px !important;
	width: 521px;
	height: 20px;
	padding: 9px 7px;
	font: 16px arial;
	border: 1px solid #b8b8b8;
	border-bottom: 1px solid #ccc;
	vertical-align: top;
	outline: none;
	box-shadow: none;
}
</style>
</head>
<body>
	
	<div id="main" style="">
		<div class="icon" style="text-align: center;margin-top: 110px;">
			<img style="width:270px;height:129px;" alt="百度一下，你就知道" src="<c:url value="/resources/img/index_icon.png"/>">
		</div>
		<div class="search" style="text-align: center;margin-top: 20px;">
			<form action="<c:url value='/s'/>">
				<input type="text" name="wd" id="kw" /> 
				<input type="submit" value="百度一下" class="btn" />
			</form>
		</div>
	</div>

</body>
</html>