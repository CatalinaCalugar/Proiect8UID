<%--
  Created by IntelliJ IDEA.
  User: Dan
  Date: 25.03.2017
  Time: 19:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <title>Pet List page</title>
    <link href="/resources/css/style.css" rel="stylesheet" type="text/css">
    <%--<link href="/resources/css/table.css" rel="stylesheet" type="text/css">--%>
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
        <div class="content">
            <i></i><br/><br/><br/><br/>
            <table style="text-align: center;" border="1px" cellpadding="0" cellspacing="0">
                <thead>
                <tr>
                    <%--<th width="25px">id</th>--%>
                    <th width="150px">name</th>
                    <th width="100px">race</th>
                    <th width="100px">price</th>
                    <th>Image</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="pet" items="${petList}">
                    <tr>
                            <%--<td>${pet.idPet}</td>--%>
                        <td>${pet.name}</td>
                        <td>${pet.race}</td>
                        <td>${pet.price}</td>
                        <td><img id="profile-img" class="media-middle" align="middle" width="300" height="180"
                                 src="${pet.image}"/></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/pet/edit/${pet.idPet}.html">View</a><br/>
                        </td>
                    </tr>

                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</div>
<%--<button type="button" name="back" onclick="history.back()">back</button>--%>
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