<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String contextPath=request.getContextPath();
%>

<!doctype html>
<html lang="utf-8">
<head>
<meta charset="utf-8">
<title><?php echo $pageTitle; ?></title>
<!--jQuery & jQuery Mobile-->
<link rel="stylesheet" href="<%=contextPath%>/js/jquery-mobile/jquery.mobile-1.4.5.min.css" type="text/css" />
<script type="text/javascript" src="<%=contextPath%>/js/jquery.min-1.11.2.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery-mobile/jquery.mobile-1.4.5.min.js"></script>

<style type="text/css">
ul { list-style:none;}
</style>

</head>

<body>
<article id="index" data-role="page">
	<!--顶部标题栏 开始-->
    <header data-role="header" data-position="fixed" data-theme="b">
        <h1>校园图书管理系统</h1>
        <a class="ui-btn-icon-left" href="#cat-panel" data-icon="bullets" data-iconpos="notext">分类</a>
        <a class="ui-btn-right" href="#menu-panel" data-icon="bars" data-iconpos="notext">菜单</a>
    </header>
	<!--顶部标题栏 结束-->
    
    <section data-role="content">