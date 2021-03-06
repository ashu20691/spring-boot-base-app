<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Employee Management</title>
</head>
<jsp:include page="../template.jsp"/>
<body>
<form action="/employees/find" method="get">
    <div class="input-group">
        <input type="text" class="form-control" name="searchText" placeholder="Search" ng-model="searchText">
      <span class="input-group-btn">
        <button class="btn btn-default" type="submit">Go!</button>
      </span>
    </div>
</form>
<c:url var="firstUrl" value="/pages/1"/>
<c:url var="lastUrl" value="/pages/${Employee.totalPages}"/>
<c:url var="prevUrl" value="/pages/${currentIndex - 1}"/>
<c:url var="nextUrl" value="/pages/${currentIndex + 1}"/>

<h2>User List</h2>

<c:if test="${!empty listemp}">
    <table class="table table-striped" style="margin-top: 20px;">
        <thead>
        <tr>
            <th >EmpNo</th>
            <th >Email</th>
            <th>Name</th>
            <th>Education</th>
        </tr>
        </thead>


        <c:forEach items="${listemp.content}" var="location">
            <tr>
                <td>${location.empNo}</td>
                <td>${location.email}</td>
                <td>${location.name}</td>
                <td>${location.mobile}</td>
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
