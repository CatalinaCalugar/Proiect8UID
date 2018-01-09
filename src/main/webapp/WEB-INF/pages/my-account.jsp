<%--
  Created by IntelliJ IDEA.
  User: cata_
  Date: 1/5/2018
  Time: 1:28 PM
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
    <title>My Accout Page</title>
</head>
<body>

<!-- Page Layout here -->

    <div class="col s3">
        <ul id="slide-out" class="side-nav fixed">
            <li>
                <div class="user-view">
                    <div class="background">
                        <img src="/resources/images/desk.jpg">
                    </div>
                    <a href="#!user"><img class="circle" src="/resources/images/userLogo.jpg"></a>
                    <a href="#!name"><span class="white-text name">${username}</span></a>
                    <a href="#!email"><span class="white-text email">email@gmail.com</span></a>
                </div>
            </li>
            <li><a href="#!"><i class="material-icons">edit</i>Edit account</a></li>
            <li><a href="${pageContext.request.contextPath}/space/create.html"><i class="material-icons">add</i>Add
                coworking
                space</a></li>
            <li><a href=a href="${pageContext.request.contextPath}/space/edit.html"><i class="material-icons">create</i>Manage
                coworking space</a></li>
            <li><a href="#!"><i class="material-icons">content_cut</i>Ban user</a></li>
            <li><a href="#!"><i class="material-icons">exit_to_app</i>Log out</a></li>
        </ul>

    </div>
    <jsp:include page="navbar-after-login.jsp"></jsp:include>

<div class="row">
    <div class="col s9">

        My account page

        <%--<jsp:include page="footer.jsp"></jsp:include>--%>

    </div>

</div>
</body>

</html>
