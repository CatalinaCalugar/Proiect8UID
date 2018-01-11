<!-- Dropdown Structure -->
<ul id='dropdown1' class='dropdown-content'>
    <li><a href="${pageContext.request.contextPath}/user/account.html">My account</a></li>
    <li class="divider"></li>
    <li><a href="${pageContext.request.contextPath}/space/create.html">Add coworking space</a></li>
    <li class="divider"></li>
    <li><a href="${pageContext.request.contextPath}/space/edit.html">Manage existing space</a></li>
    <li class="divider"></li>
    <li><a href="${pageContext.request.contextPath}/user/logout.html">Log out</a></li>
</ul>

<div class="navbar-fixed">
    <nav>
        <div class="nav-wrapper">
            <ul class="hide-on-med-and-down">
                <div class="left center">
                    <li><p></p></li>
                    <li><a href="${pageContext.request.contextPath}/home_page_after_login"><img
                            src="/resources/images/coworkingLogo4.png" height="70" alt="" style="margin-left: 20%"></a>
                    </li>
                    <li><p></p></li>
                    <li>
                        <form>
                            <div class="input-field">
                                <input id="search" type="search" required>
                                <label class="label-icon" for="search"><i class="material-icons">search</i></label>
                                <i class="material-icons">X</i>
                            </div>
                        </form>
                    </li>
                </div>
                <div class="right">
                    <li><a href="${pageContext.request.contextPath}/home_page_after_login">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact.html">Contact us</a></li>
                    <!-- Dropdown Trigger -->
                    <li><a class='dropdown-button' data-activates='dropdown1'>${username}</a></li>
                    <li><a class='dropdown-button' data-activates='dropdown1'><img src="/resources/images/userLogo.jpg"
                                                                                   alt="user image"></a></li>
                    <li><p></p></li>
                </div>
            </ul>
        </div>
    </nav>
</div>


<script language="JavaScript">
    $('.dropdown-button').dropdown();
</script>

