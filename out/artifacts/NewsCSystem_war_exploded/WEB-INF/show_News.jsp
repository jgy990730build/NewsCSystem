<%--
  Created by IntelliJ IDEA.
  User: 22118
  Date: 2019/11/27
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <link rel="stylesheet" href="<%= basePath%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= basePath%>/css/mycss.css">
    <script src="<%= basePath%>/js/jquery-3.4.1.min.js"></script>
    <script src="<%= basePath%>/js/bootstrap.min.js"></script>
    <title>查看新闻</title>
</head>
<body>
<div class="container">
    <div class="row">
            <h1 class="text-center"><s:property value="news.title"/></h1>
        <blockquote>
            <p>来源：<s:property value="news.sourceFor"/> </p>
            <footer>发布时间：<cite title="time"><s:date name="news.issueTime" format="yyyy-MM-dd hh:mm:ss"/></cite></footer>
        </blockquote>
    </div>
    <div class="row">
        <hr style="height:1px;border:none;border-top:1px solid #555555;" />
        <p><s:property value="news.content"/></p>
    </div>
</div>
</body>
</html>
