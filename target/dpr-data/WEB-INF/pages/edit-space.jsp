<%--
  Created by IntelliJ IDEA.
  User: Catalina
  Date: 1/12/2018
  Time: 4:47 PM
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
    <title>Edit space</title>
</head>
<body>
<jsp:include page="navbar-after-login.jsp"></jsp:include>

<div class="row">
    <div class="center-align">
        <img class="materialboxed" width="300" src="/resources/images/genSp${space.id}.jpg" alt="Space IMG">
    </div>

    <div class="row center">
        <form class="col s6" method="POST" commandName="space"
              action="${pageContext.request.contextPath}/space/edit/${space.id}.html">

            <div class="row">
                <div class="input-field col s12">
                    <input id="name" name="name" type="text" class="validate" value="${space.name}">
                    <label for="name">Space name</label>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s12">
                                <textarea id="description" rows="3" name="description"
                                          class="materialize-textarea">${space.description}</textarea>
                    <label for="description">Description</label></div>
            </div>



        </form>
    </div>
</div>


<jsp:include page="footer.jsp"></jsp:include>

<script language="JavaScript">
    $(document).ready(function () {
        $('.materialboxed').materialbox();
    });
</script>
</body>
</html>
