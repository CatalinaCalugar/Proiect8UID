<%--
  Created by IntelliJ IDEA.
  User: Catalina
  Date: 26.03.2017
  Time: 13:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <title>New Accessorises page</title>
    <link href="/resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="header"><a href="${pageContext.request.contextPath}/index.html" id="logo"><img src="/resources/images/logo.gif"
                                                                                        width="310" height="114" alt=""></a>
    <ul class="navigation">
        <li><a href="${pageContext.request.contextPath}/index.html"> Home page </a></li>
        <li><a href="${pageContext.request.contextPath}/employee/logout.html">Logout</a></li>
    </ul>
</div>

<i></i><br/>

<div id="body">
    <div id="content">
        <i></i><br/><br/><br/>
        <div class="content">

<i>${message}</i><br/>
<form:form method="POST" commandName="accessorises" action="${pageContext.request.contextPath}/accessorises/create.html" >
    <table>
        <tbody>
        <tr>
            <td>Name</td>
            <td><form:input path="name"/></td>
            <td><form:errors path="name" cssStyle="color: red;"/></td>
        </tr>
        <tr>
            <td>Price</td>
            <td><form:input path="price"/></td>
            <td><form:errors path="price" cssStyle="color: red;"/></td>
        </tr>
        <tr>
            <td>Available on stock</td>
            <td><form:input path="stockNumber"/></td>
            <td><form:errors path="stockNumber" cssStyle="color: red;"/></td>
        </tr>
        <tr>
            <td>Pet type</td>
            <td><form:input path="petType"/></td>
            <td><form:errors path="petType" cssStyle="color: red;"/></td>
        </tr>
        <tr>
            <td>Accessorise type</td>
            <td><form:input path="type"/></td>
            <td><form:errors path="type" cssStyle="color: red;"/></td>
        </tr>
        <tr>
            <td>Accessorise image</td>
            <td><form:input path="image"/></td>
            <td><form:errors path="image" cssStyle="color: red;"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="Edit"/></td>
            <td></td>
            <td></td>
        </tr>
        </tbody>
    </table>
</form:form>
<button type="button" name="back" onclick="history.back()">back</button>

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

