<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <title>Login page</title>
    <link href="/resources/css/style.css" rel="stylesheet" type="text/css">
    <link href="/resources/css/styleLogin.css" rel="stylesheet" type="text/css">
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
        <form:form method="post" action="/user/loginReg.html" class="login-box animated fadeInUp">

            <form:label path="username">Username </form:label>
            <input name="username" type="text" path="username"/>
            <br/>
            <form:label path="password">Password </form:label>
            <input name="password" type="password" path="password"/>
            <br/>
            <div id="section">
                <input type="submit" value="Login"/>
            </div>
        </form:form>
        <br/>

        <p align="right"><br/>
        <li><a href="${pageContext.request.contextPath}/client/create.html"> Register now </a></li>
        <br/>
        <button class="button" type="button" name="back" onclick="history.back()">Back</button>

        <br/>
        <div class="banneLogin">&nbsp;</div>
    </div>
</div>

<div id="footer">
    <div id="footnote">
        <div class="section">Copyright &copy; 2017 <a href="#">Pet Adoption</a> All rights reserved | By Catalina
            Calugar
        </div>
    </div>
</div>

</body>
</html>