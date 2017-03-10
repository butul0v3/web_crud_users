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
    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 15px;
            border-color: black;
            background-color: #333333;
            text-align: center;
            margin: auto;
            position: relative;
        }


        .tg td {
            font-family: Verdana, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #a4a4a4;
            color: #383b45;
            background-color: #b4b4b4;
        }

        .tg th {
            font-family: Verdana, sans-serif;
            font-size: 15px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: ridge;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #a4a4a4;
            color: #f9f9f9;
            background-color: #36393d;
            text-align: center;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }

        a:link, a:visited, a:active {
            color: #272727;
        }

        .form-search {
            position: relative;
            left: 40%;
            width: 50%;
        }


        .add-form {
            font-family: Verdana, sans-serif;
            font-size: 16px;
            font-weight: normal;

        }

        .adding-form {
            right: -1%;
            position: relative;
            width: 50%;
        }

        h3 {
            position: relative;
            right: -1%;
            font-family: Verdana, sans-serif;
            width: 50%;
        }

        .pagination {
            position: relative;
            left: 40%;
            text-align: center;
        }
    </style>
</head>
<body>
<br/>
<a href="" onclick="window.location.reload()">reset form</a>


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
<c:url value="/filter" var="filter"/>
<form class="form-search" action="${filter}" name="filter">Enter username:
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


<c:set var="pageName" value="1"/>
<c:set var="total" value="10"/>

<c:url var="prevUrl" value="/users/${pageName - 1}"/>
<c:url var="nextUrl" value="/users/${pageName + 1}"/>
<c:url var="firstUrl" value="/users/1"/>
<c:url var="lastUrl" value="/users/${total}"/>

<div class="pagination">
    <ul>
        <c:choose>
            <c:when test="${pageName == 1}">
                <a href="#">&lt;&lt;</a>
                <a href="#">&lt;</a>
            </c:when>
            <c:otherwise>
                <a href="${firstUrl}">&lt;&lt;</a>
                <a href="${prevUrl}">&lt;</a>
            </c:otherwise>
        </c:choose>
        <c:forEach var="i" begin="1" end="${total}">
            <c:url var="pageUrl" value="/users/${i}"/>
            <c:choose>
                <c:when test="${i == pageName}">
                    <a href="${pageUrl}"><c:out value="${i}"/></a>
                </c:when>
                <c:otherwise>
                    <a href="${pageUrl}"><c:out value="${i}"/></a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:choose>
            <c:when test="${pageName == total}">
                <a href="#">&gt;</a>
                <a href="#">&gt;&gt;</a>
            </c:when>
            <c:otherwise>
                <a href="${nextUrl}">&gt;</a>
                <a href="${lastUrl}">&gt;&gt;</a>
            </c:otherwise>
        </c:choose>
    </ul>
</div>

</body>
</html>

