<%--
  Created by IntelliJ IDEA.
  User: Catalina
  Date: 01.04.2017
  Time: 17:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Purchase online</title>
    <meta charset="iso-8859-1">
    <link href="/resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="header"><a href="${pageContext.request.contextPath}/index.html" id="logo"><img src="/resources/images/logo.gif" width="310" height="114" alt=""></a>
    <ul class="navigation">
        <li><a href="${pageContext.request.contextPath}/index.html"> Home page </a></li>
        <li><a href="${pageContext.request.contextPath}/employee/login.html"> Login </a></li>
        <li><a href="${pageContext.request.contextPath}/employee/logout.html">Logout</a></li>
    </ul>
</div>
<div id="body">
    <div id="content">
        <i></i><br/><br/><br/><br/>
        <div class="content">
            <br/>
            <i style="color: fuchsia">${message}</i><br/>
            <br/><br/>
            <ul>
                <li><a href="${pageContext.request.contextPath}/pet/list/cat.html"><img
                        src="/resources/images/cat2.jpg" width="114" height="160" alt=""></a>
                    <h2>Cats </h2>
                    <p>Adopt a lovely cat now! <a class="more"
                                                  href="${pageContext.request.contextPath}/pet/list/cat.html">Click and
                        find the one you
                        love.</a></p>
                </li>
                <li><a href="${pageContext.request.contextPath}/pet/list/dog.html"><img
                        src="/resources/images/dog3.png" width="114" height="160" alt=""></a>
                    <h2>Dogs </h2>
                    <p>Adopt a joyful dog now! <a class="more"
                                                  href="${pageContext.request.contextPath}/pet/list/dog.html">Click and
                        find the one you
                        love.</a></p>
                </li>
                <li><a href="${pageContext.request.contextPath}/accessorises/buy.html"><img
                        src="/resources/images/good-food.jpg" width="300" height="90" alt=""></a>
                    <h2>Accessorises and food for cats and dogs </h2>
                    <p>Buy now! <a class="more" href="${pageContext.request.contextPath}/accessorises/buy.html">Click
                        now and buy.</a></p>
                </li>

            </ul>
        </div>
    </div>

</div>
<br/><br/><br/>
<div id="footer">
    <div id="footnote">
        <div class="section">Copyright &copy; 2017 <a href="#">Pet Adoption</a> All rights reserved | By Catalina
            Calugar
        </div>
    </div>
</div>
</body>
</html>
