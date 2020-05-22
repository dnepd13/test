<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection(
		"jdbc:oracle:thin:@//localhost:1521/xe", "system", "1111"
		);
	int a = 0;
	if(con != null){
		a = 1;
	}
%>
</head>
<body>
hi 
<c:out value="<%=a %>"></c:out>
</body>
</html>