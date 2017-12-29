<%--
  Created by IntelliJ IDEA.
  User: Catalina
  Date: 01.05.2017
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>New Consultation</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#datepicker").datepicker();
        });
    </script>
</head>
<body>
<h1>New Consultation page</h1>
<a href="${pageContext.request.contextPath}/user-page">Home page</a>
<i></i><br/></body>br>

<form:form method="GET" commandName="consultation" action="${pageContext.request.contextPath}/consultation/create.html">

    Consultation ID:
    <form:input path="idConsultation" readonly="true"/></form:form>br>
    <form:errors path="idConsultation" cssStyle="color: red;"/></html>br>

    Doctor ID:</br>
    <form:input path="idEmployee"/></br>
    <form:errors path="idEmployee" cssStyle="color: red;"/></br>

    Consultation ID:</br>
    <form:input path="idClient"/></br>
    <form:errors path="idClient" cssStyle="color: red;"/></br>

    Date:</br>
    <form:input path="consultDate"/></br>
    <form:errors path="consultDate" cssStyle="color: red;"/></br>

    Hour:</br>
    <form:input path="consultHour"/></br>
    <form:errors path="consultHour" cssStyle="color: red;"/></br>

    Duration:</br>
    <form:input path="duration"/></br>
    <form:errors path="duration" cssStyle="color: red;"/></br>

    Consultation description:</br>
    <form:input path="description"/></br>
    <form:errors path="description" cssStyle="color: red;"/></br>

    <input type="submit" value="Create"/></br>

    </body>
    </html>
