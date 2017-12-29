<%--
  Created by IntelliJ IDEA.
  Sectretary: Catalina
  Date: 01.04.2017
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <title>Sectretary home page</title>
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<br>
<div class="container-fluid">
    <div class="panel panel-success">
        <div class="panel-heading" align="center">
            <h1 class="header-heading">Secretary Page</h1>
        </div>
        <div class="panel-body" align="center">
            <div class="list-group " align="center">
                Sectretary page.<br/>
                <i style="color: fuchsia">${message}</i><br/>

                <i>ADD NEW Patient</i><br/>
                <a href="${pageContext.request.contextPath}/client/create.html">Create a new client</a><br/>

                <i>VIEW ALL Patients and program consultation</i><br/>
                <a href="${pageContext.request.contextPath}/client/list.html">Clients</a><br/>

                <i>VIEW ALL Consultations</i><br/>
                <a href="${pageContext.request.contextPath}/consultation/list.html">View all consultations</a><br/>

                <i>VIEW ALL Doctors</i><br/>
                <a href="${pageContext.request.contextPath}/employee/listDoctors.html">View ALL Doctors</a><br/>

                <i>VIEW doctors' schedule</i><br/>
                <a href="${pageContext.request.contextPath}/schedule/list.html">View doctors schedule</a><br/>
            </div>
            <i></i><br/>
            <a href="${pageContext.request.contextPath}/employee/logout.html">Logout</a>

            </p>
        </div>
    </div>
</div>
<div class="panel-footer" align="center"><font style="color: #111">&copy; Copyright Catalina Calugar</font></div>
</body>
</html>
