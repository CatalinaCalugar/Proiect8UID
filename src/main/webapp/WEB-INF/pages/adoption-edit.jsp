<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <title>Edit Adoption page</title>
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

            <form:form method="POST" commandName="adoption"
                       action="${pageContext.request.contextPath}/adoption/edit/${adoption.id}.html">
                <table>
                    <tbody>
                    <tr>
                        <td>ID:</td>
                        <td><form:input path="id"/></td>
                        <td><form:errors path="id" cssStyle="color: red;"/></td>
                    </tr>
                    <tr>
                        <td>ID Client:</td>
                        <td><form:input path="idClient"/></td>
                        <td><form:errors path="idClient" cssStyle="color: red;"/></td>
                    </tr>
                    <tr>
                        <td>ID Employee:</td>
                        <td><form:input path="idEmployee"/></td>
                        <td><form:errors path="idEmployee" cssStyle="color: red;"/></td>
                    </tr>

                    <tr>
                        <td>ID Pet:</td>
                        <td><form:input path="idPet"/></td>
                        <td><form:errors path="idPet" cssStyle="color: red;"/></td>
                    </tr>
                    <tr>
                        <td>Start date:</td>
                        <td><form:input path="startDate"/></td>
                        <td><form:errors path="startDate" cssStyle="color: red;"/></td>
                    </tr>
                    <tr>
                        <td>End date:</td>
                        <td><form:input path="endDate"/></td>
                        <td><form:errors path="endDate" cssStyle="color: red;"/></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Edit"/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    </tbody>
                </table>
            </form:form>
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
