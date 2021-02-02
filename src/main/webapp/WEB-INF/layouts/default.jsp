<%--
  Created by IntelliJ IDEA.
  User: paulina
  Date: 22/01/2021
  Time: 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title><tiles:insertAttribute name="title"/></title>

    <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
    <!-- Bootstrap CSS -->
    <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link href="${contextRoot}/css/main.css" rel="stylesheet">
</head>
<body>
<!-- navbar -->
<nav class="navbar navbar-expand-md navbar-light mb-4">
    <div class="container-fluid">
        <a class="navbar-brand" href="${contextRoot}/">Spring Boot Tutorial</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav me-auto mb-2 mb-md-0">
                <li class="nav-item active">
                    <a class="nav-link" aria-current="page" href="${contextRoot}/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${contextRoot}/about">About</a>
                </li>
            </ul>
            <ul class="navbar-nav navbar-right mb-2 mb-md-0">
                <li class="nav-item">
                    <a class="nav-link" href="${contextRoot}/addStatus">Add Status</a>
                </li>
            </ul>
            <!-- Search form
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
            -->
        </div>
    </div>
</nav>

<div class="container">
<tiles:insertAttribute name="content"/>
</div>
<!-- Option 2: Separate Popper and Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"
        integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU"
        crossorigin="anonymous"></script>
<script src="${contextRoot}/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj"
        crossorigin="anonymous"></script>

</body>
</html>
