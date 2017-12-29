<%--
  Created by IntelliJ IDEA.
  User: Catalina
  Date: 02.04.2017
  Time: 19:12
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <title>Transfer page</title>
</head>
<body>
<h1>Transfer Client page</h1>
<a href="${pageContext.request.contextPath}/report/reports">View all employees</a><br/>
<i></i><br/>
<form:form method="GET" commandName="report"
           action="${pageContext.request.contextPath}/report/genReportTable/${id}${startDate}${endDate}.html">
    <table>
        <tbody>
        <tr>
            <td> Id employee:</td>
            <td><form:input path="id" readonly="true"/></td>
            <td><form:errors path="id" cssStyle="color: red;"/></td>
        </tr>
        <tr>
            Type requested data:
        </tr>
        <tr>
            <td>Start date: (Format required: yyyy-mm-dd)</td>
            <td><form:input path="startDate"/></td>
            <td><form:errors path="startDate" cssStyle="color: red;"/></td>
        </tr>

        <tr>
            <td>End date: (Format required: yyyy-mm-dd)</td>
            <td><form:input path="endDate"/></td>
            <td><form:errors path="endDate" cssStyle="color: red;"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="OK"/></td>
            <td></td>
            <td></td>
        </tr>
        </tbody>
    </table>
</form:form>
</body>
</html>
