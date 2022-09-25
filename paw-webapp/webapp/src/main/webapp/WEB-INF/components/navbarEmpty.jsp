<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
    <head>
        <!-- CSS -->
        <link rel="stylesheet" href="<c:url value="/assets/css/navbar.css"/>">
        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
    <nav class="navbar navbar-dark mb-auto nav-fill w-100" style="background-color: #04704C; font-size: large;">
        <div class="container-fluid">
            <sec:authorize access="isAnonymous()">
                <a class="navbar-brand" href="<c:url value="/login"/>">
                    <img src="<c:url value="/assets/images/logo.png"/>" height="40" class="d-inline-block align-top" alt="">
                </a>
            </sec:authorize>
            <sec:authorize access="hasRole('ENTERPRISE')">
                <a class="navbar-brand" href="<c:url value="/"/>">
                    <img src="<c:url value="/assets/images/logo.png"/>" height="40" class="d-inline-block align-top" alt="">
                </a>
            </sec:authorize>
            <sec:authorize access="hasRole('USER')">
                <a class="navbar-brand" href="<c:url value="/profileUser/${param.id}"/>">
                    <img src="<c:url value="/assets/images/logo.png"/>" height="40" class="d-inline-block align-top" alt="">
                </a>
            </sec:authorize>
        </div>
    </nav>
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    </body>
</html>
