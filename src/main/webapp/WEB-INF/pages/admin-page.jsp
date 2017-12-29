<%--
  Created by IntelliJ IDEA.
  User: Catalina
  Date: 01.04.2017
  Time: 17:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <title>Admin page</title>
    <link href="/resources/css/style.css" rel="stylesheet" type="text/css">
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
            <ul>
                <li><a href="${pageContext.request.contextPath}/employee/create.html"><img
                        src="/resources/images/newEmpl.png" width="160" height="160" alt=""></a>
                    <h2>Add new employee</h2>
                    <p><a class="more"
                          href="${pageContext.request.contextPath}/employee/create.html">Add</a></p>
                </li>
                <li><a href="${pageContext.request.contextPath}/employee/list.html"><img
                        src="/resources/images/viewEmpl.png" width="160" height="160" alt=""></a>
                    <h2>View all employees</h2>
                    <p><a class="more"
                          href="${pageContext.request.contextPath}/employee/list.html">View and edit all employees</a>
                    </p>
                </li>
                <li><a href="${pageContext.request.contextPath}/pet/create.html"><img
                        src="/resources/images/puppy.jpg" width="114" height="160" alt=""></a>
                    <h2>Add pets</h2>
                    <p><a class="more"
                          href="${pageContext.request.contextPath}/pet/create.html">Add pet</a>
                    </p>
                </li>
                <li><a href="${pageContext.request.contextPath}/pet/listAdmin/all.html"><img
                        src="/resources/images/cat4.jpg" width="118" height="160" alt=""></a>
                    <h2>View all pets</h2>
                    <p><a class="more"
                          href="${pageContext.request.contextPath}/pet/listAdmin/all.html">View and edit all pets</a>
                    </p>
                </li>
                <li><a href="${pageContext.request.contextPath}/accessorises/create.html"><img
                        src="/resources/images/accPet.jpg" width="160" height="120" alt=""></a>
                    <h2>Add accessorises</h2>
                    <p><a class="more"
                          href="${pageContext.request.contextPath}/accessorises/create.html">Add accessorise</a>
                    </p>
                </li>
                <li><a href="${pageContext.request.contextPath}/accessorises/list.html"><img
                        src="/resources/images//accPet.jpg" width="160" height="120" alt=""></a>
                    <h2>View all accessorises</h2>
                    <p><a class="more"
                          href="${pageContext.request.contextPath}/accessorises/list.html">View and edit all accessorises</a>
                    </p>
                </li>"
                <li><a href="${pageContext.request.contextPath}/client/create.html"><img
                        src="/resources/images/client.jpg" width="160" height="140" alt=""></a>
                    <h2>Add client</h2>
                    <p><a class="more"
                          href="${pageContext.request.contextPath}/client/create.html">Add client</a>
                    </p>
                </li>
                <li><a href="${pageContext.request.contextPath}/client/list.html"><img
                        src="/resources/images/client.jpg" width="160" height="140" alt=""></a>
                    <h2>View all clients</h2>
                    <p><a class="more"
                          href="${pageContext.request.contextPath}/client/list.html">View and edit all clients</a>
                    </p>
                </li>

            </ul>
        </div>
    </div>
</div>
</body>
</html>
