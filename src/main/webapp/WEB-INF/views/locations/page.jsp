<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">
 		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;} 
 		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;} 
 		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
 		.tg .tg-4eph{background-color:#f9f9f9} 
	</style> 
</head>
<jsp:include page="../template.jsp"/>
<body>
<%--<form action="/locations/find" method="get"> --%>
    <%--<br>&nbsp;<button type="submit" class="btn btn-info">Find Employee <span class="glyphicon glyphicon-search"></span> </button>--%>
    <%--<input name="empNo" placeholder="Employee No." />--%>
<%--</form>--%>
<c:url var="firstUrl" value="/pages/1" />
<c:url var="lastUrl" value="/pages/${Location.totalPages}" />
<c:url var="prevUrl" value="/pages/${currentIndex - 1}" />
<c:url var="nextUrl" value="/pages/${currentIndex + 1}" />

<div class="pagination">

<h2>Location List <a href="/locations/add" class="btn btn-info" style="float: right"><span class="glyphicon glyphicon-plus"></span>Add Location</a>
</h2>
    <c:if test="${!empty listemp}">
    <table class="table table-striped" style="margin-top: 20px;">
        <thead>
        <tr>
            <th >Id</th>
            <th >Latitude</th>
            <th>Longitude</th>
            <th>Delete</th>
        </tr>
        </thead>


        <c:forEach items="${listemp.content}" var="location">
            <tr>
                <td>${location.id}</td>
                <td>${location.lat}</td>
                <td>${location.lng}</td>
                <td><a href="/locations/delete/${location.id}" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span>Delete</a> </td>
            </tr>
        </c:forEach>
    </table>
    </c:if>

    <ul class="pager">
        <c:if test="${!listemp.first}">
            <li class="previous">
                <a href="?page=${listemp.number-1}">&larr;Previous</a>
            </li>
        </c:if>
        <ul>
            <li class="disabled"><a href="javascript:void(0)">&lt;&lt;</a></li>
            <li class="disabled"><a href="javascript:void(0)">&lt;</a></li>
            <!--     <li class="active"><a href="javascript:void(0)">1</a></li> -->
            <li><a href="?page=1&size=20">1</a></li>
            <li><a href="?page=2&size=20">2</a></li>
            <li><a href="?page=3&size=20">3</a></li>
            <li><a href="?page=4&size=20">4</a></li>
            <li><a href="?page=5&size=20">5</a></li>
            <li><a href="?page=6&size=20">6</a></li>
            <li><a href="?page=7&size=20">7</a></li>
            <li><a href="?page=8&size=20">8</a></li>
            <li><a href="?page=9&size=20">9</a></li>
            <li><a href="?page=10&size=20">10</a></li>
            <li><a href="?page=1&size=20">&gt;</a></li>
            <li><a href="?page=10&size=20">&gt;&gt;</a></li>
        </ul>
        <c:if test="${!listemp.last}">
            <li class="next">
                <a href="?page=${listemp.number+1}">Next &rarr;</a>
            </li>
        </c:if>
    </ul>
</body>
</html>
