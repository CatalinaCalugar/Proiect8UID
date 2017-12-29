<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <title>Schedule List page</title>
</head>
<body>
<h1>Schedule List page</h1>
<i style="color: fuchsia">${message}</i><br/>
<a href="${pageContext.request.contextPath}/secretary-page">Home page</a>
<i></i><br/>
<table style="text-align: center;" border="1px" cellpadding="0" cellspacing="0">
    <thead>
    <tr>
        <th width="25px">ID</th>
        <th width="150px">Doctor ID</th>
        <th width="25px">Day</th>
        <th width="50px">Start hour</th>
        <th width="50px">End hour</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="schedule" items="${scheduleList}">
        <tr>
            <td>${schedule.idSchedule}</td>
            <td>${schedule.idDoctor}</td>
            <td>${schedule.day}</td>
            <td>${schedule.startTime}</td>
            <td>${schedule.endTime}</td>
            <td>
                <a href="${pageContext.request.contextPath}/schedule/edit/${schedule.idSchedule}.html">Edit</a><br/>
                <a href="${pageContext.request.contextPath}/schedule/delete/${schedule.idSchedule}.html">Delete</a><br/>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>