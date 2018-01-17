<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>EM-Find Employee</title>
</head>
<jsp:include page="../home.jsp"/>
<body>
<h2>Employee information</h2>
<a href="/employees/find/${employee.empNo}"></a>
<table class="table table-sm">
    <thead class="thead-inverse">
    <tr>
        <th >EmpNo</th>
        <th >Company ID</th>
        <th>First Name</th>
        <th>Last Name</th>
    </tr>
    </thead>


        <tr>
            <td>${employee.empNo}</td>
            <td>${employee.companyId}</td>
            <td>${employee.firstName}</td>
            <td>${employee.lastName}</td>
           </tr>
</table>


</body>
</html>