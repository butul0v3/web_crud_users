<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>userslist</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>
</head>
<body>
<br/>
<br/>
<h1>userlist</h1>
<c:if test="${!empty listUsers}">
    <table class="tg">
        <tr>
            <th width="80">ID</th>
            <th width="80">Name</th>
            <th width="80">Age</th>
            <th width="80">IsAdmin</th>
            <th width="80">Date</th>
        </tr>
        <c:forEach items="${listUsers}" var="users">
            <tr>
                <td>{$users.id}</td>
                <td>{$users.name}</td>
                <td>{$users.age}</td>
                <td>{$users.is_admin}</td>
                <td>{$users.date}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<table>
    <c:if test="${!empty users.name}">
        <tr>
            <td>
                <form:label path="id">
                    <spring:message text="ID"/>
                </form:label>
            </td>
            <form:input path="id" readonly="true" size="8" disabled="true"/>
            <form:hidden path="id"/>
        </tr>
    </c:if>
</table>

</body>
</html>
