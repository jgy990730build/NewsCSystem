<%--
  Created by IntelliJ IDEA.
  User: 22118
  Date: 2019/12/12
  Time: 23:19
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
    <link rel="stylesheet" href="<%= basePath%>/css/bootstrap.css">
    <link rel="stylesheet" href="<%= basePath%>/css/mycss.css">
    <script src="<%= basePath%>/js/jquery-3.4.1.min.js"></script>
    <script src="<%= basePath%>/js/bootstrap.js"></script>
    <script src="<%= basePath%>/js/my_js.js"></script>
    <title>登录</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <img src="<%= basePath%>/image/logo_by_me2.jpg" alt=".." />
    <a class="navbar-brand" href="#">EXT_NEWs</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="<%= basePath%>/index_loading.jsp">首页 <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    新闻分类
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <s:a class="dropdown-item" href="NewsCSystem/showTimeFrameResultNews.action">时间范围查询</s:a>
                    <div class="dropdown-divider"></div>
                    <s:iterator value="categorys" var="category" status="stu">
                        <s:a class="dropdown-item" href="NewsCSystem/showByCNews.action?nid=%{#category.id}"><s:property value="#category.category"/></s:a>
                    </s:iterator>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%= basePath%>/feedback.jsp">联系我们</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%= basePath%>/help.jsp">帮助中心</a>
            </li>
            <s:form theme="simple" id="search" action="NewsCSystem/showSearchResultNews.action" class="form-inline my-2 my-lg-0">
                <s:textfield id="search_text" name="str1" class="form-control mr-sm-2" placeholder="Search" aria-label="Search"/>
                <button id="search_button" class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
            </s:form>
        </ul>

        <a href="<%= basePath%>/login.jsp"><button type="button" class="btn btn-primary">登录</button></a>
        <a href="<%= basePath%>/register.jsp"><button type="button" class="btn btn-primary">注册</button></a>
    </div>
</nav>

<div class="container top_add text-center bottom_add">
    <div class="row">
        <div class="col-4 offset-4">
            <s:form class="form-signin" id="login" method="post" action="loginUser" theme="simple" namespace="/NewsCSystem">
                <img class="mb-4" src="<%= basePath%>/image/logo_by_me.jpg" alt=".." width="72px" height="72px">
                <h1 class="h3 mb-3 font-weight-normal">用户登录</h1>
                <div class="form-label-group text-left">
                <label for="username">账号</label>
                <s:textfield class="form-control" id="username" name="login_u_id" placeholder="请输入你的账号"/>
                </div>
                <div class="form-label-group text-left">
                <label for="password">密码</label>
                <s:password class="form-control" id="password" name="login_password" placeholder="请输入你的密码"/>
                    <s:actionerror class="text-danger"/>
                </div>
                <div class="checkbox mb-3">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>
                <button type="button" id="login_button" class="btn btn-lg btn-primary btn-block">登录</button>
                <p class="mt-5 mb-3 text-muted">© 2017-2019</p>
            </s:form>
        </div>
    </div>
</div>

<section class="footer">
    <h2 class="text-center">THANKS FOR VISITING US</h2>
    <hr>
    <div class="container">
        <div class="row">
            <div class="col-lg-4 footer-left">
                <h4>Contact Information</h4>
                <div class="contact-info">
                    <div class="address">
                        <i class="glyphicon glyphicon-globe"></i>
                        <p class="p3">77 Jack Street</p>
                        <p class="p3">Chicago, USA</p>
                    </div>
                    <div class="phone">
                        <i class="glyphicon glyphicon-phone-alt"></i>
                        <p class="p4">+00 1010101010</p>
                    </div>
                    <div class="email-info">
                        <i class="glyphicon glyphicon-envelope"></i>
                        <p class="p4"><a href="mailto:email2@example.com">email2@example.com</a></p>
                    </div>
                </div>
            </div><!-- col -->
            <div class="col-lg-4 footer-center">
                <h4>Newsletter</h4>
                <p>Register to our newsletter and be updated with the latests information regarding our services, offers and much more.</p>
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="inputEmail1" class="col-lg-4 control-label"></label>
                        <div class="col-lg-10">
                            <input type="email" class="form-control" id="inputEmail1" placeholder="Email" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="text1" class="col-lg-4 control-label"></label>
                        <div class="col-lg-10">
                            <input type="text" class="form-control" id="text1" placeholder="Your Name" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-10">
                            <button type="submit" class="btn btn-block btn-primary">Sign in</button>
                        </div>
                    </div>
                </form><!-- form -->
            </div><!-- col -->
            <div class="col-lg-4 footer-right">
                <h4>Support Us</h4>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                <ul class="social-icons2">
                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                </ul>
            </div><!-- col -->
        </div><!-- row -->
    </div><!-- container -->
    <hr>
    <footer class="text-center">Copyright © 2019.Company name All rights reserved.</footer>
</section>
</body>
<script src="<%= basePath%>/js/my_js.js"></script>
</html>
