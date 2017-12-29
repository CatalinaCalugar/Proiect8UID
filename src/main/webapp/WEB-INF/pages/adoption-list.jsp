<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <title>adoption list page</title>
    <link href="/resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="header"><a href="${pageContext.request.contextPath}/index.html" id="logo"><img src="/resources/images/logo.gif"
                                                                                        width="310" height="114" alt=""></a>
    <ul class="navigation">
        <li><a href="${pageContext.request.contextPath}/index.html"> Home page </a></li>
        <li><a href="${pageContext.request.contextPath}/user-page.html"> User page </a></li>
        <li><a href="${pageContext.request.contextPath}/employee/logout.html">Logout</a></li>
    </ul>
</div>

<i></i><br/>

<div id="body">
    <div id="content">
        <i></i><br/><br/><br/>
        <div class="content">

            <table style="text-align: center;" border="1px" cellpadding="0" cellspacing="0">
                <thead>
                <tr>
                    <th width="150px">id</th>
                    <th width="150px">adoptionDate</th>
                    <th width="25px">idPet</th>
                    <th width="50px">idClient</th>
                    <th width="50px">paymentId</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="adoption" items="${adoptionList}">
                    <tr>
                        <td>${adoption.id}</td>
                        <td>${adoption.adoptionDate}</td>
                        <td>${adoption.idPet}</td>
                        <td>${adoption.idClient}</td>
                        <td>${adoption.paymentId}</td>
                        <td>
                                <%--<a href="${pageContext.request.contextPath}/adoption/edit/${adoption.id}.html">Edit</a><br/>--%>
                            <a href="${pageContext.request.contextPath}/adoption/delete/${adoption.id}.html">Delete</a><br/>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<i></i><br/><br/><br/>
<div id="footer">
    <div id="footnote">
        <div class="section">Copyright &copy; 2017 <a href="#">Pet Adoption</a> All rights reserved | By Catalina
            Calugar
        </div>
    </div>
</div>
</body>
</html>