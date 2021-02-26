<%--
  Created by IntelliJ IDEA.
  User: paulina
  Date: 02/02/2021
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="row">
    <div class="col-md-8 offset-2">

        <div class="card">

            <div class="card-header">
                <h4>Add a status update</h4>
            </div>

            <div class="card-body">

                <form:form modelAttribute="statusUpdate">

                    <div class="errors">
                        <form:errors path="text"/>
                    </div>

                    <div class="form-group">
                        <form:textarea path="text" name="text" rows="10" cols="50"></form:textarea>
                    </div>

                    <input type="submit" name="submit" value="Add Status" />
                </form:form>

            </div>

        </div>

        <div class="card">

            <div class="card-header">
                <h4>Status update added on <fmt:formatDate pattern="EEEE d MMMM y 'at' H:mm:ss" value="${latestStatusUpdate.added}" /></h4>
            </div>

            <div class="card-body">
                <c:out value="${latestStatusUpdate.text}" />

            </div>

        </div>

    </div>
</div>

