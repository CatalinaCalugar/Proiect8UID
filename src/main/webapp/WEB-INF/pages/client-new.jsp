<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <link href="/resources/css/style.css" rel="stylesheet" type="text/css">
    <title>Add client page</title>
</head>
<body>
<div id="header"><a href="${pageContext.request.contextPath}/index.html" id="logo"><img src="/resources/images/logo.gif" width="310" height="114" alt=""></a>
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
            <form:form method="POST" commandName="client"
                       action="${pageContext.request.contextPath}/client/create.html">
                <table>
                    <tbody>

                    <tr>
                        <td>Client first name:</td>
                        <td><form:input path="fname"/></td>
                        <td><form:errors path="fname" cssStyle="color: red;"/></td>
                    </tr>
                    <tr>
                        <td>Client last name:</td>
                        <td><form:input path="lname"/></td>
                        <td><form:errors path="lname" cssStyle="color: red;"/></td>
                    </tr>
                    <tr>
                        <td>CNP:</td>
                        <td><form:input path="CNP"/></td>
                        <td><form:errors path="CNP" cssStyle="color: red;"/></td>
                    </tr>
                    <tr>
                        <td>Address:</td>
                        <td><form:input path="address"/></td>
                        <td><form:errors path="address" cssStyle="color: red;"/></td>
                    </tr>

                    <tr>
                        <td>Email:</td>
                        <td><form:input path="email"/></td>
                        <td><form:errors path="email" cssStyle="color: red;"/></td>
                    </tr>
                    <tr>
                        <td>Username:</td>
                        <td><form:input path="username"/></td>
                        <td><form:errors path="username" cssStyle="color: red;"/></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><form:input path="password"/></td>
                        <td><form:errors path="password" cssStyle="color: red;"/></td>
                    </tr>

                    <tr>
                        <td><input type="submit" value="Register"/></td>
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