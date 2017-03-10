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
    <style type="text/css">
        /* app css stylesheet */

        #wrapper {
            margin: 0 auto;
            width: 650px;
            margin-top: 50px;
        }

        .menu {
            text-align: center;
            list-style: none;
            padding: 0 0 0.5em;
            font-size: 40px;
            font-weight: bolder;
        }

        .menu:before {
            content: "[";
        }

        .menu:after {
            content: "]";
        }

        .menu > li {
            display: inline;
        }

        .menu > li:before {
            content: "|";
            padding-right: 0.3em;
        }

        .menu > li:nth-child(1):before {
            content: "";
            padding: 0;
        }

    </style>
</head>

<div id="wrapper">

<ul class="menu">
<a href="<c:url value="/users/1"/>" target="_self">list</a>
</ul>
<br/>
<br/>
    <p>
        На текущий момент существует возможность добавления, удаления, редактирования пользователей.
        Поиск осуществляется по полю 'name'. Есть недоработка с пейджингом - отображаются 10 страниц (по 10 записей на каждой).
    </p>
</div>
</body>
</html>
