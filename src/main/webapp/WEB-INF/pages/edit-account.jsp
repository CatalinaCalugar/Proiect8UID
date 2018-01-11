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
    <title>Edit Accout Page</title>
</head>
<body>

<jsp:include page="navbar-after-login.jsp"></jsp:include>

<div class="row">
    <div class="col s3">

        <img class="circle" src="/resources/images/userLogoBig.jpg" width="300px">
        <div class="center-align">
            <h2><span class="black-text name">${username}</span></h2>
            <h3><span class="green-text email">email@gmail.com</span></h3>
        </div>
    </div>

    <div class="col s9">

        <h1>Tell us something about yourself <i class="material-icons">border_color</i></h1>
        <br>
        <div class="center-align">
            <form class="col s12" method="POST" commandName="user"
                  action="${pageContext.request.contextPath}/user/edit-account.html">
                <div class="row">
                    <div class="input-field col s12 center-align">
                        <input id="name" name="name" type="text" class="validate" value="${name}" readonly
                               style=" font-size: 20px">
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <input type="text" id="datepicker" class="datepicker" name="birthDate">
                        <label for="datepicker">Date of birth </label>
                    </div>
                </div>

                <div class="row">
                    <form class="col s12">
                        <div class="row">
                            <div class="input-field col s12">
                                <textarea id="textarea1" class="materialize-textarea" name="description"></textarea>
                                <label for="textarea1">Description</label>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="row">
                    <div class="col col s12">
                        <button id="send-message" class="btn waves-effect waves-light" type="submit" name="action">Edit
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<script language="JavaScript">
    $('.datepicker').pickadate({
        selectMonths: true, // Creates a dropdown to control month
        selectYears: 15, // Creates a dropdown of 15 years to control year,
        today: 'Today',
        clear: 'Clear',
        close: 'Ok',
        closeOnSelect: false // Close upon selecting a date,
    });
</script>
</body>

</html>
