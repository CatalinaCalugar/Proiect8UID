<%--
  Created by IntelliJ IDEA.
  User: Catalina
  Date: 01.05.2017
  Time: 18:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <title>Edit Consultation page</title>
</head>
<body>
<h1>Edit Consultation page</h1>
<a href="${pageContext.request.contextPath}/consultation/list">Home page</a>
<i></i><br/>
<form:form method="POST" commandName="consultation"
           action="${pageContext.request.contextPath}/consultation/edit/${consultation.id}.html">
    <table>
        <tbody>
        <tr>
            <td>Consultation ID:</td>
            <td><form:input path="idConsultation" readonly="true"/></td>
            <td><form:errors path="idConsultation" cssStyle="color: red;"/></td>
        </tr>
        <tr>
            <td>Doctor ID:</td>
            <td><form:input path="idEmployee"/></td>
            <td><form:errors path="idEmployee" cssStyle="color: red;"/></td>
        </tr>
        <tr>
            <td>Client ID:</td>
            <td><form:input path="idClient"/></td>
            <td><form:errors path="idClient" cssStyle="color: red;"/></td>
        </tr>
        <tr>
            <td>Date:</td>
            <td><form:input path="consultDate"/></td>
            <td><form:errors path="consultDate" cssStyle="color: red;"/></td>
        </tr>
        <tr>
            <td>Hour:</td>
            <td><form:input path="consultHour"/></td>
            <td><form:errors path="consultHour" cssStyle="color: red;"/></td>
        </tr>

        <tr>
            <td>Duration:</td>
            <td><form:input path="duration"/></td>
            <td><form:errors path="duration" cssStyle="color: red;"/></td>
        </tr>

        <tr>
            <td>Consultation description:</td>
            <td><form:input path="description"/></td>
            <td><form:errors path="description" cssStyle="color: red;"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="Create"/></td>
            <td></td>
            <td></td>
        </tr>
        </tbody>
    </table>
</form:form>
</body>
</html>
