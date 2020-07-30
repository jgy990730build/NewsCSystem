<%--
  Created by IntelliJ IDEA.
  User: 22118
  Date: 2019/11/19
  Time: 22:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<link rel="stylesheet" href="<%= basePath%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%= basePath%>/css/mycss.css">
<script src="<%= basePath%>/js/jquery-3.4.1.min.js"></script>
<script src="<%= basePath%>/js/bootstrap.min.js"></script>
<head>
    <title>categoryList.jsp</title>
</head>
<body>
            <h2>查看新闻类型：</h2>
            <table class="table table-bordered">
                <tr class="success">
                    <th class="text-center">序号</th>
                    <th class="text-center">类型名</th>
                    <th class="text-center">操作</th>
                </tr>
                <s:iterator value="categorys" var="category" status="stu">
                    <tr>
                        <td class="text-center"><s:property value="#stu.count"/></td>
                        <td class="text-center"><s:property value="#category.category"/></td>
                        <td class="text-center">
                            <s:a href="NewsCSystem/FindCategory.action?cid=%{#category.id}"><button class="btn btn-info">修改</button></s:a>
                            <button class="btn btn-danger"  data-toggle="modal" data-target="#pop-window<s:property value="#stu.count"/>" data-backdrop="static">删除</button>
                            <div class="modal fade text-left" id="pop-window<s:property value="#stu.count"/>">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button class="close" data-dismiss="modal">&times;</button>
                                            <div class="modal-title">
                                                删除类型
                                            </div>
                                        </div>
                                        <div class="modal-body">
                                            <strong>你确定删除吗？</strong>
                                            <p>这将会永久删除。。。。</p>
                                            <p>同类型的新闻也会没有哦！</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button class="btn btn-default" data-dismiss="modal">关闭</button>
                                            <s:a href="NewsCSystem/deleteCategory.action?cid=%{#category.id}">
                                                <button class="btn btn-danger">确定</button>
                                            </s:a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </s:iterator>
            </table>

</body>
</html>
