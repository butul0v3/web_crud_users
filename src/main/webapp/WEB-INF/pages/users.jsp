<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="calendar" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="r" uri="http://anydoby.com/simpletags" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page session="false" %>
<html>
<head>
    <title>userslist</title>
    <link rel="stylesheet" href="/resources/users.css"/>
    <link rel="stylesheet" href="/resources/bootstrap.css"/>
</head>
<body>
<br/>
<a href="users">reset form</a>

<h3>add new user</h3>
<c:url var="addAction" value="/users/add"/>


<form:form action="${addAction}" commandName="user" cssClass="adding-form">
    <table>
        <c:if test="${!empty user.name}">
            <tr>
                <td>
                    <form:label path="id" class="add-form">
                        <spring:message text="id"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="name" class="add-form">
                    <spring:message text="name"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="age" class="add-form">
                    <spring:message text="age"/>
                </form:label>
            </td>
            <td>
                <form:input path="age"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="admin" class="add-form">
                    <spring:message text="admin"/>
                </form:label>
            <td>
                <form:checkbox path="admin" value="true"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty user.name}">
                    <button type="submit" class="btn"
                            value="<spring:message text="Edit User"/>">Edit User
                    </button>
                </c:if>
                <c:if test="${empty user.name}">
                    <button type="submit" class="btn"
                            value="<spring:message text="Add User"/>">Add User
                    </button>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>

<form class="form-search" action="filter" name="filter">Enter username:
    <input type="text" class="input-medium search-query" name="userName" value="" id="userName">
    <button type="submit" class="btn" value="button">Search

    </button>
</form>

<table class="tg">
    <tr>
        <th width="80">ID</th>
        <th width="300">Name</th>
        <th width="80">Age</th>
        <th width="80">IsAdmin</th>
        <th width="200">CreatedDate</th>
        <th width="80">Edit</th>
        <th width="80">Remove</th>
    </tr>
    <c:if test="${!empty listUsers}">

        <c:forEach var="users" items="${listUsers}">
            <tr>
                <c:url var="userdata" value="/userdata/${users.id}"/>
                <td>${users.id}</td>
                <td><a href=${userdata} target="_blank">${users.name}</a></td>
                <td>${users.age}</td>
                <td>${users.admin}</td>
                <td>${users.createdDate}</td>
                <td><a href="<c:url value='/edit/${users.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/remove/${users.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </c:if>
</table>
</body>
</html>

