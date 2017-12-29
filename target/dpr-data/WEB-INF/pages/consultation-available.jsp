<%--
  Created by IntelliJ IDEA.
  User: Catalina
  Date: 03.05.2017
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <title>Consultation List page</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/secretary-page">Home page</a>

<h1>Consultation List page</h1>
<form:form method="POST" commandName="consultation" action="${pageContext.request.contextPath}/consultation/finalization.html" >
    Doctor schedule:<br/>
    <table style="text-align: center;" border="1px" cellpadding="0" cellspacing="0">
        <thead>
        <tr>
            <th width="100px">Day:</th>
            <th width="100px">Starting Hour:</th>
            <th width="150px">End hour</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="schedule" items="${scheduleList}">
            <tr>
                <td>${schedule.day}</td>
                <td>${schedule.startTime}</td>
                <td>${schedule.endTime}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <i></i><br/>
    Consultations made:<br/>
    <table style="text-align: center;" border="1px" cellpadding="0" cellspacing="0">
        <thead>
        <tr>
            <th width="100px">Starting Hour:</th>
            <th width="150px">Duration</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="consultation" items="${consultationList}">
            <tr>
                <td>${consultation.consultHour}</td>
                <td>${consultation.duration}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <i></i><br/>

    <table>
        <tbody>
        <tr>
            <td>Doctor id:</td>
            <td><form:input readonly="true" path="idEmployee" /></td>
            <td><form:errors path="idEmployee" cssStyle="color: red;"/></td>
        </tr>
        <tr>
            <td>Patient id:</td>
            <td><form:input readonly="true" path="idClient"/></td>
            <td><form:errors path="idClient" cssStyle="color: red;"/></td>
        </tr>
        <tr>
            <td>Date:</td>
            <td><form:input readonly="true" path="consultDate"/></td>
            <td><form:errors path="consultDate" cssStyle="color: red;"/></td>
        </tr>
        <tr>
            <td>Hour</td>
            <td><form:input path="consultHour"/></td>
            <td><form:errors path="consultHour" cssStyle="color: red;"/></td>
        </tr>
        <tr>
            <td>Duration:</td>
            <td><form:input path="duration"/></td>
            <td><form:errors path="duration" cssStyle="color: red;"/></td>
        </tr>
        <tr>
            <td>Description:</td>
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
<i style="color: fuchsia">${message}</i><br/>
<i></i><br/>

</body>
</html>
