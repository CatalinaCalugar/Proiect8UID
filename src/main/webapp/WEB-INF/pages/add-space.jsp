<%--
  Created by IntelliJ IDEA.
  User: cata_
  Date: 1/5/2018
  Time: 1:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <div class="col s4">
            <ul>
                <li>
                    <button id="b1" class="waves-effect waves-light btn-large b1"
                            style="width: 100%">Name and description
                    </button>
                </li>
                <li>
                    <button class="waves-effect waves-light btn-large b2" style="width: 100%">Contact details
                    </button>
                </li>
                <li>
                    <button class="waves-effect waves-light btn-large b3" style="width: 100%"
                            onclick="myFunction2()">Amenities
                    </button>
                </li>
                <li>
                    <button class="waves-effect waves-light btn-large b4" style="width: 100%"
                            onclick="myFunction3()">Location
                    </button>
                </li>
                <li>
                    <button class="waves-effect waves-light btn-large b5" style="width: 100%"
                            onclick="myFunction4()">Meeting rooms
                    </button>
                </li>
                <li>
                    <button class="waves-effect waves-light btn-large b6" style="width: 100%"
                            onclick="myFunction5()">Opening hours
                    </button>
                </li>
                <li>
                    <button class="waves-effect waves-light btn-large b7" style="width: 100%"
                            onclick="myFunction6()">General photos
                    </button>
                </li>
                <li>
                    <button class="waves-effect waves-light btn-large b8" style="width: 100%"
                            onclick="myFunction7()">Payment details
                    </button>
                </li>
            </ul>
        </div>

        <div class="col s8">
            <!-- Teal page content -->

            <form class="col s12" method="POST" commandName="space"
                  action="${pageContext.request.contextPath}/space/create.html">
                <div id="name-and-description-panel">
                    <h1>Enter name and description</h1>
                    <div class="row">

                        <div class="row">
                            <div class="input-field col s12">
                                <input id="name" name="name" type="text" class="validate" required=""
                                       aria-required="true">
                                <label for="name">Space name</label>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="input-field col s12">
                                <textarea id="description" rows="3" name="description"
                                          class="materialize-textarea" required="" aria-required="true"></textarea>
                                <label for="description">Description</label></div>
                        </div>
                        <br>
                    </div>
                </div>

                <div id="contact-details-panel">
                    <h1>Enter contact details</h1>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="ownerEmail" name="ownerEmail" type="text" class="validate" required=""
                                   aria-required="true">
                            <label for="ownerEmail">Owner's email</label>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="ownerPhone" name="ownerPhone" type="text" class="validate" required=""
                                   aria-required="true">
                            <label for="ownerPhone">Owner's phone</label>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="webURL" name="webURL" type="text" class="validate" required=""
                                   aria-required="true">
                            <label for="webURL">Website</label>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="facebookUrl" name="facebookUrl" type="text" class="validate" required=""
                                   aria-required="true">
                            <label for="facebookUrl">Facebook URL</label>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="twitterUrl" name="twitterUrl" type="text" class="validate" required=""
                                   aria-required="true">
                            <label for="twitterUrl">Twitter URL</label>
                        </div>
                    </div>

                </div>

                <div id="amenities-panel">
                    <h1>Select amenities for your space</h1>
                    <c:forEach items="${generalAmenities}" var="amenity">
                        <p>
                            <input type="checkbox" id="${amenity}" name="" required="" aria-required="true"/>
                            <label for="${amenity}">${amenity}</label>
                        </p>
                    </c:forEach>
                </div>

                <div id="location-panel">
                    <h1>Pin your coworking space's location</h1>
                    <div style=" padding-bottom: 20px">
                        <h3>My Google Map</h3>
                        <div id="map" class="left" style="width:740px; height:400px;">
                            <script>
                                function myMap() {
                                    var mapOptions = {
                                        center: new google.maps.LatLng(46.770439, 23.591423),
                                        center: new google.maps.LatLng(46.770439, 23.591423),
                                        zoom: 5,
                                    }

                                    var map = new google.maps.Map(document.getElementById("map"), mapOptions);

                                    google.maps.event.addListener(map, 'click', function (event) {
                                        var myLatLng = {lat: event.latLng.lat(), lng: event.latLng.lng()};

                                        var mapOptions = {
                                            center: myLatLng,
                                            zoom: 5,
                                        }

                                        var map = new google.maps.Map(document.getElementById("map"), mapOptions);

                                        var marker = new google.maps.Marker({
                                            position: myLatLng,
                                            map: map,
                                            title: ''
                                        });

                                        alert(event.latLng.lat() + ", " + event.latLng.lng());
                                    });
                                }
                            </script>
                            <script async defer
                                    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCt-g3ZM2QSUL_ABCvv1msN6LKfcMyx2Q0&callback=myMap">
                            </script>
                        </div>
                    </div>
                </div>

                <div id="offices-panel">
                    <h1>Add offices</h1>

                    <table id="myTabel" class="table-of-contents">
                        <thead>
                        <tr>
                            <th data-field="type" width="500px">Select office type</th>
                            <th data-field="name" width="400px">Name</th>
                            <th data-field="capacity" width="300px">Capacity</th>
                            <th data-field="amenities">Office Amenities</th>
                            <th data-field="photos" width="400px">Photos</th>
                            <th data-field="price" width="200px">Price</th>
                            <th width="500px"></th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${numberOfOffices}" var="ofNr">
                            <tr style="border-bottom: solid">
                                <form class="col s12" method="POST" commandName="space"
                                      action="${pageContext.request.contextPath}/space/create-office/${ofNr}.html">
                                    <td>
                                        <select id="selector">
                                            <option value="" disabled selected>Select</option>
                                            <c:forEach items="${type}" var="number">
                                                <option value="${number}" name="type">${number}</option>
                                            </c:forEach>
                                        </select>
                                        <label for="selector">Office type</label>

                                    </td>
                                    <td>
                                            <%--<div class="input-field">--%>
                                        <input id="officeName" name="name" type="text">
                                        <label for="officeName">Office name</label>
                                            <%--</div>--%>
                                    </td>
                                    <td>
                                            <%--<div class="input-field">--%>
                                        <input id="capacity" name="capacity" type="text">
                                        <label for="capacity">Capacity</label>
                                            <%--</div>--%>
                                    </td>
                                    <td>
                                        <c:forEach items="${generalAmenities}" var="amenity">
                                            <p>
                                                <input type="checkbox" name="amenities" id=${ofNr}/>
                                                <label for=${ofNr}>${amenity}</label>
                                            </p>
                                        </c:forEach>
                                    </td>
                                    <td>
                                        <div class="file-field input-field">
                                            <div class="btn">
                                                <span>Photo</span>
                                                <input type="file" name="photo" multiple>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="input-field">
                                            <input id="price" name="price" type="text">
                                            <label for="price">Price</label>
                                        </div>
                                    </td>
                                        <%--<td>--%>
                                        <%--<button class="btn" type="submit" name="action">Addoffice ${ofNr}</button>--%>
                                        <%--</td>--%>
                                </form>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>


                </div>

                <div id="opening-hours-panel">
                    <h1>Add schedule</h1>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="tp1" type="text" class="timepicker" required="" aria-required="true">
                            <label for="tp1">Start hour</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <br>
                            <input id="tp2" type="text" class="timepicker" required="" aria-required="true">
                            <label for="tp2">End hour</label>
                        </div>
                    </div>
                </div>

                <div id="photos-panel">
                    <h1>Add general photos of the space</h1>
                    <form action="#">
                        <div class="file-field input-field">
                            <div class="btn">
                                <span>Upload photos</span>
                                <input type="file" name="generalPhotos" multiple required="" aria-required="true">
                            </div>
                            <br>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" type="text"
                                       placeholder="Upload one or more files" required="" aria-required="true">
                            </div>
                        </div>
                    </form>

                </div>

                <div id="payment-panel">
                    <h1>Add payment details</h1>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="ISBN" name="ISBN" type="text" class="validate" required="" aria-required="true">
                            <label for="ISBN">ISBN</label>
                        </div>
                        <br>
                        <br>
                    </div>

                    <button class="waves-effect waves-light btn-large tooltipped" data-position="top" data-delay="50"
                            data-tooltip="Finish and add your space" style="width: 800px"
                            type="submit" name="action">ADD SPACE
                    </button>
                </div>
            </form>

        </div>

    </div>
</div>


<jsp:include page="footer.jsp"></jsp:include>

<script language="JavaScript">
    $(document).ready(function () {
        $('.parallax').parallax();
        $("#name-and-description-panel").show();
        $("#contact-details-panel").hide();
        $("#amenities-panel").hide();
        $("#location-panel").hide();
        $("#offices-panel").hide();
        $("#opening-hours-panel").hide();
        $("#photos-panel").hide();
        $("#payment-panel").hide();
    });

</script>
<!--<script type="text/javascript" language="javascript" src="resource/js/core.js"></script> -->
<script language="JavaScript">
    $(".b1").click(function () {
        $("#name-and-description-panel").show();
        $("#contact-details-panel").hide();
        $("#amenities-panel").hide();
        $("#location-panel").hide();
        $("#offices-panel").hide();
        $("#opening-hours-panel").hide();
        $("#photos-panel").hide();
        $("#payment-panel").hide();
        if ($(".b1").css("background-color").toString() === "rgb(38, 166, 154)" || $(".b1").css("background-color").toString() === "rgb(43, 187, 173)") {
            $(".b1").css("background-color", "#e0f2f1");
            $(".b2").css("background-color", "#26a69a");
            $(".b3").css("background-color", "#26a69a");
            $(".b4").css("background-color", "#26a69a");
            $(".b5").css("background-color", "#26a69a");
            $(".b6").css("background-color", "#26a69a");
            $(".b7").css("background-color", "#26a69a");
            $(".b8").css("background-color", "#26a69a");
        }
    });
</script>

<script language="JavaScript">

    $(".b2").click(function () {
        $("#name-and-description-panel").hide();
        $("#contact-details-panel").show();
        $("#amenities-panel").hide();
        $("#location-panel").hide();
        $("#offices-panel").hide();
        $("#opening-hours-panel").hide();
        $("#photos-panel").hide();
        $("#payment-panel").hide();
        if ($(".b2").css("background-color").toString() === "rgb(38, 166, 154)" || $(".b2").css("background-color").toString() === "rgb(43, 187, 173)") {
            $(".b2").css("background-color", "#e0f2f1");
            $(".b1").css("background-color", "#26a69a");
            $(".b3").css("background-color", "#26a69a");
            $(".b4").css("background-color", "#26a69a");
            $(".b5").css("background-color", "#26a69a");
            $(".b6").css("background-color", "#26a69a");
            $(".b7").css("background-color", "#26a69a");
            $(".b8").css("background-color", "#26a69a");
        }
    });


</script>
<script language="JavaScript">

    $(".b3").click(function () {
        $("#name-and-description-panel").hide();
        $("#contact-details-panel").hide();
        $("#amenities-panel").show();
        $("#location-panel").hide();
        $("#offices-panel").hide();
        $("#opening-hours-panel").hide();
        $("#photos-panel").hide();
        $("#payment-panel").hide();
        if ($(".b3").css("background-color").toString() === "rgb(38, 166, 154)" || $(".b3").css("background-color").toString() === "rgb(43, 187, 173)") {
            $(".b3").css("background-color", "#e0f2f1");
            $(".b1").css("background-color", "#26a69a");
            $(".b2").css("background-color", "#26a69a");
            $(".b4").css("background-color", "#26a69a");
            $(".b5").css("background-color", "#26a69a");
            $(".b6").css("background-color", "#26a69a");
            $(".b7").css("background-color", "#26a69a");
            $(".b8").css("background-color", "#26a69a");
        }
    });


</script>
<script language="JavaScript">

    $(".b4").click(function () {
        $("#name-and-description-panel").hide();
        $("#contact-details-panel").hide();
        $("#amenities-panel").hide();
        $("#location-panel").show();
        $("#offices-panel").hide();
        $("#opening-hours-panel").hide();
        $("#photos-panel").hide();
        $("#payment-panel").hide();
        if ($(".b4").css("background-color").toString() === "rgb(38, 166, 154)" || $(".b4").css("background-color").toString() === "rgb(43, 187, 173)") {
            $(".b4").css("background-color", "#e0f2f1");
            $(".b1").css("background-color", "#26a69a");
            $(".b2").css("background-color", "#26a69a");
            $(".b3").css("background-color", "#26a69a");
            $(".b5").css("background-color", "#26a69a");
            $(".b6").css("background-color", "#26a69a");
            $(".b7").css("background-color", "#26a69a");
            $(".b8").css("background-color", "#26a69a");
        }
    });


</script>
<script language="JavaScript">

    $(".b5").click(function () {
        $("#name-and-description-panel").hide();
        $("#contact-details-panel").hide();
        $("#amenities-panel").hide();
        $("#location-panel").hide();
        $("#offices-panel").show();
        $("#opening-hours-panel").hide();
        $("#photos-panel").hide();
        $("#payment-panel").hide();
        if ($(".b5").css("background-color").toString() === "rgb(38, 166, 154)" || $(".b5").css("background-color").toString() === "rgb(43, 187, 173)") {
            $(".b5").css("background-color", "#e0f2f1");
            $(".b1").css("background-color", "#26a69a");
            $(".b2").css("background-color", "#26a69a");
            $(".b3").css("background-color", "#26a69a");
            $(".b4").css("background-color", "#26a69a");
            $(".b6").css("background-color", "#26a69a");
            $(".b7").css("background-color", "#26a69a");
            $(".b8").css("background-color", "#26a69a");
        }
    });


</script>
<script language="JavaScript">

    $(".b6").click(function () {
        $("#name-and-description-panel").hide();
        $("#contact-details-panel").hide();
        $("#amenities-panel").hide();
        $("#location-panel").hide();
        $("#offices-panel").hide();
        $("#opening-hours-panel").show();
        $("#photos-panel").hide();
        $("#payment-panel").hide();
        if ($(".b6").css("background-color").toString() === "rgb(38, 166, 154)" || $(".b6").css("background-color").toString() === "rgb(43, 187, 173)") {
            $(".b6").css("background-color", "#e0f2f1");
            $(".b1").css("background-color", "#26a69a");
            $(".b2").css("background-color", "#26a69a");
            $(".b3").css("background-color", "#26a69a");
            $(".b4").css("background-color", "#26a69a");
            $(".b5").css("background-color", "#26a69a");
            $(".b7").css("background-color", "#26a69a");
            $(".b8").css("background-color", "#26a69a");
        }
    });


</script>
<script language="JavaScript">
    $(".b7").click(function () {
        $("#name-and-description-panel").hide();
        $("#contact-details-panel").hide();
        $("#amenities-panel").hide();
        $("#location-panel").hide();
        $("#offices-panel").hide();
        $("#opening-hours-panel").hide();
        $("#photos-panel").show();
        $("#payment-panel").hide();
        if ($(".b7").css("background-color").toString() === "rgb(38, 166, 154)" || $(".b7").css("background-color").toString() === "rgb(43, 187, 173)") {
            $(".b7").css("background-color", "#e0f2f1");
            $(".b1").css("background-color", "#26a69a");
            $(".b2").css("background-color", "#26a69a");
            $(".b3").css("background-color", "#26a69a");
            $(".b4").css("background-color", "#26a69a");
            $(".b5").css("background-color", "#26a69a");
            $(".b6").css("background-color", "#26a69a");
            $(".b8").css("background-color", "#26a69a");
        }
    });


</script>
<script language="JavaScript">
    $(".b8").click(function () {
        $("#name-and-description-panel").hide();
        $("#contact-details-panel").hide();
        $("#amenities-panel").hide();
        $("#location-panel").hide();
        $("#offices-panel").hide();
        $("#opening-hours-panel").hide();
        $("#photos-panel").hide();
        $("#payment-panel").show();
        if ($(".b8").css("background-color").toString() === "rgb(38, 166, 154)" || $(".b8").css("background-color").toString() === "rgb(43, 187, 173)") {
            $(".b8").css("background-color", "#e0f2f1");
            $(".b1").css("background-color", "#26a69a");
            $(".b2").css("background-color", "#26a69a");
            $(".b3").css("background-color", "#26a69a");
            $(".b4").css("background-color", "#26a69a");
            $(".b5").css("background-color", "#26a69a");
            $(".b6").css("background-color", "#26a69a");
            $(".b7").css("background-color", "#26a69a");
        }
    });

</script>

<script language="JavaScript">
    $('.timepicker').pickatime({
        default: 'now', // Set default time: 'now', '1:30AM', '16:30'
        fromnow: 0, // set default time to * milliseconds from now (using with default = 'now')
        twelvehour: false, // Use AM/PM or 24-hour format
        donetext: 'OK', // text for done-button
        cleartext: 'Clear', // text for clear-button
        canceltext: 'Cancel', // Text for cancel-button
        autoclose: false, // automatic close timepicker
        ampmclickable: true, // make AM PM clickable
        aftershow: function () {
        } //Function for after opening timepicker
    });
</script>

<script language="JavaScript">
    $(document).ready(function () {
        $('select').material_select();
    });
</script>

<script language="JavaScript">
    $(document).ready(function () {
        $('.tooltipped').tooltip({delay: 50});
    });
</script>

</body>
</html>
