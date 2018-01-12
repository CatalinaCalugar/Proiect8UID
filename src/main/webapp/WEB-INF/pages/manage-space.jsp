<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: cata_
  Date: 1/5/2018
  Time: 1:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
    <!-- CSS  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="/resources/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="/resources/css/font-awesome5/fontawesome-all.css" type="text/css" rel="stylesheet"
          media="screen,projection"/>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <!--  Scripts-->
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="/resources/js/materialize.js"></script>
    <script src="/resources/js/init.js"></script>
    <title>Manage space</title>
</head>
<body>

<jsp:include page="navbar-after-login.jsp"></jsp:include>

<div class="w3-content w3-display-container">
    <table class="tabelForSpaces">
        <thead>
        <tr>
            <th data-field="generalPhotos">Space Image</th>
            <th data-field="name">Space Name</th>
            <th data-field="description">Space Description</th>
            <th data-field="generalAmenities">Space Amenities</th>
            <th data-field="edit">Edit</th>
            <th data-field="delete">Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:set var="count" value="1" scope="page"/>
        <c:forEach var="space" items="${spaceList}">
            <tr class="clicker">
                <td><img src="/resources/images/genSp${count}.jpg" width="300" height="158"></td>
                <td>${space.name}</td>
                <td>${space.description}</td>
                <td>${space.generalAmenities}</td>
                <td><a class="btn" href="${pageContext.request.contextPath}/space/edit/${count}.html">Edit</a></td>
                <td><a class="btn" href="${pageContext.request.contextPath}/space/delete/${count}.html">Delete</a></td>
            </tr>
            <tr class="other">
                <td>Name:</td>
                <td>${space.name}</td>
            </tr>
            <tr class="other">
                <td>Owner Email:</td>
                <td>${space.ownerEmail}</td>
            </tr>
            <tr class="other">
                <td>Owner Phone:</td>
                <td>${space.ownerPhone}</td>
            </tr>
            <c:set var="count" value="${count + 1}" scope="page"/>
        </c:forEach>
        </tbody>
    </table>
</div>
<jsp:include page="footer.jsp"></jsp:include>

<script language="JavaScript">
    $(document).ready(function () {
        var rows = $('table.tabelForSpaces tr');
        var toShow = rows.filter('.clicker').show();
        var toHide = rows.filter('.other').hide();
    });

    $('.clicker').click(function () {
        $(this).nextUntil('.clicker').slideToggle('normal');
    });

</script>

</body>
</html>
