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

    <!--  Scripts-->
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="/resources/js/materialize.js"></script>
    <script src="/resources/js/init.js"></script>

    <title>Home page</title>

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
            <div class="row">
                <a href="${pageContext.request.contextPath}/space/view/1" id="logo1">
                    <div class="col s4">
                        <img src="/resources/images/genSp1.jpg" width="300" height="158">
                        <div class="w3-display-bottom w3-large w3-container w3-padding-16 w3-white">
                            Space 1
                        </div>
                        <div class="w3-display-bottom w3-small w3-container w3-padding-16 w3-white">
                            dsd adsa dasdv fawaw sefe
                        </div>
                    </div>
                </a>

                <div class="col s4">
                    <img src="/resources/images/genSp2.jpg" width="300" height="158">
                    <div class="w3-display-bottom w3-large w3-container w3-padding-16 w3-white">
                        Space 2
                    </div>
                    <div class="w3-display-bottom w3-small w3-container w3-padding-16 w3-white">
                        dsd adsa dasdv fawaw sefe
                    </div>
                </div>
                <div class="col s4">
                    <img src="/resources/images/genSp3.jpg" width="300" height="158">
                    <div class="w3-display-bottom w3-large w3-container w3-padding-16 w3-white">
                        Space 3
                    </div>
                    <div class="w3-display-bottom w3-small w3-container w3-padding-16 w3-white">
                        dsd adsa dasdv fawaw sefe
                    </div>
                </div>

            </div>

        </div>

        <div class="w3-display-container mySlides">
            <div class="row">

                <div class="col s4">
                    <a href="${pageContext.request.contextPath}/space/view/4.html" id="logo4"><img
                            src="/resources/images/genSp4.jpg" width="300" height="158"></a>
                    <div class="w3-display-bottom w3-large w3-container w3-padding-16 w3-white">
                        Space 4
                    </div>
                    <div class="w3-display-bottom w3-small w3-container w3-padding-16 w3-white">
                        dsd adsa dasdv fawaw sefe
                    </div>
                </div>
                <div class="col s4">
                    <img src="/resources/images/genSp5.jpg" width="300" height="158">
                    <div class="w3-display-bottom w3-large w3-container w3-padding-16 w3-white">
                        Space 5
                    </div>
                    <div class="w3-display-bottom w3-small w3-container w3-padding-16 w3-white">
                        dsd adsa dasdv fawaw sefe
                    </div>
                </div>
                <div class="col s4">
                    <img src="/resources/images/genSp6.jpg" width="300" height="158">
                    <div class="w3-display-bottom w3-large w3-container w3-padding-16 w3-white">
                        Space 6
                    </div>
                    <div class="w3-display-bottom w3-small w3-container w3-padding-16 w3-white">
                        dsd adsa dasdv fawaw sefe
                    </div>
                </div>

            </div>
        </div>

        <div class="w3-display-container mySlides">
            <div class="row">

                <div class="col s4">
                    <a href="${pageContext.request.contextPath}/space/view/7.html" id="logo"><img
                            src="/resources/images/genSp7.jpg" width="300" height="158"></a>
                    <div class="w3-display-bottom w3-large w3-container w3-padding-16 w3-white">
                        Space 7
                    </div>
                    <div class="w3-display-bottom w3-small w3-container w3-padding-16 w3-white">
                        dsd adsa dasdv fawaw sefe
                    </div>
                </div>
                <div class="col s4">
                    <img src="/resources/images/genSp8.jpg" width="300" height="158">
                    <div class="w3-display-bottom w3-large w3-container w3-padding-16 w3-white">
                        Space 8
                    </div>
                    <div class="w3-display-bottom w3-small w3-container w3-padding-16 w3-white">
                        dsd adsa dasdv fawaw sefe
                    </div>
                </div>
                <div class="col s4">
                    <img src="/resources/images/genSp9.jpg" width="300" height="158">
                    <div class="w3-display-bottom w3-large w3-container w3-padding-16 w3-white">
                        Space 9
                    </div>
                    <div class="w3-display-bottom w3-small w3-container w3-padding-16 w3-white">
                        dsd adsa dasdv fawaw sefe
                    </div>
                </div>

            </div>
        </div>

        <button class="w3-button w3-display-left w3-black" onclick="plusDivs(-1)">&#10094;</button>
        <button class="w3-button w3-display-right w3-black" onclick="plusDivs(1)">&#10095;</button>

    </div>

    <div  style=" padding-left:190px; padding-bottom: 20px">
        <h3>My Google Map</h3>
        <div id="map" style="width:940px; height:400px; padding-left:100px">
        <script>
            function myMap() {
                var mapOptions = {
                    center: new google.maps.LatLng(46.770439, 23.591423),
                    center: new google.maps.LatLng(46.770439, 23.591423),
                    zoom: 10,
                    mapTypeId: google.maps.MapTypeId.HYBRID
                }
                var map = new google.maps.Map(document.getElementById("map"), mapOptions);
            }
        </script>
        <script async defer
            src="https://maps.googleapis.com/maps/api/js?callback=myMap">
        </script>
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
        if (n > x.length) {
            slideIndex = 1
        }
        if (n < 1) {
            slideIndex = x.length
        }
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        x[slideIndex - 1].style.display = "block";
    }
</script>

</body>

</html>
