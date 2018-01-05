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
    <link href="/resources/css/font-awesome5/fontawesome-all.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <!--  Scripts-->
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="/resources/js/materialize.js"></script>
    <script src="/resources/js/init.js"></script>

    <title>Login</title>

</head>
<body>

<jsp:include page="navbar-before-login.jsp"></jsp:include>

<div class="row">
   Home page

    <div class="w3-container">
        <h2>Coworking spaces</h2>
    </div>

    <div class="w3-content w3-display-container">

        <div class="w3-display-container mySlides">
            <img src="/resources/images/dog2.jpg" style="width:50%">
            <div class="w3-display-bottom w3-large w3-container w3-padding-16 w3-black">
                Beautiful Mountains
            </div>
        </div>

        <div class="w3-display-container mySlides">
            <img src="/resources/images/cat.jpg" style="width:50%">
            <div class="w3-display-bottom w3-large w3-container w3-padding-16 w3-black">
                The Rain Forest
            </div>
        </div>

        <div class="w3-display-container mySlides">
            <img src="/resources/images/dog.jpg" style="width:50%">
            <div class="w3-display-bottom w3-large w3-container w3-padding-16 w3-black">
                Mountains!
            </div>
        </div>

        <button class="w3-button w3-display-left w3-black" onclick="plusDivs(-1)">&#10094;</button>
        <button class="w3-button w3-display-right w3-black" onclick="plusDivs(1)">&#10095;</button>

    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<script>
    var slideIndex = 1;
    showDivs(slideIndex);

    function plusDivs(n) {
        showDivs(slideIndex += n);
    }

    function showDivs(n) {
        var i;
        var x = document.getElementsByClassName("mySlides");
        if (n > x.length) {slideIndex = 1}
        if (n < 1) {slideIndex = x.length}
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        x[slideIndex-1].style.display = "block";
    }
</script>

</body>

</html>
