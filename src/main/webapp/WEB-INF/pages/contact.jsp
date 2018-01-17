<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="/resources/css/font-awesome5/fontawesome-all.css" type="text/css" rel="stylesheet"
          media="screen,projection"/>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <LINK rel="stylesheet" href="/resources/css/home.css" type="text/css">

    <!--  Scripts-->
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="/resources/js/materialize.js"></script>
    <script src="/resources/js/init.js"></script>

    <title>Contact us</title>

</head>
<body>

<c:choose>
    <c:when test="${isLogged == true}">
        <jsp:include page="navbar-after-login.jsp"></jsp:include>
    </c:when>
    <c:when test="${isLogged == false}">
        <jsp:include page="navbar-before-login.jsp"></jsp:include>
    </c:when>
</c:choose>

<div class="row">
    <iv class="w3-content w3-display-container">
        <div style=" padding-left:190px;">
            <h3>Contact us</h3>
        </div>

        <div class="row" style="width:1000px; padding-left:80px">
            <form class="col s12" id="contact">
                <div class="row">
                    <div class="input-field col s6">
                        <input id="contact_first_name" type="text" class="validate" name="first_name" required=""
                               aria-required="true">
                        <label for="contact_first_name" data-error="We would like to know with who we are talking to"
                               data-success="">First Name</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="contact_last_name" type="text" class="validate" name="last_name" required=""
                               aria-required="true">
                        <label for="contact_last_name" data-error="We would like to know with who we are talking to"
                               data-success="">Last Name</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="contact_email" type="email" class="validate" name="email" required=""
                               aria-required="true">
                        <label for="contact_email" data-error="E-mail is not in the right format. Try again!"
                               data-success="Good to go">Email</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <i class="material-icons prefix">mode_edit</i>
                        <textarea id="contact_message" class="materialize-textarea" name="message" required=""
                                  aria-required="true"></textarea>
                        <label for="contact_message">Message</label>
                    </div>
                </div>
                <!-- Modal Trigger -->
                <div id="contact_submit">
                    <button id="btn" data-target="modalSuccess" class="btn modal-trigger" type="submit" name="action"
                            onclick="validateForm()">Submit
                    </button>
                </div>
            </form>

            <!-- Modal Structure -->
            <div id="modalSuccess" class="modal">
                <div class="modal-content">
                    <p>Your message was sent!</p>
                    <p>We will contact you soon!</p>
                </div>
                <div class="modal-footer">
                    <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Close</a>
                </div>
            </div>
        </div>
    </iv>
</div>


<jsp:include page="footer.jsp"></jsp:include>

<script>
    function validateForm() {
        var form = document.getElementById("contact");

        $(document).ready(function () {
            var error_free = true;

            var name = document.getElementById("contact_first_name");

            if (name === "")
                error_free = false;

            if (error_free) {
                $('#modalSuccess').modal();
            }

            form.reset();
        });
    }
</script>
</body>

</html>