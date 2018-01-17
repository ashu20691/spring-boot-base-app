<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>City Management</title>
    <style type="text/css"> 
 		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;} 
 		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;} 
 		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
 		.tg .tg-4eph{background-color:#f9f9f9} 
	</style> 
	<link type="text/css" href="/css/bootstrap.css" rel="stylesheet" />
</head>
<jsp:include page="../home.jsp"/>
<body>

<h2>City List</h2>

<c:if test="${!empty listcity}">
	<table class="table table-sm">
	<thead class="thead-inverse">
	<tr>
		<th width="70">City Id</th>
		<th width="70">City Name</th>
		<th width="70">Edit</th>
		<th width="70">Delete</th>
	</tr>
	</thead>
	<c:forEach items="${listcity}" var="city">
		<tr>
		   <td>${city.cityId}</td>
		   <td>${city.cityName}</td>
  <td><a href="/welcome1/cities/edit/${city.cityId}" class="btn btn-warning"><span class="glyphicon glyphicon-edit"></span> Edit</a></td>
  <td><a href="/welcome1/cities/delete/${city.cityId}" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span>Delete</a> </td>
		</tr>
	</c:forEach>
	</table>
</c:if>
<script type="application/javascript" src="js/jquery.js"></script>
    <script type="application/javascript" src="js/bootstrap.js"></script>
</body>
</html>
