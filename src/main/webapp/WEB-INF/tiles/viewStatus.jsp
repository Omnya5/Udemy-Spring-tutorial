<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytags" %>

<c:url var="url" value="/viewStatus"/>

<div class="row">
    <div class="col-md-8 offset-2">
        <mytags:pagination page="${page}" url="${url}" size="3"/>
        <div class="card">
            <c:forEach var="statusUpdate" items="${page.content}">
                <c:url var="editLink" value="/editStatus?id=${statusUpdate.id}"/>
                <c:url var="deleteLink" value="/deleteStatus?id=${statusUpdate.id}"/>
                <div class="card-header">
                    Status added on: <fmt:formatDate pattern="EEEE d MMMM y 'at' H:mm:ss"
                                                     value="${statusUpdate.added}"/>
                </div>

                <div class="card-body">
                    <div>
                        ${statusUpdate.text}
                    </div>
                    <div class="edit-links pull-right">
                        <a href="${editLink}">edit</a>
                        |
                        <a onclick="return confirm('Really want to delete this status?');"
                           href="${deleteLink}">delete</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>