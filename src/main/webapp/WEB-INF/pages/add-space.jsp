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

<%--<img class="background" src="/resources/images/office1.jpg">--%>

<div class="parallax-container">
    <div class="parallax"><img src="/resources/images/office2.jpg"></div>
</div>
<div class="section white">
    <div class="row container">

        <div class="col s3">
            <div class="truncate">
                <ul>
                    <li>
                        <button class="waves-effect waves-light btn-large" style="width: 250px">Name and description
                        </button>
                    </li>
                    <li>
                        <button class="waves-effect waves-light btn-large" style="width: 250px">Contact details</button>
                    </li>
                    <li>
                        <button class="waves-effect waves-light btn-large" style="width: 250px">Amenities</button>
                    </li>
                    <li>
                        <button class="waves-effect waves-light btn-large" style="width: 250px">Location</button>
                    </li>
                    <li>
                        <button class="waves-effect waves-light btn-large" style="width: 250px">Meeting rooms</button>
                    </li>
                    <li>
                        <button class="waves-effect waves-light btn-large" style="width: 250px">Opening hours</button>
                    </li>
                    <li>
                        <button class="waves-effect waves-light btn-large" style="width: 250px">General photos</button>
                    </li>
                    <li>
                        <button class="waves-effect waves-light btn-large" style="width: 250px">Payment details</button>
                    </li>
                </ul>
            </div>
        </div>

        <div class="col s9">
            <!-- Teal page content  -->

        </div>

    </div>
</div>


<jsp:include page="footer.jsp"></jsp:include>

<script language="JavaScript">
    $(document).ready(function(){
        $('.parallax').parallax();
    });
</script>

</body>
</html>
