<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 22118
  Date: 2019/11/19
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>admin</title>
  </head>
  <body>

  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">
          NEWs
        </a>
        <ul class="nav navbar-nav">
          <li class="active">
            <a href="#">新闻管理系统</a>
          </li>
        </ul>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <s:form action="loginoutUser" class="navbar-form navbar-right" theme="simple">
          <img src="<%= basePath%>/image/logo_by_me2.jpg" alt="..." />
          <s:submit class="btn btn-danger" value="退出登录"/>
        </s:form>
      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </nav>

  <div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
          <div class="panel panel-info">
            <div class="panel-heading">
              类型管理
            </div>
            <div class="panel-body text-center">
              <s:a href="NewsCSystem/listCategory.action" target="content"><button type="button" class="btn btn-primary btn-block" id="btn1">类型查看</button></s:a>
              <br>
              <a href="<%= basePath%>/categoryAdd.jsp" target="content"><button type="button" class="btn btn-primary btn-block" id="btn2">类型发布</button></a>
            </div>
          </div>
          <div class="panel panel-info">
            <div class="panel-heading">新闻管理</div>
            <div class="panel-body text-center">
              <s:a href="NewsCSystem/findAllNews.action" target="content"><button type="button" class="btn btn-primary btn-block" id="btn3">新闻查看</button></s:a>
              <br>
              <s:a href="NewsCSystem/addNews.action" target="content"><button type="button" class="btn btn-primary btn-block" id="btn4">新闻发布</button></s:a>
            </div>
          </div>
        </div>
        <div class="col-md-8">
            <iframe name="content" frameborder="0" scrolling="no" height="100%" width="1000px"></iframe>
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
</html>
