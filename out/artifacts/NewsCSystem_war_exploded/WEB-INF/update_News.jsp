<%--
  Created by IntelliJ IDEA.
  User: 22118
  Date: 2019/11/27
  Time: 17:23
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
    <title>更新新闻</title>
</head>
<body>
<h1>更改新闻：</h1>
<s:form theme="simple" action="updatedNews" namespace="/NewsCSystem">
<table class="table table-bordered">
    <tr>
        <td>标题<s:hidden name="news.id" value="%{news.id}"/><s:hidden name="news.issueTime" value="%{news.issueTime}"/></td>
        <td><s:textfield name="news.title" id="category" class="form-control" label="类型名"/></td>
    </tr>
    <tr>
        <td>类型</td>
        <td>
            <select name="news.categoryName" class="form-control">
                <option selected="selected"><s:property value="news.categoryName"/></option>
                <s:iterator value="categorys" var="category" status="stu">
                    <option>
                        <s:property value="#category.category"/>
                    </option>
                </s:iterator>
            </select>
        </td>
    </tr>
    <tr>
        <td>内容</td>
        <td>
            <s:textarea name="news.content" class="form-control" rows="3"></s:textarea>
        </td>
    </tr>
    <tr>
        <td>来源</td>
        <td><s:textfield name="news.sourceFor" class="form-control" type="text"/></td>
    </tr>
    <tr>
        <td><s:submit class="btn btn-info btn-block" value="更新"/></td>
    </tr>
</table>
</s:form>
</body>
</html>
