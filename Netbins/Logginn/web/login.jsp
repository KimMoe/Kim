<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>loginjsp</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
String userid=request.getParameter("usr"); 
session.putValue("userid",userid); 
String pwd=request.getParameter("pwd"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/slit","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from user where user_fname='"+userid+"'"); 
if(rs.next()) 
{ 
if(rs.getString(4).equals(pwd)) 
{ 
out.println("Welkommen "+userid); 

} 
else 
{ 
out.println("Feil passord, prøv igjen"); 
} 
} 
else 
%>
<a href="index.html">Home</a>
</body>
</html>