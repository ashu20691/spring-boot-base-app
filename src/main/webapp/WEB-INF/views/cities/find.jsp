<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>EM-Find City</title>
    <link type="text/css" href="/css/bootstrap.css" rel="stylesheet" />
</head>
<jsp:include page="../home.jsp"/>
<body>
<h2>City information</h2>
<a href="/welcome1/cities/find/${city.cityId}"></a>
<table class="table table-bordered">
  <tr>
        <th width="70">City Id</th>
        <th width="120">City Name</th>
		<th width="60">Edit</th>
  </tr>
  <tr>
        <td>${city.cityId}</td>
        <td>${city.cityName}</td>
        <td>${city.lastName}</td>
        <td>${city.gender}</td>
        <td>${city.birthDate}</td>
        <td>${city.hireDate}</td>
        <td><a href="/welcome1/cities/edit/${city.cityId}" class="btn btn-warning"><span class="glyphicon glyphicon-edit"></span> Edit</a></td>
 </tr>
  </table>

<script type="application/javascript" src="js/jquery.js"></script>
<script type="application/javascript" src="js/bootstrap.js"></script>


</body>
</html>