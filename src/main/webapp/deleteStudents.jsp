<%@ page import="java.sql.*" %>
<%@ page import="com.DbConnection.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Students</title>

<style>

body{
    font-family:Arial;
    background:#0f172a;
    color:white;
    padding:40px;
}
.back-btn{

    position:absolute;
    top:20px;
    left:20px;

    text-decoration:none;

    font-size:24px;

    color:white;

    background:rgba(255,255,255,0.15);

    padding:8px 14px;

    border-radius:8px;

    transition:0.3s;
}

.back-btn:hover{

    background:rgba(255,255,255,0.3);
}

table{
    width:90%;
    margin:auto;
    border-collapse:collapse;
}

th,td{
    border:1px solid white;
    padding:12px;
    text-align:center;
}

th{
    background:#2563eb;
}

.delete-btn{
    background:red;
    color:white;
    padding:8px 14px;
    text-decoration:none;
    border-radius:5px;
}

</style>

</head>

<body>
<a href="home.jsp" class="back-btn">←</a>

<h1 align="center">Delete Students</h1>

<table>

<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Course</th>
    <th>Action</th>
</tr>

<%

try{

    Connection con = DBConnection.createDbConnection();

    PreparedStatement ps =
    con.prepareStatement(
        "SELECT * FROM students"
    );

    ResultSet rs = ps.executeQuery();

    while(rs.next()){

%>

<tr>

<td><%= rs.getInt("id") %></td>

<td><%= rs.getString("name") %></td>

<td><%= rs.getString("email") %></td>

<td><%= rs.getString("course") %></td>

<td>

<a class="delete-btn"

href="delete.jsp?id=<%= rs.getInt("id") %>"

onclick="return confirm('Delete this student?')">

Delete

</a>

</td>

</tr>

<%
    }

}catch(Exception e){

    out.println(e);
}

%>

</table>

</body>
</html>