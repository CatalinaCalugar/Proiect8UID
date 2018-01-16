<%--
  Created by IntelliJ IDEA.
  User: cata_
  Date: 12/29/2017
  Time: 6:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<footer class="page-footer">
    <div class="container">
        <div class="row">
            <div class="col m6 l6 s12">
                <div class="row">
                    <div class="col m12">
                        <div class="black-text">Drop us a line!</div>
                    </div>
                </div>
                <form id="drop-a-line" role="form">
                    <div class="row">
                        <div class="input-field col m12 s12">
                            <input id="your-email" type="email" style="color: black" required="" aria-required="true"
                                   class="validate">
                            <label for="your-email" class="white-text">Your email address</label></div>
                    </div>
                    <div class="row">
                        <div class="input-field col m12 s12">
                            <textarea id="your-message" rows="3"
                                      class="materialize-textarea" style="color: black" required=""
                                      aria-required="true"></textarea><label
                                for="your-message" class="white-text">Your message</label></div>
                    </div>
                    <div class="row">
                        <div class="col col s12">
                            <button id="send-message" class="btn waves-effect waves-light" type="submit" name="action">
                                SEND
                                <i class="material-icons right">send</i>
                            </button>
                        </div>
                    </div>
                </form>
                <div id="thanks-note" class="hide"><p><b>Thank you for everything!</b></p>
                    <p>We'll contact you as soon as we find this.<br><i>(usually in a few hours)</i></p>
                    <p><a href="https://app.closeheat.com/users/sign_in" class="btn sign-up waves-effect waves-light">Create
                        a Website in the Meantime</a></p></div>
                <div id="error-note" class="hide"><p><b>There were errors sending your message.</b></p>
                    <p>Feel free to email us directly on
                        <a href="mailto:support@closeheat.com">support@closeheat.com</a>.
                        <br>We'll get back to you a soon as we find it.<br><i>(usually in a few hours)</i></p></div>
            </div>
            <div class="col l4 offset-l2 s12">
                <h5 class="black-text">Links</h5>
                <ul>
                    <li><a class="grey-text text-lighten-3" onclick="searchCoworkSpaces()" >Search</a></li>
                    <script>
                        function searchCoworkSpaces(){
                            var searchString = document.getElementById("search").value;
                            window.location = "${pageContext.request.contextPath}/allSpaces/" + searchString;
                        }
                    </script>
                    <li><a class="grey-text text-lighten-3" href="${pageContext.request.contextPath}/contact.html">Contact</a>
                    </li>
                </ul>
                <h5 class="black-text">Social media</h5>
                <ul>
                    <li><a href="https://www.facebook.com" target="_blank"><img
                            src="/resources/images/img_contact_facebook_icon.png"></a>
                    </li>
                    <li><a href="https://twitter.com" target="_blank"><img
                            src="/resources/images/img_contact_twitter_icon.png"></a></li>
                    <li><a href="https://https://www.instagram.com/"><img
                            src="/resources/images/img_contact_instargarm_icon.png"></a></li>
                </ul>
            </div>
        </div>


    </div>


    <div class="footer-copyright">
        <div class="container">
            © 2018 Copyright Coworking spaces
            <a class="grey-text text-lighten-4 right">Group 8</a>
        </div>
    </div>
</footer>