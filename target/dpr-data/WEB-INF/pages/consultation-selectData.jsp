<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Consultation</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $( function() {
            $( "#datepicker" ).datepicker({ minDate: 0, maxDate: "+1M +10D" });
        } );
    </script>
</head>
<body>
<h1>Schedule Consultation</h1>

<form method="POST" action="${pageContext.request.contextPath}/consultation/selectData.html">
    <div>
        <div>
            <div>
                Choose desired doctor:</br>
                <c:forEach var="employee" items="${doctorList}">
                    <input type="radio" name="doctorID" value="${employee.id}">${employee.name}
                    <br>
                </c:forEach>
            </div>
            <br>
            <div>Date:</div>
            </br>
            <input type="text" name="selDate" id="datepicker">
        </div>
        <div><input type="submit" value="OK"/></div>
    </div>
    </div>
</form>
</body>
</html>