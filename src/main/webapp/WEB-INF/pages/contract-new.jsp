<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Add contract page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link href="/resources/css/style.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#datepicker").datepicker({minDate: 0, maxDate: "+1M +10D", dateFormat: 'yy-mm-dd'});
        });
    </script>
</head>
<body>

<div id="header"><a href="${pageContext.request.contextPath}/index.html" id="logo"><img src="/resources/images/logo.gif" width="310" height="114" alt=""></a>
    <ul class="navigation">
        <li><a href="${pageContext.request.contextPath}/index.html"> Home page </a></li>
        <li><a href="${pageContext.request.contextPath}/user-page.html"> User page </a></li>
        <li><a href="${pageContext.request.contextPath}/employee/logout.html">Logout</a></li>
    </ul>
</div>

<i></i><br/>

<div id="body">
    <div id="content">
        <i></i><br/><br/><br/>
        <div class="content">
            <form:form method="POST" commandName="contract"
                       action="${pageContext.request.contextPath}/contract/create.html">
                All adoptions without contract: <br/>
                <table style="text-align: center;" border="1px" cellpadding="0" cellspacing="0">
                    <thead>
                    <tr>
                        <th width="150px">id</th>
                        <th width="150px">adoptionDate</th>
                        <th width="25px">idPet</th>
                        <th width="50px">idClient</th>
                        <th width="50px">paymentId</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="adoption" items="${adoptionList}">
                        <tr>
                            <td>${adoption.id}</td>
                            <td>${adoption.adoptionDate}</td>
                            <td>${adoption.idPet}</td>
                            <td>${adoption.idClient}</td>
                            <td>${adoption.paymentId}</td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <br/><br/>
                Clients: <br/>
                <table style="text-align: center;" border="1px" cellpadding="0" cellspacing="0">
                    <thead>
                    <tr>
                        <th width="25px">id</th>
                        <th width="150px">first name</th>
                        <th width="25px">last name</th>
                        <th width="50px">cnp</th>
                        <th width="50px">address</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="client" items="${clientList}">
                        <tr>
                            <td>${client.id}</td>
                            <td>${client.fname}</td>
                            <td>${client.lname}</td>
                            <td>${client.CNP}</td>
                            <td>${client.address}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <table>
                    <tbody>

                    <br/>
                    <div>
                        Choose Adoption ID for this contract:<br/>
                        <c:forEach var="criteria" items="${adoptionId}">
                            <input type="radio" name="type" value="${criteria}"/> ${criteria}
                            <br>
                        </c:forEach>
                    </div>
                    <br/>

                    <tr>
                        <td>Contract date:</td>
                        <td><input type="text" name="date" id="datepicker"></td>
                        <td><form:errors path="date" cssStyle="color: red;"/></td>
                    </tr>
                    <tr>
                        <td>Description:</td>
                        <td><form:input path="description"/></td>
                        <td><form:errors path="description" cssStyle="color: red;"/></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Create"/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    </tbody>
                </table>
                <%--<a href="${pageContext.request.contextPath}/contract/download/external.html">Download contract</a><br/>--%>

            </form:form>

        </div>
    </div>
</div>

<i></i><br/><br/><br/>
<div id="footer">
    <div id="footnote">
        <div class="section">Copyright &copy; 2017 <a href="#">Pet Adoption</a> All rights reserved | By Catalina
            Calugar
        </div>
    </div>
</div>

</body>
</html>