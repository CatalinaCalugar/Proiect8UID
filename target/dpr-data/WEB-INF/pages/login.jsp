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
    <!-- Compiled and minified CSS -->
    <link href="/resources/css/materialize.min.css" rel="stylesheet" type="text/css"/>
    <!-- Compiled and minified JavaScript -->
    <%--<script src="/resources/js/materialize.min.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
    <title>Login</title>

</head>
<body>

<jsp:include page="navbar-before-login.jsp"></jsp:include>

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

<script language="JavaScript">

    // A $( document ).ready() block.
    $(document).ready(function () {
        $(".dropdown-button").dropdown();
    });

</script>

</html>
