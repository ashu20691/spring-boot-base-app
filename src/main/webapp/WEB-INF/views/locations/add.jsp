<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>EM-Add Employee</title>
</head>
<jsp:include page="../template.jsp"/>

<body>
<h4>&nbsp;Enter Location Information</h4>
<form:form method="POST" action="/locations/save" modelAttribute="location" commandName="location">
    <table class="table table-bordered">
        <tr>
            <td><form:label path="lat">Latitude </form:label></td>
            <td><form:input path="lat"/><form:errors path="lat" cssClass="error"/></td>
        </tr>
        <tr>
            <td><form:label path="lng">longitude </form:label></td>
            <td><form:input path="lng"/><form:errors path="lng" cssClass="error"/></td>
        </tr>
    </table>
    <!-- <td colspan="2"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
    <input type="submit" value="Add Location" class="btn btn-success"/>
    <a href="/locations/add" class="btn btn-info">Reset</a>
</form:form>
</body>
</html>