<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Add Company</title>
    <link type="text/css" href="/css/bootstrap.css" rel="stylesheet" />
</head>
<jsp:include page="../home.jsp"/>

<body>
<h4>&nbsp;Enter Company Information</h4>
<form:form method="POST" action="/welcome2/companies/save" modelAttribute="company" commandName="company">
   <table class="table table-bordered">
    <tr>
        <td><form:label path="companyId">Company Id </form:label></td>
        <td><form:input path="companyId"  /><form:errors path="companyId" cssClass="error"/></td>
    </tr>
    <tr>
        <td><form:label path="companyName">Company Name </form:label></td>
        <td><form:input path="companyName"  /><form:errors path="companyName" cssClass="error"/></td>
    </tr>
    <tr>
    	<td><form:label path="createdOn">Created On</form:label></td>
      	<td><form:input type= "date" path="createdOn" /><form:errors path="createdOn" cssClass="error"/></td>
    </tr>
     <tr>
        <td><form:label path="cityId">City Id </form:label></td>
        <td><form:input path="cityId"  /><form:errors path="cityId" cssClass="error"/></td>
    </tr>
     <tr>
        <td><form:label path="address">Address</form:label></td>
        <td><form:input path="address"  /><form:errors path="address" cssClass="error"/></td>
    </tr>
     <tr>
        <td><form:label path="zipCode">Zip Code</form:label></td>
        <td><form:input path="zipCode"  /><form:errors path="zipCode" cssClass="error"/></td>
    </tr>
    
   </table>
<!--         <td colspan="2"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
            <input type="submit" value="Add Company" class="btn btn-success"/>
<a href="/welcome2/companies/add" class="btn btn-info">Reset</a>
</form:form>

<script type="application/javascript" src="js/jquery.js"></script>
<script type="application/javascript" src="js/bootstrap.js"></script>
</body>
</html>