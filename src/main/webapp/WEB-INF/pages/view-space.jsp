<%--
  Created by IntelliJ IDEA.
  User: cata_
  Date: 1/5/2018
  Time: 3:05 PM
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
    <title>View space</title>

</head>
<body>
<jsp:include page="navbar-before-login.jsp"></jsp:include>

<div class="row">
    <iv class="w3-content w3-display-container">
        <div class="carousel carousel-slider center-align" data-indicators="true">
            <a class="carousel-item center-align"><img
                    src="/resources/images/genSp1.jpg"></a>
            <a class="carousel-item center-align"><img
                    src="/resources/images/genSp2.jpg"></a>
            <a class="carousel-item center-align"><img
                    src="/resources/images/genSp3.jpg"></a>
            <a class="carousel-item center-align"><img
                    src="/resources/images/genSp4.jpg"></a>
            <a class="carousel-item center-align"><img
                    src="/resources/images/genSp5.jpg"></a>
        </div>
        <div style="width:100%;overflow: hidden;clear:both;padding-left: 100px;">
            <div style="width:60%;float:left;">
                <label>Space title</label>


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
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                        the
                        industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of
                        type and
                        scrambled it to make a type specimen book. It has survived not only five centuries, but also the
                        leap
                        into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s
                        with the
                        release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop
                        publishing
                        software like Aldus PageMaker including versions of Lorem Ipsum.
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                        the
                        industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of
                        type and
                        scrambled it to make a type specimen book. It has survived not only five centuries, but also the
                        leap
                        into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s
                        with the
                        release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop
                        publishing
                        software like Aldus PageMaker including versions of Lorem Ipsum.
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                        the
                        industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of
                        type and
                        scrambled it to make a type specimen book. It has survived not only five centuries, but also the
                        leap
                        into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s
                        with the
                        release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop
                        publishing
                        software like Aldus PageMaker including versions of Lorem Ipsum.
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                        the
                        industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of
                        type and
                        scrambled it to make a type specimen book. It has survived not only five centuries, but also the
                        leap
                        into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s
                        with the
                        release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop
                        publishing
                        software like Aldus PageMaker including versions of Lorem Ipsum.
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                        the
                        industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of
                        type and
                        scrambled it to make a type specimen book. It has survived not only five centuries, but also the
                        leap
                        into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s
                        with the
                        release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop
                        publishing
                        software like Aldus PageMaker including versions of Lorem Ipsum.

                    </div>
                    <div id="Amenities" class="col s12" style="margin-top: 20px;">
                        Amenities list
                    </div>
                    <div id="Prices" class="col s12" style="margin-top: 20px;">
                        Prices section
                    </div>


                    <div id="Map" class="col s12">

                        <div>
                            <div id="map" class="center" style="width:100%; height:400px; padding-left:100px">
                                <script>
                                    function myMap() {
                                        var mapOptions = {
                                            center: new google.maps.LatLng(46.770439, 23.591423),
                                            center: new google.maps.LatLng(46.770439, 23.591423),
                                            zoom: 8,
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
                                    <li class="tab col s3"><a href="#test1">Reviews</a></li>
                                    <li class="tab col s3"><a class="active" href="#test2">Tips</a></li>
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
                                    <a class="btn btn-floating btn-large cyan pulse"><i class="material-icons">edit</i></a>
                                </div>
                            </div>

                            <div id="test2" class="col s12">
                                <p>Post a tip</p>

                                <ul class="collapsible" data-collapsible="accordion">
                                    <li>
                                        <div class="collapsible-header">
                                            <i class="material-icons">lightbulb_outline</i>
                                            First review
                                            <span class="badge">User 1</span></div>
                                        <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
                                    </li>
                                    <li>
                                        <div class="collapsible-header">
                                            <i class="material-icons">lightbulb_outline</i>
                                            Second review
                                            <span class="badge">User 2</span></div>
                                        <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
                                    </li>
                                </ul>
                                <div class="right-align">
                                    <a class="btn btn-floating btn-large cyan pulse"><i class="material-icons">edit</i></a>
                                </div>

                            </div>

                            <div id="test3" class="col s12">
                                <p>Post a question or help someone with an answer</p>

                                <ul class="collapsible" data-collapsible="accordion">
                                    <li>
                                        <div class="collapsible-header">
                                            <i class="material-icons">question_answer</i>
                                            First review
                                            <span class="badge">User 1</span></div>
                                        <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
                                    </li>
                                    <li>
                                        <div class="collapsible-header">
                                            <i class="material-icons">question_answer</i>
                                            Second review
                                            <span class="badge">User 2</span></div>
                                        <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
                                    </li>
                                </ul>
                                <div class="right-align">
                                    <a class="btn btn-floating btn-large cyan pulse"><i class="material-icons">edit</i></a>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>


            </div>

            <div style="width:30%;float:left; border: 2px ridge green; border-radius: 2px; margin-top: 60px;">
                <h1 style=" text-align: center;">Contact Us</h1>
                <p style=" text-align: center;"><a href="${pageContext.request.contextPath}/scheduleTour/1"
                                                   id="scheduleTour">Schedule
                    Tour</a></p>
                <p style="text-align: center;"><a href="${pageContext.request.contextPath}/messageSpace/1"
                                                  id="messageSpace">Message
                    Space</a></p>
                <h3 style=" margin-top: 40px;">Share</h3>

            </div>
        </div>
    </iv>
</div>

<jsp:include page="footer.jsp"></jsp:include>


<script language="JavaScript">
    $(document).ready(function () {
        $('.carousel.carousel-slider').carousel({fullWidth: true});
        $('ul.tabs').tabs();
    });
</script>
</body>
</html>