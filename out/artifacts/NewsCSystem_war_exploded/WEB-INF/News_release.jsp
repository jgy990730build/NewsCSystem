<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 22118
  Date: 2019/11/26
  Time: 22:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>发布新闻</title>
</head>
<body>
<div id="wrong_message"></div>
<div id="wrong_message2"></div>
<h3>发布新闻：</h3>
<s:form id="add_news_form" theme="simple" action="addedNews" namespace="/NewsCSystem">
<table class="table table-bordered">
    <tr>
        <td>标题</td>
        <td><s:textfield name="news.title" class="form-control" id="title" placeholder="新闻标题" label="标题"/></td>
    </tr>
    <tr>
        <td>类型</td>
        <td>
            <s:select name="nid" class="form-control" list="categorys" listKey="id" listValue="category" value="category" headerKey="0" headerValue="请选择新闻类型"/>
        </td>
    </tr>
    <tr>
        <td>内容</td>
        <td><textarea id="content" name="news.content" class="form-control" rows="3"></textarea></td>
    </tr>
    <tr>
        <td>来源</td>
        <td><input name="news.sourceFor" class="form-control" type="text"/></td>
    </tr>
    <tr>
        <td>
            <button type="button" id="button2" class="btn btn-info" name="button">添加</button>
        </td>
    </tr>
</table>
</s:form>
</body>
<script src="<%= basePath%>/js/my_js.js"></script>
<script>

</script>
</html>
