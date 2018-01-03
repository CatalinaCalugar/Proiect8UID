<%--
  Created by IntelliJ IDEA.
  User: cata_
  Date: 12/29/2017
  Time: 2:32 PM
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
    <link href="/resources/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

    <!--  Scripts-->
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="/resources/js/materialize.js"></script>
    <script src="/resources/js/init.js"></script>

    <title>Login</title>

</head>
<body>

<jsp:include page="navbar-after-login.jsp"></jsp:include>

<div class="row">
    <form class="col s12">
        <div class="row">
            <div class="input-field col s12">
                <input id="username" type="text" class="validate">
                <label for="username">Username</label>
            </div>
        </div>

        <br>

        <div class="row">
            <div class="input-field col s12">
                <input id="password" type="password" class="validate">
                <label for="password">Password</label>
            </div>
        </div>

        <br>

        <button class="btn waves-effect waves-light" type="submit" name="action">Login
            <i class="material-icons right"></i>
        </button>

    </form>
</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>

</html>
