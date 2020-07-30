<%--
  Created by IntelliJ IDEA.
  User: 22118
  Date: 2019/11/19
  Time: 22:42
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
    <title>categoryAdd</title>
</head>
<body>
    <div id="wrong_message"></div>
    <h3>发布新闻类型：</h3>
        <s:form id="aform" theme="simple" action="addCategory" namespace="/NewsCSystem">
                <div class="col-xs-6">
                <div class="form-group">
                    <label for="category">类型名</label>
                    <s:textfield name="category.category" id="category" class="form-control" placeholder="填入的想输入的类型名" label="类型名"/>
                </div>
                    <button type="button" id="button1" class="btn btn-info" name="button">添加</button>
                </div>
        </s:form>
</body>
<script src="<%= basePath%>/js/my_js.js"></script>
</html>
