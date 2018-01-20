<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Employee information</title>
</head>
<jsp:include page="../template.jsp"/>
<body>
<h2>Employee information</h2>

<%--<c:if test="${!empty employees}">--%>
    <table class="table table-striped" style="margin-top: 20px;">
        <thead>
        <tr>
            <th >EmpNo</th>
            <th >Email</th>
            <th>Name</th>
            <th>Mobile Number</th>
        </tr>
        </thead>


        <c:forEach items="${employees.content}" var="location">
            <tr>
                <td>${location.empNo}</td>
                <td>${location.email}</td>
                <td>${location.name}</td>
                <td>${location.mobile}</td>
            </tr>
        </c:forEach>
    </table>
<%--</c:if>--%>
</body>
</html>