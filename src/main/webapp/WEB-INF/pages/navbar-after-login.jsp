<!-- Dropdown Structure -->
<ul id='dropdown1' class='dropdown-content'>
    <li><a href="#!">one</a></li>
    <li><a href="#!">two</a></li>
    <li class="divider"></li>
    <li><a href="#!">three</a></li>
    <li><a href="#!"><i class="material-icons">view_module</i>four</a></li>
    <li><a href="#!"><i class="material-icons">cloud</i>five</a></li>
</ul>

<div class="navbar-fixed">
    <nav>
        <div class="nav-wrapper">
            <ul class="hide-on-med-and-down">
                <div class="left">
                    <li><img src="/resources/images/coworkingLogo.jpg" height="64" alt=""></li>
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
                    <li><a href="${pageContext.request.contextPath}/index.html">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact.html">Contact us</a></li>
                    <!-- Dropdown Trigger -->
                    <li><a class='dropdown-button' data-activates='dropdown1'>User</a></li>
                    <li><img src="/resources/images/userLogo.jpg" alt="user image"></li>

                </div>
            </ul>
        </div>
    </nav>
</div>


<script language="JavaScript">
    $('.dropdown-button').dropdown();
</script>

