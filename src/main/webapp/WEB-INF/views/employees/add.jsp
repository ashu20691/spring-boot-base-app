<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>EM-Add Employee</title>
    <link type="text/css" href="/css/bootstrap.css" rel="stylesheet" />
</head>
<jsp:include page="../home.jsp"/>

<body>
<h4>&nbsp;Enter Employee Information</h4>
<form:form method="POST" action="/welcome/employees/save" modelAttribute="employee" commandName="employee">
   <table class="table table-bordered">
    <tr>
        <td><form:label path="empNo">Employee No. </form:label></td>
        <td><form:input path="empNo"  /><form:errors path="empNo" cssClass="error"/></td>
    </tr>
    <tr>
        <td><form:label path="companyId">Company Id </form:label></td>
        <td><form:input path="companyId"  /><form:errors path="companyId" cssClass="error"/></td>
    </tr>
    <tr>
        <td><form:label path="firstName">First Name</form:label></td>
        <td><form:input path="firstName" /><form:errors path="firstName" cssClass="error"/></td>
    </tr>
    <tr>
        <td><form:label path="lastName">Last Name</form:label></td>
        <td><form:input path="lastName" /><form:errors path="lastName" cssClass="error"/></td>
    </tr>
   </table>
<!--         <td colspan="2"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
            <input type="submit" value="Add Employee" class="btn btn-success"/>
<a href="/welcome/employees/add" class="btn btn-info">Reset</a>
</form:form>

<script type="application/javascript" src="js/jquery.js"></script>
<script type="application/javascript" src="js/bootstrap.js"></script>
</body>
</html>