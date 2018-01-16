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

    <div class="center-align" style="color: orange">
        <h1>${message}</h1>
    </div>

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
        <c:forEach var="space" items="${spaceList}">
            <tr class="clicker" style="border-top: solid">
                <td><img src="/resources/images/genSp${space.id}.jpg" width="300" height="158"></td>
                <td>${space.name}</td>
                <td>${space.description}</td>
                <td>${space.generalAmenities}</td>
                <td><a class="btn"
                       href="${pageContext.request.contextPath}/space/edit/${space.id}.html">Edit</a></td>
                <td><a class="waves-effect waves-light btn modal-trigger" href="#modalDel">Delete</a>

                    <!-- Modal Structure -->
                    <div id="modalDel" class="modal">
                        <div class="modal-content">
                            <h4>Are you sure you yant to delete this space?</h4>
                        </div>
                        <div class="modal-footer">
                            <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">No</a>
                            <a href="${pageContext.request.contextPath}/space/delete/${space.id}.html"
                               class="modal-action modal-close waves-effect waves-green btn-flat">Yes</a>
                        </div>
                    </div>
                </td>
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
            <tr class="other">
                <td>Website:</td>
                <td>${space.webURL}</td>
            </tr>
            <tr class="other">
                <td>Facebook:</td>
                <td>${space.facebookUrl}</td>
            </tr>
            <tr class="other">
                <td>Twitter:</td>
                <td>${space.twitterUrl}</td>
            </tr>
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

<script language="JavaScript">
    $(document).ready(function () {
        $('.tooltipped').tooltip({delay: 50});
    });
</script>

<script language="JavaScript">
    $(document).ready(function () {
        // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
        $('.modal').modal();
    });
</script>

</body>
</html>
