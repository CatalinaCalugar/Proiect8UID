<%--
  Created by IntelliJ IDEA.
  User: Dan
  Date: 28.03.2017
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Fail</title>
    <link href="/resources/css/style.css" rel="stylesheet" type="text/css">

</head>
<body>

<div id="header"><a href="${pageContext.request.contextPath}/index.html" id="logo"><img src="/resources/images/logo.gif"
                                                                                        width="310" height="114" alt=""></a>
    <ul class="navigation">
        <li><a href="${pageContext.request.contextPath}/index.html"> Home page </a></li>
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
                <li><a href="${pageContext.request.contextPath}/user/login.html"><img
                        src="/resources/images/login.jpg" width="160" height="114" alt=""></a>
                    <h2>Login</h2>
                    <p><a class="more"
                          href="${pageContext.request.contextPath}/user/login.html">Login now</a></p>
                </li>
            </ul>
        </div>
    </div>
</div>
<i></i><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<div id="footer">
    <div id="footnote">
        <div class="section">Copyright &copy; 2017 <a href="#">Pet Adoption</a> All rights reserved | By Catalina
            Calugar
        </div>
    </div>
</div>
</body>
</html>
