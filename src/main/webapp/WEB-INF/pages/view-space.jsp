<%--
  Created by IntelliJ IDEA.
  User: cata_
  Date: 1/5/2018
  Time: 3:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <%@ page isELIgnored="false" %>
    <title>View space</title>

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

<div class="messages center-align">
    <i class="teal-text" style="font-size: 30px;">${message}</i>
    <br>
</div>
<h1 style="width: 100%; text-align: center;" class="header">${cs.name}</h1>
<div class="row">
    <h1 class="text-darken-4">${message}</h1>
    <iv class="w3-content w3-display-container">
        <div class="carousel carousel-slider center-align customCarusel" data-indicators="true">
            <a class="carousel-item center-align"><img class="customCarImg"
                                                       src="/resources/images/spaceDetails1.jpg"></a>
            <a class="carousel-item center-align"><img class="customCarImg"
                                                       src="/resources/images/spaceDetails2.jpg"></a>
            <a class="carousel-item center-align"><img class="customCarImg"
                                                       src="/resources/images/spaceDetails3.jpg"></a>
        </div>


        <div style="width:100%;overflow: hidden;clear:both;padding-left: 100px;">
            <div style="width:60%;float:left;">


                <div class="row">
                <span class="col s12">
                    <ul class="tabs" style="display: flex;">
                        <li class="tab col s3"><a class="active" href="#Overview">Overview</a></li>
                        <li class="tab col s3"><a href="#Amenities">Amenities</a></li>
                        <li class="tab col s3"><a href="#Prices">Prices</a></li>
                        <li class="tab col s3"><a href="#Map">Map</a></li>
                        <li class="tab col s3"><a href="#Reviews">Reviews</a></li>
                    </ul>
                </span>
                    <div id="Overview" class="col s12" style="margin-top: 20px;">
                        ${cs.description}
                    </div>
                    <div id="Amenities" class="col s12" style="margin-top: 20px;">
                        Amenities list
                        <ul class="collection">
                            <c:forEach items="${cs.generalAmenities}" var="cc">
                                <li class="collection-item">${cc}</li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div id="Prices" class="col s12" style="margin-top: 20px;">
                        <p>Prices section</p>
                        <c:forEach items="${cs.officeList}" var="off">
                            <div class="col s12 m7">
                                <div class="card horizontal">
                                    <div class="card-stacked">
                                        <div class="card-content">
                                            <p>${off.name}</p>
                                            <p>Price: ${off.price}</p>
                                            <p>Maximum Capacity: ${off.capacity} </p>
                                        </div>
                                        <div class="card-action">
                                            <a class="waves-effect waves-light btn-large modal-trigger"
                                               href="#modalReservationOffice">Reserve</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>


                    <div id="Map" class="col s12">

                        <div>
                            <div id="map" class="center" style="width:100%; height:400px; padding-left:100px">
                                <script>
                                    function myMap() {
                                        var mapOptions = {
                                            center: new google.maps.LatLng(46.770439, 23.591423),
                                            zoom: 16,
                                        }
                                        var map = new google.maps.Map(document.getElementById("map"), mapOptions);
                                    }
                                </script>
                                <script async defer
                                        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCt-g3ZM2QSUL_ABCvv1msN6LKfcMyx2Q0&callback=myMap">
                                </script>
                            </div>
                        </div>

                    </div>


                    <div id="Reviews" class="col s12">
                        Reviews section
                        <div class="row">
                            <div class="col s12">
                                <ul class="tabs">
                                    <li class="tab col s3"><a class="active" href="#test1">Reviews</a></li>
                                    <li class="tab col s3"><a href="#test2">Tips</a></li>
                                    <li class="tab col s3"><a href="#test3">Q&A</a></li>
                                </ul>
                            </div>
                            <div id="test1" class="col s12">
                                <p>Post a review</p>
                                <ul class="collapsible" data-collapsible="accordion">
                                    <li>
                                        <div class="collapsible-header">
                                            <i class="material-icons">star</i>
                                            First review
                                            <span class="badge">User 1</span></div>
                                        <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
                                    </li>
                                    <li>
                                        <div class="collapsible-header">
                                            <i class="material-icons">star</i>
                                            Second review
                                            <span class="badge">User 2</span></div>
                                        <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
                                    </li>
                                </ul>
                                <div class="right-align">
                                    <a class="waves-effect waves-light btn-large modal-trigger" href="#modalReview"><i
                                            class="material-icons">edit</i></a>
                                </div>
                            </div>

                            <div id="test2" class="col s12">
                                <p>Post a tip</p>

                                <ul class="collapsible" data-collapsible="accordion">
                                    <li>
                                        <div class="collapsible-header">
                                            <i class="material-icons">lightbulb_outline</i>
                                            First tip
                                            <span class="badge">User 1</span></div>
                                        <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
                                    </li>
                                    <li>
                                        <div class="collapsible-header">
                                            <i class="material-icons">lightbulb_outline</i>
                                            Second tip
                                            <span class="badge">User 2</span></div>
                                        <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
                                    </li>
                                </ul>
                                <div class="right-align">
                                    <a class="waves-effect waves-light btn-large modal-trigger" href="#modalTip"><i
                                            class="material-icons">edit</i></a>
                                </div>

                            </div>

                            <div id="test3" class="col s12">
                                <p>Post a question or help someone with an answer</p>

                                <ul class="collapsible" data-collapsible="accordion">
                                    <li>
                                        <div class="collapsible-header">
                                            <i class="material-icons">question_answer</i>
                                            First question
                                            <span class="badge">User 1</span></div>
                                        <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
                                    </li>
                                    <li>
                                        <div class="collapsible-header">
                                            <i class="material-icons">question_answer</i>
                                            Second question
                                            <span class="badge">User 2</span></div>
                                        <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
                                    </li>
                                </ul>
                                <div class="right-align">
                                    <a class="waves-effect waves-light btn-large modal-trigger" href="#modalQA"><i
                                            class="material-icons">edit</i></a>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>


            </div>

            <div style="width:30%;float:left; border: 2px ridge green; border-radius: 50px; margin-top: 60px;">
                <div style="align:center;">
                    <a style="margin-top: 30px; margin-left: 20px; margin-right: 20px; width: 90%;"
                       class="waves-effect waves-light btn-large modal-trigger" href="#modalReservation"
                       id="makeAReservation"><i class="material-icons left">payment</i>Make a reservation</a>

                    <a style="margin-top: 30px; margin-left: 20px; margin-right: 20px; width: 90%;"
                       class="waves-effect waves-light btn-large modal-trigger" href="#modalInvitation"
                       id="makeInvitation"><i class="material-icons left">group_add</i>Make an invitation</a>

                    <a style="margin-top: 30px; margin-left: 20px; margin-right: 20px; width: 90%;"
                       class="waves-effect waves-light btn-large modal-trigger" href="#modalSchedule"
                       id="scheduleTour"><i class="material-icons left">assignment</i>Schedule Tour</a>

                    <a style="margin-top: 30px; margin-left: 20px; margin-right: 20px; width: 90%;"
                       class="waves-effect waves-light btn-large modal-trigger" href="#modalTest"
                       id="messageSpace"><i class="material-icons left">message</i>Message space</a>

                    <a style="margin-top: 100px; margin-left: 20px; margin-right: 20px; margin-bottom:30px;
                    width: 90%;" class="waves-effect waves-light btn-large disabled "
                       id="shareSpace">Share space</a>


                    <div style=" margin-bottom: 20px;">
                        <button id="fb" style="background-color: transparent; border: none;">
                            <img style="width: 70px; height:70px; margin-left: 30px; margin-right: 20px;
                            border: 2px solid green; border-radius: 20px;" src="/resources/images/fb-art.png"
                                 alt="Facebook">
                        </button>

                        <button id="insta" style="background-color: transparent; border: none;">
                            <img style="width: 70px; height:70px; margin-left: 10px; margin-right: 10px;
                            border: 2px solid green; border-radius: 20px;" src="/resources/images/instagram-logo.jpg"
                                 alt="insta">
                        </button>

                        <button id="gmail" style="background-color: transparent; border: none;">
                            <img style="width: 70px; height:70px; margin-left: 10px; margin-right: 10px;
                            border: 2px solid green; border-radius: 20px;" src="/resources/images/gmail.png"
                                 alt="gmail">
                        </button>
                    </div>

                </div>

            </div>
        </div>
    </iv>
</div>

<div id="modalTest" class="modal" style="z-index: 1003; display: none; opacity: 0; transform: scaleX(0.7); top: 4%;">
    <div class="modal-content">
        <h2>Message us</h2>
        <div class="center-align">
            <form id="formMessage" class="col s4" method="GET" commandName="user"
                  action="${pageContext.request.contextPath}/space/messageUs/${currentSpID}.html">

                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">person</i>
                        <input id="name" type="text" class="validate" name="name" required=""
                               aria-required="true">
                        <label for="name" data-error="We would like to know with who we are talking to"
                               data-success="Nice to meet you">Name</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">email</i>
                        <input id="emailM" name="emailM" type="email" class="validate" required="" aria-required="true">
                        <label for="emailM" data-error="Email is not in the required format!"
                               data-success="Good to go">Email</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <i class="material-icons prefix">message</i>
                        <textarea id="messageS" class="materialize-textarea" name="messageS" required=""
                                  aria-required="true"></textarea>
                        <label for="messageS">Message</label>
                    </div>
                </div>

                <div class="row">
                    <button id="forMessageInside"
                            class="modal-action modal-open waves-effect waves-light btn modal-trigger"
                            data-target="#modalMessageSuccessH">Message us
                    </button>
                    <i class="material-icons right"></i>

                </div>

            </form>
        </div>
    </div>

    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Close</a>
    </div>
</div>

<!-- Modal Schedule Structure -->
<div id="modalSchedule" class="modal" style="height: auto">
    <div class="modal-content">
        <h2>Schedule tour</h2>
        <div class="center-align">
            <form class="col s12" method="GET" commandName="user"
                  action="${pageContext.request.contextPath}/space/scheduleTour/${currentSpID}.html">
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">account_circle</i>
                        <input id="username" name="username" type="text" class="validate" required=""
                               aria-required="true">
                        <label for="username">Username</label>
                    </div>

                    <div class="input-field col s6">
                        <i class="material-icons prefix">email</i>
                        <input id="email" name="email" type="email" class="validate" required="" aria-required="true">
                        <label for="email" data-error="Email is not in the required format!"
                               data-success="Good to go">Email</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <i class="material-icons prefix">date_range</i>
                        <input id="tp1" type="text" class="datepicker">
                        <label for="tp1">Select date</label>
                    </div>
                    <div class="input-field col s12">
                        <br>
                        <i class="material-icons prefix">access_time</i>
                        <input id="tp2" type="text" class="timepicker">
                        <label for="tp2">Select hour</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <i class="material-icons prefix">message</i>
                        <textarea id="contact_message" class="materialize-textarea" name="message"></textarea>
                        <label for="contact_message">Optional message for us</label>
                    </div>
                </div>

                <button class="btn waves-effect waves-light waves-ripple" type="submit" name="action">Book me in!
                    <i class="material-icons right"></i>
                </button>

            </form>
        </div>
    </div>

    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Close</a>
    </div>
</div>

<!-- Modal Reservation Structure -->
<div id="modalReservationOffice" class="modal" style="height: auto">
    <div class="modal-content">
        <h2>Reserve an office</h2>
        <div class="center-align">
            <form class="col s12" method="GET" commandName="user"
                  action="${pageContext.request.contextPath}/space/pay/${currentSpID}.html">
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">account_circle</i>
                        <input id="usernameR" name="usernameR" type="text" class="validate" required=""
                               aria-required="true">
                        <label for="usernameR">Username</label>
                    </div>

                    <div class="input-field col s6">
                        <i class="material-icons prefix">email</i>
                        <input id="emailR" name="emailR" type="email" class="validate" required="" aria-required="true">
                        <label for="emailR" data-error="Email is not in the required format!"
                               data-success="Good to go">Email</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">people</i>
                        <input id="nrPeople" name="nrPeople" type="text" class="validate" required="" max="6"
                               aria-required="true">
                        <label for="nrPeople">Number of people</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <br>
                        <i class="material-icons prefix">date_range</i>
                        <input id="tp2" type="text" class="datepicker">
                        <label for="tp2">Select date</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">schedule</i>
                        <input id="days" name="days" type="text" class="validate" required=""
                               aria-required="true">
                        <label for="days">Duration</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <i class="material-icons prefix">message</i>
                        <textarea id="optMessage" class="materialize-textarea" name="optMessage"></textarea>
                        <label for="optMessage">Optional message for us</label>
                    </div>
                </div>

                <button class="btn waves-effect waves-light waves-ripple" type="submit" name="action">Pay
                    <i class="material-icons right"></i>
                </button>

            </form>
        </div>
    </div>

    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat bclose">Close</a>
    </div>
</div>

<!-- Modal Reservation Structure -->
<div id="modalReservation" class="modal" style="height: auto">
    <div class="modal-content">
        <h2>Make a reservation</h2>
        <div class="center-align">
            <form class="col s4">
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">account_circle</i>
                        <input id="usernameR1" name="usernameR" type="text" class="validate" required=""
                               aria-required="true">
                        <label for="usernameR1">Username</label>
                    </div>

                    <div class="input-field col s6">
                        <i class="material-icons prefix">email</i>
                        <input id="emailR1" name="emailR" type="email" class="validate" required=""
                               aria-required="true">
                        <label for="emailR1" data-error="Email is not in the required format!"
                               data-success="right">Email</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <br>
                        <i class="material-icons prefix">date_range</i>
                        <input id="tp21" type="text" class="datepicker">
                        <label for="tp21">Select date</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">schedule</i>
                        <input id="days1" name="days" type="text" class="validate" required=""
                               aria-required="true">
                        <label for="days1">Duration</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <i class="material-icons prefix">message</i>
                        <textarea id="optMessage1" class="materialize-textarea" name="optMessage"></textarea>
                        <label for="optMessage1">Optional message for us</label>
                    </div>
                </div>

                <button class="btn waves-effect waves-light waves-ripple" type="submit" name="action">Pay
                    <i class="material-icons right"></i>
                </button>

            </form>
        </div>
    </div>

    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat bclose">Close</a>
    </div>
</div>

<!-- Modal Structure -->
<div id="modalInvitation" class="modal">
    <div class="modal-content">
        <h4>Invite users</h4>
        <form class="col s12" method="GET" commandName="user"
              action="${pageContext.request.contextPath}/space/invite/${currentSpID}.html">
            <h5>Insert the users you want to invite </h5>

            <div class="row">
                <div class="input-field col s12">
                    <i class="material-icons prefix">contact_mail</i>
                    <input type="email" multiple="multiple" autofocus="" id="mails" name="email" class="validate"
                           required="" aria-required="true">
                    <label for="mails" data-error="Email is not in the required format!"
                           data-success="right">Email</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <i class="material-icons prefix">message</i>
                    <textarea id="inviteMessage" rows="3" name="inviteMessage"
                              class="materialize-textarea"></textarea>
                    <label for="inviteMessage">Send them an optional message</label></div>
            </div>
            <button class="btn waves-effect waves-light waves-ripple" type="submit" name="action">Invite
                <i class="material-icons right"></i>
            </button>
        </form>
    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Close</a>
    </div>
</div>

<div id="modalReview" class="modal" style="z-index: 1003; display: none; opacity: 0; transform: scaleX(0.7); top: 4%;">
    <div class="modal-content">
        <h2>Review us</h2>
        <div class="center-align">
            <form id="formReview" class="col s4">

                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">person</i>
                        <input id="nameR" type="text" class="validate" name="nameR" required=""
                               aria-required="true">
                        <label for="nameR" data-error="We would like to know with who we are talking to"
                               data-success="Nice to meet you">Name</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">email</i>
                        <input id="emailReview" name="emailReview" type="email" class="validate" required=""
                               aria-required="true">
                        <label for="emailReview" data-error="Email is not in the required format!"
                               data-success="Good to go">Email</label>
                    </div>
                </div>

                <div class="row">
                    <p>How many stars would you give us:</p>
                    <i class="material-icons prefix">stars</i>
                    <div class="input-field col s6">
                        <p class="range-field">
                            <input type="range" id="test5" min="0" max="5"/>
                        </p>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <i class="material-icons prefix">message</i>
                        <textarea id="messageReview" class="materialize-textarea" name="messageReview" required=""
                                  aria-required="true"></textarea>
                        <label for="messageReview">Message</label>
                    </div>
                </div>

                <div class="row">
                    <button id="forReview"
                            class="modal-action modal-open waves-effect waves-light btn modal-trigger"
                            data-target="#modalMessageSuccessH">Send review
                    </button>
                    <i class="material-icons right"></i>

                </div>

            </form>
        </div>
    </div>

    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Close</a>
    </div>
</div>


<div id="modalTip" class="modal" style="z-index: 1003; display: none; opacity: 0; transform: scaleX(0.7); top: 4%;">
    <div class="modal-content">
        <h2>Leave a tip or trick</h2>
        <div class="center-align">
            <form id="formTip" class="col s4">

                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">person</i>
                        <input id="nameT" type="text" class="validate" name="nameT" required=""
                               aria-required="true">
                        <label for="nameT" data-error="We would like to know with who we are talking to"
                               data-success="Nice to meet you">Name</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">email</i>
                        <input id="emailTip" name="emailTip" type="email" class="validate" required=""
                               aria-required="true">
                        <label for="emailTip" data-error="Email is not in the required format!"
                               data-success="Good to go">Email</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <i class="material-icons prefix">message</i>
                        <textarea id="messageTip" class="materialize-textarea" name="messageTip" required=""
                                  aria-required="true"></textarea>
                        <label for="messageTip">Tip</label>
                    </div>
                </div>

                <div class="row">
                    <button id="forTip"
                            class="modal-action modal-open waves-effect waves-light btn modal-trigger"
                            data-target="#modalMessageSuccessH">Leave tip
                    </button>
                    <i class="material-icons right"></i>

                </div>

            </form>
        </div>
    </div>

    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Close</a>
    </div>
</div>

<div id="modalQA" class="modal" style="z-index: 1003; display: none; opacity: 0; transform: scaleX(0.7); top: 4%;">
    <div class="modal-content">
        <h2>Leave a question</h2>
        <div class="center-align">
            <form id="formQA" class="col s4">

                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">person</i>
                        <input id="nameQ" type="text" class="validate" name="nameQ" required=""
                               aria-required="true">
                        <label for="nameQ" data-error="We would like to know with who we are talking to"
                               data-success="Nice to meet you">Name</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">email</i>
                        <input id="emailQ" name="emailQ" type="email" class="validate" required=""
                               aria-required="true">
                        <label for="emailQ" data-error="Email is not in the required format!"
                               data-success="Good to go">Email</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <i class="material-icons prefix">message</i>
                        <textarea id="messageQ" class="materialize-textarea" name="messageQ" required=""
                                  aria-required="true"></textarea>
                        <label for="messageQ">Question</label>
                    </div>
                </div>

                <div class="row">
                    <button id="forQ"
                            class="modal-action modal-open waves-effect waves-light btn modal-trigger"
                            data-target="#modalMessageSuccessH">Leave a question
                    </button>
                    <i class="material-icons right"></i>

                </div>

            </form>
        </div>
    </div>

    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Close</a>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

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
    $('.datepicker').pickadate({
        selectMonths: true, // Creates a dropdown to control month
        selectYears: 15, // Creates a dropdown of 15 years to control year,
        today: 'Today',
        clear: 'Clear',
        close: 'Ok',
        closeOnSelect: false // Close upon selecting a date,
    });

</script>

<script language="JavaScript">
    $(document).ready(function () {
        $('.carousel.carousel-slider').carousel({fullWidth: true});
        $('ul.tabs').tabs();
        $('.modal').modal();
    });
</script>
</body>


</html>