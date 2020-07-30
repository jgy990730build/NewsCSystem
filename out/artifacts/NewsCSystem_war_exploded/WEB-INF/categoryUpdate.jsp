<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 22118
  Date: 2019/11/22
  Time: 14:34
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
    <title>更新新闻类型</title>
</head>
<body>

            <h2>更新新闻类型：</h2>
            <s:form theme="simple" action="updateCategory" namespace="/NewsCSystem">
                <div class="form-group">
                    <label for="category">类型名</label>
                    <s:hidden name="category.id" value="%{category.id}"/>
                    <s:textfield name="category.category" id="category" class="form-control" label="类型名"/>
                </div>
                <s:submit class="btn btn-info" value="更新"/>
            </s:form>

</body>
</html>
