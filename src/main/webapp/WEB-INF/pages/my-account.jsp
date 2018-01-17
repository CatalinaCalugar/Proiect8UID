<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js" type="text/javascript"></script>
    <title>My Account Page</title>
</head>
<body>

<!-- Page Layout here -->

<div class="col s3">
    <ul id="slide-out" class="side-nav fixed">
        <li>
            <div class="user-view">
                <div class="background">
                    <img src="/resources/images/whitePicture.jpg">
                </div>
                <a href="#!user"><img class="circle" src="/resources/images/userLogo.jpg"></a>
                <a href="#!name"><span class="black-text name">${username}</span></a>
                <a href="#!email"><span class="black-text email">email@gmail.com</span></a>
            </div>
        </li>
        <li><a href="${pageContext.request.contextPath}/user/edit-account.html"><i class="material-icons">edit</i>Edit
            account</a></li>
        <li><a href="${pageContext.request.contextPath}/space/create.html"><i class="material-icons">add</i>Add
            coworking
            space</a></li>
        <li><a href="${pageContext.request.contextPath}/space/edit.html"><i class="material-icons">create</i>Manage
            coworking space</a></li>
        <li><a class="modal-trigger" href="#modalBanUser"><i class="material-icons">content_cut</i>Ban
            user</a>
        </li>
        <li><a href="${pageContext.request.contextPath}/user/logout.html"><i class="material-icons">exit_to_app</i>Log
            out</a></li>
    </ul>

</div>
<jsp:include page="navbar-after-login.jsp"></jsp:include>

<c:if test=""></c:if>

<div class="row">
    <div class="col s9">

        <h1>Your account page</h1>
        <div class="right-align" style="color: orange;">
            <h1 class="text-darken-4">${message}</h1>
        </div>
        <!-- Modal Structure -->
        <div id="modalBanUser" class="modal">
            <div class="modal-content">
                <h4>Ban User</h4>
                <form class="col s12" method="POST" commandName="user"
                      action="${pageContext.request.contextPath}/user/ban.html">
                    <h5>Users who reserved one of your spaces: </h5>
                    <c:forEach items="${userList}" var="user">
                        <p>
                            <input type="checkbox" name="userToBan" id="${user}"/>
                            <label for="${user}">${user}</label>
                        </p>
                    </c:forEach>
                    <div class="row">
                        <div class="input-field col s12">
                                <textarea id="banMessage" rows="3" name="banMessage"
                                          class="materialize-textarea" required="" aria-required="true"></textarea>
                            <label for="banMessage">Tell us the reason why you want to ban this user</label></div>
                    </div>
                    <button class="btn waves-effect waves-light waves-ripple" type="submit" name="action">Ban
                        <i class="material-icons right"></i>
                    </button>
                </form>
            </div>
            <div class="modal-footer">
                <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Close</a>
            </div>
        </div>
        <img src="/resources/images/myAccountBackground.png" width="140%">
        <%--<jsp:include page="footer.jsp"></jsp:include>--%>
    </div>

</div>

<script language="JavaScript">
    $(document).ready(function () {
        // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
        $('.modal').modal();
    });
</script>
</body>

</html>
