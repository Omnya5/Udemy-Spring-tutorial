<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title><tiles:insertAttribute name="title"/></title>

    <c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <!-- Bootstrap CSS -->
    <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextRoot}/css/main.css" rel="stylesheet">
    <script type="text/javascript" src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="${contextRoot}/js/bootstrap.min.js"
            crossorigin="anonymous"></script>
</head>
<body>
<!-- navbar -->
<nav class="navbar navbar-static-top navbar-expand-md navbar-light mb-4">
    <div class="container-fluid">
        <a class="navbar-brand" href="${contextRoot}/">Spring Boot Tutorial</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <ul class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" aria-current="page" href="${contextRoot}/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${contextRoot}/about">About</a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <sec:authorize access="!isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="${contextRoot}/login">Login</a>
                    </li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:$('#logoutForm').submit();">Logout</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Status
                        </a>
                        <ul class="dropdown-menu" style="right: 0; left: auto;" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="${contextRoot}/addStatus">Add Status</a>
                            <a class="dropdown-item" href="${contextRoot}/viewStatus">View Status Updates</a>
                        </ul>
                    </li>
                </sec:authorize>
            </ul>
            <!-- Search form
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
            -->
        </ul>
    </div>
    </div>
</nav>
<c:url var="logoutLink" value="/logout"/>
<form id="logoutForm" method="post" action="${logoutLink}">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<div class="container">
    <tiles:insertAttribute name="content"/>
</div>
<!-- Option 2: Separate Popper and Bootstrap JS -->
<%--<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"--%>
<%--        integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU"--%>
<%--        crossorigin="anonymous"></script>--%>


</body>
</html>
