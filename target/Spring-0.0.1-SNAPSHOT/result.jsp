<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${key}_百度搜索</title>
<style type="text/css">.btn {cursor: pointer;width: 102px;height: 38px;line-height: 38px;padding: 0;border: 0;background: none;background-color: #38f;font-size: 16px;color: white;box-shadow: none;font-weight: normal;}
.btn:hover {height: 39px;_height: 38px;background-color: #317ef3;border-bottom: 1px solid #2868c8;box-shadow: 1px 1px 1px #ccc;}
#kw {width: 480px !important;padding-right: 48px !important;width: 521px;height: 20px;padding: 9px 7px;font: 16px arial;border: 1px solid #b8b8b8;border-bottom: 1px solid #ccc;vertical-align: top;outline: none;box-shadow: none;}</style>
</head>
<body>
	
	<div id="" style="border-bottom: 1px solid #ebebeb;height:40px;width: 100%;padding:12px;">
		<a href="<c:url value='//'/>" style="display: block;float: left;margin-right: 5px;"><img alt="到百度首页" style="width:101px;" src="<c:url value="/resources/img/result_icon.png"/>"></a>
		<form action="<c:url value='/qiandu/search'/>" style="float:left;">
			<input type="text" name="key" id="kw" value="${key}" /> 
			<input type="submit" value="百度一下" class="btn" />
		</form>
	</div>
	
	${body }
</body>
</html>