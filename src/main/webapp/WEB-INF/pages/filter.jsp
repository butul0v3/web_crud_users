<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User by name</title>
    <link rel="stylesheet" href="/resources/users.css"/>
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
<a href="" onclick="history.back()">back to list</a>
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

        <c:forEach var="users" items="${selectedUsers}">
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
