<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="<%= basePath%>/css/bootstrap.css">
    <link rel="stylesheet" href="<%= basePath%>/css/mycss.css">
    <script src="<%= basePath%>/js/jquery-3.4.1.min.js"></script>
    <script src="<%= basePath%>/js/bootstrap.js"></script>
    <meta charset="UTF-8">
    <title>帮助</title>
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

<div class="container">
    <div class="row">
        <div class="col-4">
            <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action active">
                    Cras justo odio
                </a>
                <a href="#" class="list-group-item list-group-item-action">Dapibus ac facilisis in</a>
                <a href="#" class="list-group-item list-group-item-action">Morbi leo risus</a>
                <a href="#" class="list-group-item list-group-item-action">Porta ac consectetur ac</a>
                <a href="#" class="list-group-item list-group-item-action disabled" tabindex="-1" aria-disabled="true">Vestibulum at eros</a>
            </div>
        </div>
        <div class="col-8">
            <h1>帮助页面</h1>
            <hr>
            <blockquote class="blockquote">
            <p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
            <footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer>
            </blockquote>
            <hr>
            <p>
                This blog post shows a few different types of content that’s supported and styled with Bootstrap. Basic typography, images, and code are all supported.
            </p>
            <p>
                Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed posuere consectetur est at lobortis. Cras mattis consectetur purus sit amet fermentum.
            </p>
            <p>
                Curabitur blandit tempus porttitor.
                <strong>Nullam quis risus eget urna mollis ornare vel eu leo.</strong>
                Nullam id dolor id nibh ultricies vehicula ut id elit.
            </p>
            <p>
                Etiam porta sem malesuada magna mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.
            </p>
            <h1>Heading</h1>
            <p>
                Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
            </p>
            <h1>Sub-heading</h1>
            <p>
                Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.
            </p>
            <p>
                Example code block
            </p>
            <p>
                Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa.
            </p>
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