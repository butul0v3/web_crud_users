<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
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
<h1>userlist</h1>

<table class="tg">
    <tr>
        <th width="80">ID</th>
        <th width="200">Name</th>
        <th width="80">Age</th>
        <th width="80">IsAdmin</th>
        <th width="200">Date</th>
    </tr>
    <c:if test="${!empty listUsers}">

    <c:forEach var="users" items="${listUsers}">
        <tr>
            <td>${users.id}</td>
            <td><a href="/userdata/${users.id}" target="_blank">${users.name}</a> </td>
            
            <td>${users.age}</td>
            <td>${users.admin}</td>
            <td>${users.createdDate}</td>
        </tr>
    </c:forEach>
</table>
</c:if>


</body>
</html>
