<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <title>Consultation List page</title>
</head>
<body>
<h1>Consultation List page</h1>
<i style="color: fuchsia">${message}</i><br/>
<a href="${pageContext.request.contextPath}/doctor-page">Home page</a>
<i></i><br/>
Consultations already booked:<br/>
<table style="text-align: center;" border="1px" cellpadding="0" cellspacing="0">
    <thead>
    <tr>
        <th width="25px"> ID</th>
        <th width="25px">Client ID</th>
        <th width="50px">Date</th>
        <th width="50px">Hour</th>
        <th width="50px">Duration</th>
        <th width="50px">Description</th>


    </tr>
    </thead>
    <tbody>
    <c:forEach var="consultation" items="${consultationList}">
        <tr>
            <td>${consultation.idConsultation}</td>
            <td>${consultation.idClient}</td>
            <td>${consultation.consultDate}</td>
            <td>${consultation.consultHour}</td>
            <td>${consultation.duration}</td>
            <td>${consultation.description}</td>

            <td>
                <a href="${pageContext.request.contextPath}/consultation/edit/${consultation.idConsultation}.html">Edit</a><br/>
                <a href="${pageContext.request.contextPath}/consultation/delete/${consultation.idConsultation}.html">Delete</a><br/>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>