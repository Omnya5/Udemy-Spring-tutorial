<%--
  Created by IntelliJ IDEA.
  User: paulina
  Date: 10/02/2021
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:url var="url" value="/viewStatus" />

<div class="row">
    <div class="col-md-8 offset-2">
        <div class="pagination">
            <c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
                
                <c:choose>
                    <c:when test="${page.number != pageNumber-1}">
                        <a href="${url}?p=${pageNumber}"><c:out value="${pageNumber}"/></a>
                    </c:when>
                    <c:otherwise>
                        <strong><c:out value="${pageNumber}"/></strong>
                    </c:otherwise>
                </c:choose>

                <c:if test="${pageNumber != page.totalPages}">
                    |
                </c:if>
            </c:forEach>

        </div>

        <div class="card">

            <div class="card-header">
                <h4>List of status: </h4>
            </div>

            <div class="card-body">
                <c:forEach var="statusUpdate" items="${page.content}">
                    <p>
                        <fmt:formatDate pattern="EEEE d MMMM y 'at' H:mm:ss" value="${statusUpdate.added}"/>
                        <c:out value="${statusUpdate.text}"/>
                    </p>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<br>
Page number: ${param.p}
