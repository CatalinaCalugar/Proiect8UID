<%--
  Created by IntelliJ IDEA.
  User: Catalina
  Date: 5/10/2017
  Time: 1:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: Catalina
  Date: 26.03.2017
  Time: 13:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <link href="/resources/css/style.css" rel="stylesheet" type="text/css">
    <title>New Adoption page</title>
</head>
<body>

<div id="header"><a href="${pageContext.request.contextPath}/index.html" id="logo"><img src="/resources/images/logo.gif"
                                                                                        width="310" height="114" alt=""></a>
    <ul class="navigation">
        <li><a href="${pageContext.request.contextPath}/index.html"> Home page </a></li>
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
            <form:form method="POST" commandName="adoption"
                       action="${pageContext.request.contextPath}/adoption/create/${pet.idPet}.html">

                <table style="text-align: center;" border="1px" cellpadding="0" cellspacing="0">
                    <thead>
                    <tr>
                        <th width="25px">id</th>
                        <th width="150px">name</th>
                        <th width="100px">race</th>
                        <th width="100px">price</th>
                        <th>Image</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="pet" items="${petList}">
                        <tr>
                            <td>${pet.idPet}</td>
                            <td>${pet.name}</td>
                            <td>${pet.race}</td>
                            <td>${pet.price}</td>
                            <td><img id="profile-img" class="media-middle" align="middle" width="300" height="180"
                                     src="${pet.image}"/></td>
                        </tr>

                    </c:forEach>
                    </tbody>
                </table>

                <br/>
                <div>
                    <p style="color: peru">Choose payment type:<br/>
                        <c:forEach var="criteria" items="${searchList}">
                            <input type="radio" name="type" value="${criteria}"/> ${criteria}
                            <br>
                        </c:forEach>
                    </p>
                </div>
                <br/>

                <table>
                    <tbody>
                    <tr>
                        <td>Pet ID</td>
                        <td><form:input path="idPet" readonly="true"/></td>
                        <td><form:errors path="idPet" cssStyle="color: red;"/></td>
                    </tr>
                    <tr>
                        <td>Client ID</td>
                        <td><form:input path="idClient"/></td>
                        <td><form:errors path="idClient" cssStyle="color: red;"/></td>
                    </tr>
                    <tr>
                        <td>Date</td>
                        <td><form:input path="adoptionDate" readonly="true"/></td>
                        <td><form:errors path="adoptionDate" cssStyle="color: red;"/></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Create adopion"/></td>
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

