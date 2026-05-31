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
    position:absolute;
    top:20px;
    left:20px;
    text-decoration:none;
    font-size:22px;
    color:white;
    background:rgba(255,255,255,0.15);
    padding:6px 12px;
    border-radius:8px;
}

/* TITLE */
h1{
    text-align:center;
    margin-bottom:30px;
}

/* TABLE */
table{
    width:90%;
    margin:auto;
    border-collapse:collapse;
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(12px);
    border-radius:10px;
    overflow:hidden;
}

th, td{
    padding:14px;
    text-align:center;
    color:white;
}

th{
    background:rgba(37,99,235,0.6);
}

/* ROW HOVER */
tr:hover{
    background:rgba(255,255,255,0.1);
}

/* EDIT BUTTON */
.edit-btn{
    background:#22c55e;
    color:white;
    padding:6px 12px;
    border-radius:6px;
    text-decoration:none;
    font-weight:bold;
    transition:0.3s;
}

.edit-btn:hover{
    background:#16a34a;
}

</style>

</head>

<body>

<a href="home.jsp" class="back-btn">←</a>

<h1>📋  Edit Student Data</h1>


<table>

<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Course</th>
    <th>Action</th>
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

    <td>
        <a class="edit-btn"
          href="editStudent?id=<%= rs.getInt("id") %>">
           Edit
        </a>
    </td>
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