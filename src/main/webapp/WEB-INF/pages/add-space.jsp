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
    <title>Add coworking space</title>
</head>
<body>


<jsp:include page="navbar-after-login.jsp"></jsp:include>


<div class="parallax-container">
    <div class="parallax"><img src="/resources/images/office2.jpg"></div>
</div>
<div class="section white">
    <div class="row container">

        <div class="col s3">
            <div class="truncate">
                <ul>
                    <li>
                        <a href="#name-and-description-panel">
                            <button class="waves-effect waves-light btn-large b1"
                                    style="width: 250px" >Name and description
                            </button>
                        </a>
                    </li>
                    <li>
                        <a href="#contact-details-panel">
                            <button class="waves-effect waves-light btn-large b2" style="width: 250px" >Contact details
                            </button>
                        </a>
                    </li>
                    <li>
                        <a href="#amenities-panel">
                            <button class="waves-effect waves-light btn-large b3" style="width: 250px" onclick="myFunction2()">Amenities</button>
                        </a>
                    </li>
                    <li>
                        <a href="#location-panel">
                            <button class="waves-effect waves-light btn-large b4" style="width: 250px" onclick="myFunction3()">Location</button>
                        </a>
                    </li>
                    <li>
                        <a href="#offices-panel">
                            <button class="waves-effect waves-light btn-large b5" style="width: 250px" onclick="myFunction4()">Meeting rooms
                            </button>
                        </a>
                    </li>
                    <li>
                        <a href="#opening-hours-panel">
                            <button class="waves-effect waves-light btn-large b6" style="width: 250px" onclick="myFunction5()">Opening hours
                            </button>
                        </a>
                    </li>
                    <li>
                        <a href="#photos-panel">
                            <button class="waves-effect waves-light btn-large b7" style="width: 250px" onclick="myFunction6()">General photos
                            </button>
                        </a>
                    </li>
                    <li>
                        <a href="#payment-panel">
                            <button class="waves-effect waves-light btn-large b8" style="width: 250px" onclick="myFunction7()">Payment details
                            </button>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="col s9">
            <!-- Teal page content  -->

            <form class="col s12" method="POST" commandName="user"
                  action="${pageContext.request.contextPath}/space/create.html">
                <div id="name-and-description-panel">
                    <h1>Enter name and description</h1>
                    <div class="row">

                        <div class="row">
                            <div class="input-field col s12">
                                <input id="name" name="name" type="text" class="validate">
                                <label for="name">Space name</label>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="input-field col s12">
                                <textarea id="description" rows="3" name="description"
                                          class="materialize-textarea"></textarea>
                                <label for="description" style="color: black">Description</label></div>
                        </div>
                        <br>
                    </div>
                </div>

                <div id="contact-details-panel">
                    <h1>Enter contact details</h1>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="ownerEmail" name="ownerEmail" type="text" class="validate">
                            <label for="ownerEmail">Owner's email</label>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="ownerPhone" name="ownerPhone" type="text" class="validate">
                            <label for="ownerPhone">Owner's phone</label>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="webURL" name="webURL" type="text" class="validate">
                            <label for="webURL">Website</label>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="facebookUrl" name="facebookUrl" type="text" class="validate">
                            <label for="facebookUrl">Facebook URL</label>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="twitterUrl" name="twitterUrl" type="text" class="validate">
                            <label for="twitterUrl">Twitter URL</label>
                        </div>
                    </div>

                </div>

                <div id="amenities-panel" >
                    <h1>Select amenities for your space</h1>
                    <c:forEach items="${amenities}" var="amenity">
                        <p>
                            <input type="checkbox" id=${amenity}/>
                            <label for=${amenity}>${amenity}</label>
                        </p>
                    </c:forEach>
                </div>

                <div id="location-panel">
                    <h1>Pin your coworking space's location</h1>
                    <div style=" padding-left:190px; padding-bottom: 20px">
                        <h3>My Google Map</h3>
                        <div id="map" class="center" style="width:940px; height:400px; padding-left:100px">
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
                        </div></div>
                </div>

                <div id="offices-panel" >
                    <h1>Add offices</h1>
                </div>

                <div id="opening-hours-panel" >
                    <h1>Add schedule</h1>

                </div>

                <div id="photos-panel" >
                    <h1>Add general photos of the space</h1>
                </div>

                <div id="payment-panel" >
                    <h1>Add payment details</h1>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="ISBN" name="ISBN" type="text" class="validate">
                            <label for="ISBN">ISBN</label>
                        </div>
                    </div>
                </div>
            </form>

        </div>

    </div>
</div>


<jsp:include page="footer.jsp"></jsp:include>

<script language="JavaScript">
    $(document).ready(function () {
        $('.parallax').parallax();
    });

</script>
<!--<script type="text/javascript" language="javascript" src="resource/js/core.js"></script> -->
<script language="JavaScript">
    $(document).ready(function(){
        $(".b1").click(function(){
            $("#name-and-description-panel").show();
            $("#contact-details-panel").hide();
            $("#amenities-panel").hide();
            $("#location-panel").hide();
            $("#offices-panel").hide();
            $("#opening-hours-panel").hide();
            $("#photos-panel").hide();
            $("#payment-panel").hide();

        });

    });
</script>

<script language="JavaScript">
    $(document).ready(function(){
        $(".b2").click(function(){
            $("#name-and-description-panel").hide();
            $("#contact-details-panel").show();
            $("#amenities-panel").hide();
            $("#location-panel").hide();
            $("#offices-panel").hide();
            $("#opening-hours-panel").hide();
            $("#photos-panel").hide();
            $("#payment-panel").hide();

        });

    });
</script>
<script language="JavaScript">
    $(document).ready(function(){
        $(".b3").click(function(){
            $("#name-and-description-panel").hide();
            $("#contact-details-panel").hide();
            $("#amenities-panel").show();
            $("#location-panel").hide();
            $("#offices-panel").hide();
            $("#opening-hours-panel").hide();
            $("#photos-panel").hide();
            $("#payment-panel").hide();

        });

    });
</script>
<script language="JavaScript">
    $(document).ready(function(){
        $(".b4").click(function(){
            $("#name-and-description-panel").hide();
            $("#contact-details-panel").hide();
            $("#amenities-panel").hide();
            $("#location-panel").show();
            $("#offices-panel").hide();
            $("#opening-hours-panel").hide();
            $("#photos-panel").hide();
            $("#payment-panel").hide();

        });

    });
</script>
<script language="JavaScript">
    $(document).ready(function(){
        $(".b5").click(function(){
            $("#name-and-description-panel").hide();
            $("#contact-details-panel").hide();
            $("#amenities-panel").hide();
            $("#location-panel").hide();
            $("#offices-panel").show();
            $("#opening-hours-panel").hide();
            $("#photos-panel").hide();
            $("#payment-panel").hide();

        });

    });
</script>
<script language="JavaScript">
    $(document).ready(function(){
        $(".b6").click(function(){
            $("#name-and-description-panel").hide();
            $("#contact-details-panel").hide();
            $("#amenities-panel").hide();
            $("#location-panel").hide();
            $("#offices-panel").hide();
            $("#opening-hours-panel").show();
            $("#photos-panel").hide();
            $("#payment-panel").hide();

        });

    });
</script>
<script language="JavaScript">
    $(document).ready(function(){
        $(".b7").click(function(){
            $("#name-and-description-panel").hide();
            $("#contact-details-panel").hide();
            $("#amenities-panel").hide();
            $("#location-panel").hide();
            $("#offices-panel").hide();
            $("#opening-hours-panel").hide();
            $("#photos-panel").show();
            $("#payment-panel").hide();

        });

    });
</script>
<script language="JavaScript">
    $(document).ready(function(){
        $(".b8").click(function(){
            $("#name-and-description-panel").hide();
            $("#contact-details-panel").hide();
            $("#amenities-panel").hide();
            $("#location-panel").hide();
            $("#offices-panel").hide();
            $("#opening-hours-panel").hide();
            $("#photos-panel").hide();
            $("#payment-panel").show();

        });

    });
</script>


</body>
</html>
