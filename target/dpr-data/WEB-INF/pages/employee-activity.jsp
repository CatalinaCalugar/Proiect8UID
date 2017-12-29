<%--
  Created by IntelliJ IDEA.
  User: Catalina
  Date: 02.04.2017
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <title>Account List page</title>
</head>
<body>
<h1>Account List page</h1>
<i>${message}</i><br/>
<a href="${pageContext.request.contextPath}/admin-page">Home page</a>
<i></i><br/>
<table style="text-align: center;" border="1px" cellpadding="0" cellspacing="0">
    <thead>
    <tr>
        <th width="25px">id</th>
        <th width="150px">employee id</th>
        <th width="25px">date</th>
        <th width="50px">action</th>

    </thead>
    <tbody>
    <c:forEach var="activity" items="${activityList}">
        <tr>
            <td>${activity.id}</td>
            <td>${activity.idEmployee}</td>
            <td>${activity.date}</td>
            <td>${activity.action}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
