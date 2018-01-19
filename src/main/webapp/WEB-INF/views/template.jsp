<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Manage Employee</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  <%--<link type="text/css" href="css/bootstrap-theme.css" rel="stylesheet" />--%>


</head>
<body>

<div class="container">
  <ol class="breadcrumb">
    <li><a href="/">Home</a></li>
    <%--<li><a href="#">Admin</a></li>--%>
    <li class="active"><a href="/employees/pages">Admin</a></li>
    <li class=""><a class="float-right" href="javascript:document.getElementById('logout').submit()">Logout</a></li>
  </ol>
  <c:url value="/logout" var="logout" />
  <form id="logout" action="${logout}" method="post" >
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  </form>
  <c:if test="${pageContext.request.userPrincipal.name != null}">
  </c:if>

<%--<nav class="navbar navbar-default">--%>
  <%--<div class="container-fluid">--%>
    <%--<div class="navbar-header">--%>
      <%--<a class="navbar-brand" href="">Employee Management</a>--%>
    <%--</div>--%>
    <%--<ul class="nav navbar-nav">--%>
      <%--<li class=""><a href="/employees/pages">Employee List</a></li>--%>
      <%--<li class=""><a href="/export">Export</a></li>--%>
    <%--</ul>--%>

  <%--</div>--%>
<%--</nav>--%>
<%--<script type="application/javascript" src="js/jquery.js"></script>--%>
<%--<script type="application/javascript" src="js/bootstrap.js"></script>--%>

</body>
</html>

