<%@ page import="java.sql.*" %>
<%@ page import="com.DbConnection.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Students</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI', sans-serif;
}

body{
    min-height:100vh;
    background:linear-gradient(135deg,#0f172a,#1e3a8a,#0b1b3a);
    padding:40px;
    color:white;
}

/* BACK BUTTON */
.back-btn{
    position: absolute;
    top: 20px;
    left: 20px;
    text-decoration: none;
    font-size: 24px;
    color: white;
    background: rgba(255,255,255,0.15);
    padding: 6px 12px;
    border-radius: 8px;
    transition: 0.3s;
    backdrop-filter: blur(10px);
}

.back-btn:hover{
    background: rgba(255,255,255,0.25);
    transform: scale(1.1);
}

/* TITLE */
h1{
    text-align:center;
    margin-bottom:30px;
    color:#e0e7ff;
}

/* TABLE */
table{
    width:90%;
    margin:auto;
    border-collapse:collapse;
    background:rgba(255,255,255,0.08);
    backdrop-filter: blur(12px);
    border-radius:10px;
    overflow:hidden;
    box-shadow:0 15px 40px rgba(0,0,0,0.5);
}

th, td{
    padding:15px;
    text-align:center;
    color:white;
}

th{
    background:rgba(37,99,235,0.6);
    font-size:16px;
}

tr{
    transition:0.3s;
}

tr:hover{
    background:rgba(255,255,255,0.1);
}

</style>

</head>

<body>

<!-- BACK BUTTON -->
<a href="home.jsp" class="back-btn">←</a>

<h1>📋 Student List</h1>

<table>

<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Course</th>
</tr>

<%
try {
    Connection con = DBConnection.createDbConnection();

    PreparedStatement ps = con.prepareStatement("SELECT * FROM students");
    ResultSet rs = ps.executeQuery();

    while(rs.next()) {
%>

<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("email") %></td>
    <td><%= rs.getString("course") %></td>
</tr>

<%
    }

} catch(Exception e) {
    e.printStackTrace();
}
%>

</table>

</body>
</html>