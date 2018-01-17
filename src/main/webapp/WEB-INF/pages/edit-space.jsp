<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<div class="w3-content w3-display-container">
    <div class="row">
        <h1> Edit space </h1>
        <div class="col s12">
            <img class="materialboxed" width="100%" src="/resources/images/genSp${space.id}.jpg" alt="Space IMG">
        </div>

        <div class="row center">
            <form class="col s12" method="POST" commandName="space"
                  action="${pageContext.request.contextPath}/space/edit/${space.id}.html">

                <ul class="collapsible" data-collapsible="accordion">
                    <li>
                        <div class="collapsible-header">
                            <h4>Edit name and description</h4>
                        </div>
                        <div class="collapsible-body">
                            <div class="row">

                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="name" name="name" type="text" class="validate"
                                               value="${space.name}">
                                        <label for="name">Space name</label>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="input-field col s12">
                                <textarea id="description" rows="3" name="description"
                                          class="materialize-textarea">${space.description}</textarea>
                                        <label for="description">Description</label></div>
                                </div>
                                <br>
                            </div>
                        </div>
                    </li>

                    <li>
                        <div class="collapsible-header">
                            <h4>Edit contact details</h4>
                        </div>
                        <div class="collapsible-body">
                            <div class="row">
                                <div class="input-field col s12">
                                    <input id="ownerEmail" name="ownerEmail" type="email" class="validate"
                                           value="${space.ownerEmail}">
                                    <label for="ownerEmail">Owner's email</label>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="input-field col s12">
                                    <input id="ownerPhone" name="ownerPhone" type="number" class="validate"
                                           value="${space.ownerPhone}">
                                    <label for="ownerPhone">Owner's phone</label>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="input-field col s12">
                                    <input id="webURL" name="webURL" type="url" class="validate"
                                           value="http://${space.webURL}">
                                    <label for="webURL">Website</label>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="input-field col s12">
                                    <input id="facebookUrl" name="facebookUrl" type="url" class="validate"
                                           value="http://${space.facebookUrl}">
                                    <label for="facebookUrl">Facebook URL</label>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="input-field col s12">
                                    <input id="twitterUrl" name="twitterUrl" type="url" class="validate"
                                           value="http://${space.twitterUrl}">
                                    <label for="twitterUrl">Twitter URL</label>
                                </div>
                            </div>
                        </div>
                    </li>


                    <li>
                        <div class="collapsible-header">
                            <h4>Edit amenities for your space</h4>
                        </div>
                        <div class="collapsible-body">
                            <c:forEach items="${space.generalAmenities}" var="amenity">
                                <p>
                                    <input type="checkbox" id="${amenity}" name=""/>
                                    <label for="${amenity}">${amenity}</label>
                                </p>
                            </c:forEach>
                        </div>
                    </li>

                    <li>
                        <div class="collapsible-header">
                            <h4>Edit your coworking space's location</h4>
                        </div>
                        <div class="collapsible-body">
                            <div>
                                <h3>My Google Map</h3>
                                <div id="map" style="width:740px; height:400px;">
                                    <script>
                                        function myMap() {
                                            var myLatLng = {lat: ${space.latitude}, lng: ${space.longitude}};

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

                                            <%--google.maps.event.addListener(map, 'click', function (event) {--%>
                                            <%--alert(${space.latitude} + ", " + ${space.longitude});--%>
                                            <%--});--%>
                                        }
                                    </script>
                                    <script async defer
                                            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCt-g3ZM2QSUL_ABCvv1msN6LKfcMyx2Q0&callback=myMap">
                                    </script>
                                </div>
                            </div>
                        </div>
                    </li>

                    <li>
                        <div class="collapsible-header">
                            <h4>Edit offices</h4>
                        </div>
                        <div class="collapsible-body">
                            <ul class="collapsible" data-collapsible="accordion">
                                <c:forEach var="office" items="${space.officeList}">
                                    <li>
                                        <div class="collapsible-header">
                                            <h5>Edit office ${office.id}</h5>
                                        </div>
                                        <div class="collapsible-body">
                                            <select id="selector${office.id}">
                                                <option value="" disabled selected>${office.type}</option>
                                                <c:forEach items="${type}" var="number">
                                                    <option value="${number}" name="type">${number}</option>
                                                </c:forEach>
                                            </select>
                                            <label for="selector${office.id}">Office type</label>

                                            <div class="row">
                                                <div class="input-field col s12">
                                                    <input id="officeName${office.id}" name="name" type="text"
                                                           class="validate"
                                                           value="${office.name}">
                                                    <label for="officeName${office.id}">Office name</label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="input-field col s12">
                                                    <input id="capacity" name="capacity" type="number" class="validate"
                                                           value="${office.capacity}">
                                                    <label for="capacity">Capacity</label>
                                                </div>
                                            </div>

                                            <c:forEach items="${generalAmenities}" var="amenity">
                                                <p>
                                                    <input type="checkbox" name="amenities" id=${office.id}${amenity}/>
                                                    <label for=${office.id}${amenity}>${amenity}</label>
                                                </p>
                                            </c:forEach>

                                            <div class="row">
                                                <div class="file-field input-field col s12">
                                                    <div class="btn">
                                                        <span>Photo for office ${office.id}</span>
                                                        <input type="file" name="photo" multiple style="width: 300px"
                                                               value="${office.photo}">
                                                    </div>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="row">
                                                <div class="input-field col s12">
                                                    <input id="price" name="price" type="number" class="validate"
                                                           value="${office.price}">
                                                    <label for="price">Price</label>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </li>

                    <li>
                        <div class="collapsible-header">
                            <h4>Edit schedule</h4>
                        </div>
                        <div class="collapsible-body">
                            <div class="row">
                                <div class="input-field col s12">
                                    <input id="tp1" type="text" class="timepicker" value="${space.openingHour}">
                                    <label for="tp1">Start hour</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s12">
                                    <br>
                                    <input id="tp2" type="text" class="timepicker" value="${space.closingHour}">
                                    <label for="tp2">End hour</label>
                                </div>
                            </div>
                        </div>
                    </li>

                    <li>
                        <div class="collapsible-header">
                            <h4>Edit general photos of the space</h4>
                        </div>
                        <div class="collapsible-body">

                            <div class="file-field input-field">
                                <div class="btn">
                                    <span>Upload photos</span>
                                    <input type="file" name="generalPhotos" multiple>
                                </div>
                                <br>
                                <div class="file-path-wrapper">
                                    <input class="file-path validate" type="text"
                                           placeholder="${space.generalPhotos[0]}">
                                </div>
                            </div>
                        </div>
                    </li>

                    <li>
                        <div class="collapsible-header">

                            <h4>Edit payment details</h4>
                        </div>
                        <div class="collapsible-body">
                            <div class="row">
                                <div class="input-field col s12">
                                    <input id="ISBN" name="ISBN" type="text" class="validate" value="${space.ISBN}">
                                    <label for="ISBN">IBAN</label>
                                </div>
                                <br>
                                <br>
                            </div>
                        </div>
                    </li>

                    <li>
                        <button class="waves-effect waves-light btn-large" style="width: 800px"
                                type="submit" name="action">Edit space
                        </button>
                    </li>
                </ul>
            </form>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<script language="JavaScript">
    $(document).ready(function () {
        $('.materialboxed').materialbox();
    });
</script>
<script language="JavaScript">
    $('.timepicker').pickatime({
        default: 'now', // Set default time: 'now', '1:30AM', '16:30'
        fromnow: 0,       // set default time to * milliseconds from now (using with default = 'now')
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