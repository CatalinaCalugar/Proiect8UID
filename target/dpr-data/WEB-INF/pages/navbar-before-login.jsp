<div class="navbar-fixed">
    <nav>
        <div class="nav-wrapper">
            <ul class="hide-on-med-and-down">
                <div class="left">
                    <li></li>
                    <li><a href="${pageContext.request.contextPath}/index.html"> <img
                            src="/resources/images/coworkingLogo4.png" height="70" alt=""></a>
                    </li>
                    <li></li>
                    <li>
                        <form>
                            <div class="input-field">
                                <input id="search" type="search" required>
                                <label class="label-icon" for="search" style="width: 60%"><i class="large material-icons">search</i></label>

                                <i class="large material-icons " style="background-color: inherit; border:none;" onclick="searchCoworkSpaces()">SEARCH
                                </i>

                                <script>
                                    function searchCoworkSpaces(){
                                        var searchString = document.getElementById("search").value;
                                        window.location = "${pageContext.request.contextPath}/allSpaces/" + searchString;
                                    }
                                </script>



                            </div>
                        </form>
                    </li>
                </div>
                <div class="right">
                    <li><a class="waves-effect waves-light"
                           href="${pageContext.request.contextPath}/index.html">Home</a></li>
                    <li><a class="waves-effect waves-light" href="${pageContext.request.contextPath}/contact.html">Contact
                        us</a></li>
                    <%--<li><a href="${pageContext.request.contextPath}/user/login.html">Login</a></li>--%>
                    <li><a class="waves-effect waves-light modal-trigger" href="#modal1">Login</a></li>
                    <li><a class="waves-effect waves-light modal-trigger" href="#modalRegister">Sign up</a></li>
                </div>
            </ul>
        </div>
    </nav>
</div>

<!-- Modal Login Structure -->
<div id="modal1" class="modal" style="height: auto">
    <div class="modal-content">
        <h1>Login</h1>
        <div class="row">
            <form class="col s12" method="POST" commandName="user"
                  action="${pageContext.request.contextPath}/user/login.html">
                <div class="row">
                    <div class="input-field col s12">
                        <input id="username" name="username" type="text" class="validate" required=""
                               aria-required="true">
                        <label for="username">Username</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <input id="password" name="password" type="password" class="validate" required=""
                               aria-required="true">
                        <label for="password">Password</label>
                    </div>
                </div>
                <div class="center">
                    <a href="${pageContext.request.contextPath}/user/register.html" style="color: #00acc1">Forgot
                        password?</a>
                </div>
                <br>

                <button class="btn waves-effect waves-light waves-ripple" type="submit" name="action">Login
                    <i class="material-icons right"></i>
                </button>

            </form>
        </div>
    </div>

    <div class="center">
        <h3 class="black-text">Don't have an account?</h3><a
            class="waves-effect waves-light modal-trigger modal-action modal-close "
            href="#modalRegister" style="color: #00acc1; font-size:30px"> Sign up</a>
    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Close</a>
    </div>
</div>


<!-- Modal Register Structure -->
<div id="modalRegister" class="modal" style="height: auto">
    <div class="modal-content">
        <h2>Sign up!</h2>
        <div class="center-align">
            <form class="col s6" method="POST" commandName="user"
                  action="${pageContext.request.contextPath}/user/register.html">

                <div class="row">
                    <div class="input-field col s6">
                        <input id="name" name="name" type="text" class="validate" required="" aria-required="true">
                        <label for="name">Name</label>
                    </div>

                    <div class="input-field col s6">
                        <input id="email" name="email" type="email" class="validate" required="" aria-required="true">
                        <label for="email" data-error="Email is not in the required format!" data-success="right">Email</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <input id="usernameR" name="username" type="text" class="validate" required=""
                               aria-required="true">
                        <label for="usernameR">Username</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s6">
                        <input id="passwordR" name="password" type="password" class="validate" required=""
                               aria-required="true">
                        <label for="passwordR">Password</label>
                        <span id="messageFirst" class="col s6"></span>
                    </div>

                    <div class="input-field col s6">
                        <input id="confirmPassword" type="password" class="validate" required="" aria-required="true">
                        <label for="confirmPassword">Confirm password</label>
                        <span id="message" class="col s6"></span>
                    </div>
                </div>


                <button class="btn waves-effect waves-light waves-ripple" type="submit" name="action">Register
                    <i class="material-icons right"></i>
                </button>

            </form>
        </div>
    </div>

    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Close</a>
    </div>
</div>

<script language="JavaScript">
    $('#passwordR').on('keyup', function () {
        if($('#passwordR').val().length < 8) {
            // checks the password value length
            $('#messageFirst').html('You have entered less than 8 characters for password!').css('color', 'red');
        }
        else
            $('#messageFirst').html('You are good to go!').css('color', 'green');
    });
    $('#confirmPassword').on('keyup', function () {
        if ($('#passwordR').val() == $('#confirmPassword').val()) {
            $('#message').html('Matching passwords!').css('color', 'green');
        } else
            $('#message').html('Password do not match!').css('color', 'red');
    });
    $('.modal').modal();
</script>