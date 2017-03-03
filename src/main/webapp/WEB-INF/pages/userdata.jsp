<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
<head>
    <title>userdata</title>
    <link rel="stylesheet" href="/resources/users.css"/>
</head>
<body>
<h1>user details</h1>
<table class="tg">
    <tr>
        <th width="80">ID</th>
        <th width="200">name</th>
        <th width="80">age</th>
        <th width="80">is_admin</th>
        <th width="200">created_date</th>
    </tr>
    <tr>
        <td>${user.id}</td>
        <td>${user.name}</td>
        <td>${user.age}</td>
        <td>${user.admin}</td>
        <td>${user.createdDate}</td>
    </tr>
</table>
</body>
</html>
