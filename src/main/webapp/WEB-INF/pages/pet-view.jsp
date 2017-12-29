<%--
  Created by IntelliJ IDEA.
  User: Dan
  Date: 25.03.2017
  Time: 19:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <title>Pet page</title>
    <link href="/resources/css/style.css" rel="stylesheet" type="text/css">

</head>
<body>

<div id="header"><a href="${pageContext.request.contextPath}/index.html" id="logo"><img src="/resources/images/logo.gif" width="310" height="114" alt=""></a>
    <ul class="navigation">
        <li><a href="${pageContext.request.contextPath}/index.html"> Home page </a></li>
    </ul>
</div>
<div id="body">
    <div id="content">
        <i></i><br/><br/><br/><br/>

        <form:form method="get" commandName="pet"
                   action="${pageContext.request.contextPath}/employee/loginReg/${pet.idPet}.html">
            <img align="middle" src="${pet.image}" width="500" height="350"/>
            <table>
                <tbody>
                <tr>
                    <td>Pet name:</td>
                    <td><form:input path="name"/></td>
                    <td><form:errors path="name" cssStyle="color: red;"/></td>
                </tr>
                <tr>
                    <td>Price:</td>
                    <td><form:input path="price"/></td>
                    <td><form:errors path="price" cssStyle="color: red;"/></td>
                </tr>
                <tr>
                    <td>Available:</td>
                    <td><form:input path="available"/></td>
                    <td><form:errors path="available" cssStyle="color: red;"/></td>
                </tr>
                <tr>
                    <td>Race:</td>
                    <td><form:input path="race"/></td>
                    <td><form:errors path="race" cssStyle="color: red;"/></td>
                </tr>
                <tr>
                    <td>Type (cat/dog):</td>
                    <td><form:input path="type"/></td>
                    <td><form:errors path="type" cssStyle="color: red;"/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="ADOPT"/></td>
                    <td></td>
                    <td></td>
                </tr>
                </tbody>
            </table>
        </form:form>
        <br/>
        <br/>
        <button class="button" type="button" name="back" onclick="history.back()">Back</button>
    </div>
</div>
<i></i><br/><br/><br/><br/>
<div id="footer">
    <div id="footnote">
        <div class="section">Copyright &copy; 2017 <a href="#">Pet Adoption</a> All rights reserved | By Catalina
            Calugar
        </div>
    </div>
</div>
</body>
</html>
