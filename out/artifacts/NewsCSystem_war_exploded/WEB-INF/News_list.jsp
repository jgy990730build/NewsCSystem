<%--
  Created by IntelliJ IDEA.
  User: 22118
  Date: 2019/11/27
  Time: 8:49
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
    <title>新闻列表</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-12">
            <s:form theme="simple" action="findbyCNews" namespace="/NewsCSystem" method="post">
                <div class="col-xs-4 col-xs-offset-3">
                    <s:select name="sid" class="form-control" list="categorys" listKey="id" listValue="category" value="id" headerKey="0" headerValue="请选择新闻类型"/>
                </div>
                <s:submit class="btn btn-info" value="查看"/>
            </s:form>
        </div>
        <div class="col-12">
            <table class="table table-bordered">
                <tr class="success">
                    <th class="text-center">序号</th>
                    <th class="text-center">标题</th>
                    <th class="text-center">发布时间</th>
                    <th class="text-center">类型</th>
                    <th class="text-center">操作</th>
                </tr>
                <s:iterator value="newss" var="news" status="stu">
                    <tr>
                        <th class="text-center"><s:property value="#stu.count"/></th>
                        <th class="text-center">
                            <s:a href="NewsCSystem/findOneNews.action?nid=%{#news.id}">
                                <s:property value="#news.title"/>
                            </s:a>
                        </th>
                        <th class="text-center"><s:date name="#news.issueTime" format="yyyy-MM-dd hh:mm:ss"/></th>
                        <th class="text-center"><s:property value="#news.categoryName"/></th>

                        <td class="text-center">
                            <s:a href="NewsCSystem/updateNews.action?nid=%{#news.id}"><button class="btn btn-info">修改</button></s:a>
                            <button class="btn btn-danger" data-toggle="modal" data-target="#pop-window" data-backdrop="static">删除</button>
                            <div class="modal fade text-left" id="pop-window">
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
                                        </div>
                                        <div class="modal-footer">
                                            <button class="btn btn-default" data-dismiss="modal">关闭</button>
                                            <s:a href="NewsCSystem/deteleNews.action?nid=%{#news.id}">
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
        </div>
        <div class="col-12">
            <s:if test="newss.size()!=0">
            <s:if test="sid==0">
                <nav aria-label="Page navigation" style="text-align: center;">
                    <ul class="pagination">
                        <s:if test="pageNow!=1">
                            <li class="page-item">
                                <s:a class="page-link" href="NewsCSystem/findAllNews.action?pageNow=1">首页</s:a>
                            </li>
                        </s:if>
                        <s:else>
                            <li class="page-item disabled">
                                <s:a class="page-link" href="NewsCSystem/findAllNews.action?pageNow=1">首页</s:a>
                            </li>
                        </s:else>
                        <s:iterator begin="1" end="intPageCount" var="i">
                            <s:if test="pageNow==#i">
                                <li class="page-item active" aria-current="page">
                                    <s:a class="page-link" href="#"><s:property value="#i"/><span class="sr-only">(current)</span></s:a>
                                </li>
                            </s:if>
                            <s:else>
                                <li class="page-item">
                                    <s:a class="page-link" href="NewsCSystem/findAllNews.action?pageNow=%{#i}"><s:property value="#i"/></s:a>
                                </li>
                            </s:else>
                        </s:iterator>
                        <s:if test="pageNow!=k">
                            <li class="page-item">
                                <s:a class="page-link" href="NewsCSystem/findAllNews.action?pageNow=%{k}">尾页</s:a>
                            </li>
                        </s:if>
                        <s:else>
                            <li class="page-item disabled">
                                <s:a class="page-link" href="NewsCSystem/findAllNews.action?pageNow=%{k}">尾页</s:a>
                            </li>
                        </s:else>
                    </ul>
                </nav>
            </s:if>
            <s:else>
                <nav aria-label="Page navigation" style="text-align: center;">
                    <ul class="pagination">
                        <s:url var="url_1" action="NewsCSystem/showByCNews.action">
                            <s:param name="pageNow" value="1"/>
                            <s:param name="nid" value="%{category.id}"/>
                        </s:url>
                        <s:url var="url_2" action="NewsCSystem/showByCNews.action">
                            <s:param name="pageNow" value="%{k}"/>
                            <s:param name="nid" value="%{category.id}"/>
                        </s:url>
                        <s:url var="url_3" action="NewsCSystem/showByCNews.action">
                            <s:param name="pageNow" value="%{#i}"/>
                            <s:param name="nid" value="%{category.id}"/>
                        </s:url>
                        <s:if test="pageNow!=1">
                            <li class="page-item">
                                <s:a class="page-link" href="%{url_1}">首页</s:a>
                            </li>
                        </s:if>
                        <s:else>
                            <li class="page-item disabled">
                                <s:a class="page-link" href="#">首页</s:a>
                            </li>
                        </s:else>
                        <s:iterator begin="1" end="intPageCount" var="i">
                            <s:if test="pageNow==#i">
                                <li class="page-item active" aria-current="page">
                                    <s:a class="page-link" href="#"><s:property value="#i"/><span class="sr-only">(current)</span></s:a>
                                </li>
                            </s:if>
                            <s:else>
                                <li class="page-item">
                                    <s:a class="page-link" href='NewsCSystem/showByCNews.action?pageNow=%{#i}&&nid=%{category.id}'><s:property value="#i"/></s:a>
                                </li>
                            </s:else>
                        </s:iterator>
                        <s:if test="pageNow!=k">
                            <li class="page-item">
                                <s:a class="page-link" href="%{url_2}">尾页</s:a>
                            </li>
                        </s:if>
                        <s:else>
                            <li class="page-item disabled">
                                <s:a class="page-link" href="#">尾页</s:a>
                            </li>
                        </s:else>
                    </ul>
                </nav>
            </s:else>
            </s:if>
            <s:else>
                <h1 class="text-center">查无结果!!!</h1>
            </s:else>
        </div>
    </div>
</div>
</body>
</html>
