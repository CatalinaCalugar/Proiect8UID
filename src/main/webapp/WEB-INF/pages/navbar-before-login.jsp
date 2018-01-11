<div class="navbar-fixed">
    <nav>
        <div class="nav-wrapper">
            <ul class="hide-on-med-and-down">
                <div class="left">
                    <li></li>
                    <li><a href="${pageContext.request.contextPath}/index.html"> <img src="/resources/images/coworkingLogo4.png" height="70" alt="" style="margin-left: 20%"></a>
                    </li>
                    <li></li>
                    <li>
                        <form>
                            <div class="input-field">
                                <input id="search" type="search" required>
                                <label class="label-icon" for="search" style="width: 60%"><i class="material-icons">search</i></label>
                                <i class="material-icons">X</i>
                            </div>
                        </form>
                    </li>
                </div>
                <div class="right">
                    <li><a href="${pageContext.request.contextPath}/index.html">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact.html">Contact us</a></li>
                    <%--<li><a href="${pageContext.request.contextPath}/user/login.html">Login</a></li>--%>
                    <li><a class="waves-effect waves-light modal-trigger" href="#modal1">Login</a></li>
                </div>
            </ul>
        </div>
    </nav>
</div>

<!-- Modal Structure -->
<div id="modal1" class="modal">
    <div class="modal-content">
        <h1>Login</h1>
        <div class="row">
            <form class="col s12" method="POST" commandName="user"
                  action="${pageContext.request.contextPath}/user/login.html">
                <div class="row">
                    <div class="input-field col s12">
                        <input id="username" name="username" type="text" class="validate">
                        <label for="username">Username</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <input id="password" name="password" type="password" class="validate">
                        <label for="password">Password</label>
                    </div>
                </div>
                <div class="center">
                    <a href="${pageContext.request.contextPath}/user/register.html" style="color: #00acc1">Forgot password?</a>
                </div>
                <br>

                <button class="btn waves-effect waves-light waves-ripple" type="submit" name="action">Login
                    <i class="material-icons right"></i>
                </button>

            </form>
        </div>
    </div>

    <div class="center">
        <h3>Don't have an account?<a href="${pageContext.request.contextPath}/user/register.html" style="color: #00acc1"> Sign up</a></h3>
    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Close</a>
    </div>
</div>

<script language="JavaScript">
    $('.modal').modal();
</script>