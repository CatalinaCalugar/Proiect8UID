<%--
  Created by IntelliJ IDEA.
  User: Catalina
  Date: 01.04.2017
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <title>Login page</title>
</head>
<body>

<h2>Login</h2>
<form:form method="POST" action="${pageContext.request.contextPath}/user/logout">
    <input type="submit" value="OK"/>
</form:form>
</body>
</html>