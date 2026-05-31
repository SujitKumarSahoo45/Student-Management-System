<%@ page import="model.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Student</title>

<style>

body{
    background:linear-gradient(135deg,#0f172a,#1e3a8a);
    color:white;
    font-family:Arial;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}

.container{
    width:400px;
    padding:25px;
    background:rgba(255,255,255,0.1);
    border-radius:10px;
}

input{
    width:100%;
    padding:10px;
    margin:10px 0;
    border:none;
    border-radius:5px;
}

button{
    width:100%;
    padding:10px;
    background:green;
    color:white;
    border:none;
    cursor:pointer;
}

.back{
    position:absolute;
    top:20px;
    left:20px;
    color:white;
    text-decoration:none;
    font-size:20px;
}
#toast {
    position: fixed;
    top: 20px;
    right: 20px;
    background: #22c55e;
    color: white;
    padding: 12px 20px;
    border-radius: 8px;
    font-weight: bold;
    box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    animation: fadeInOut 3s forwards;
}

@keyframes fadeInOut {
    0% { opacity: 0; transform: translateY(-20px); }
    10% { opacity: 1; transform: translateY(0); }
    80% { opacity: 1; }
    100% { opacity: 0; transform: translateY(-20px); }
}
</style>
</head>

<body>

<a class="back" href="editStudents.jsp">←</a>

<div class="container">
<%
Student s = (Student) request.getAttribute("student");

if (s == null) {
%>

<h2 style="color:red; text-align:center;">
    Student data not found!
</h2>

<%
    return;
}
%>
<h2>Edit Student</h2>
<%
String msg = (String) session.getAttribute("msg");
if (msg != null) {
%>

<div id="toast"><%= msg %></div>

<%
    session.removeAttribute("msg");
}
%>

<form action="updateStudent" method="post">

    <input type="number" name="id" value="<%= s.getId() %>" readonly>

    <input type="text" name="name" value="<%= s.getName() %>" required>

    <input type="email" name="email" value="<%= s.getEmail() %>" required>

    <input type="text" name="course" value="<%= s.getCourse() %>" required>

    <button type="submit">Update</button>

</form>

</div>

</body>
</html>