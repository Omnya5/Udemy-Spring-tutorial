<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="row">
    <div class="col-md-8 offset-2">
        <div class="card">
            <div class="card-header">
                <h4>Add a status update</h4>
            </div>
            <form:form modelAttribute="statusUpdate">
                <div class="errors">
                    <form:errors path="text"/>
                </div>
                <div class="form-group">
                    <form:textarea path="text" name="text" rows="10" cols="50"></form:textarea>
                </div>
                <input type="submit" name="submit" value="Add Status"/>
            </form:form>
        </div>
        <div class="card">
            <div class="card-header">
                <h4>Status update added on <fmt:formatDate pattern="EEEE d MMMM y 'at' H:mm:ss"
                                                           value="${latestStatusUpdate.added}"/></h4>
            </div>
            <div class="card-body">
                ${latestStatusUpdate.text}
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
<script>
    tinymce.init({
        selector: 'textarea',
        plugins: 'link'
    });
</script>
