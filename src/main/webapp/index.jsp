<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page session="false" %>
<html>
<head>
    <title>userslist</title>
    <link rel="stylesheet" href="resources/app.css">
</head>

<div id="wrapper">

<ul class="menu">
<a href="<c:url value="/users"/>" target="_self">list</a>
</ul>
<br/>
<br/>
    <p>
        На текущий момент реализовано добавление, удаление из базы.
        Есть возможность выбрать одного из использователей (информация открывается в отдельном окне).
        Реализован поиск по имени пользователя.
    </p>
</div>
</body>
</html>
