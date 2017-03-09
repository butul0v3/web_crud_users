<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User by name</title>
    <link rel="stylesheet" href="/resources/users.css"/>
</head>
<body>
<br/>
<a href="users">back</a>
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
    <c:url value="${userName}" var="name"/>

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
</table>
</body>
</html>
