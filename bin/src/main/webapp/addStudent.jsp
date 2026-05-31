<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Student</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI', sans-serif;
}

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#0f172a,#1e3a8a,#0b1b3a);
}

.container{
    width:450px;
    padding:35px;
    border-radius:15px;
    background:rgba(255,255,255,0.08);
    backdrop-filter: blur(12px);
    box-shadow:0 15px 40px rgba(0,0,0,0.6);
    color:white;
}

h2{
    text-align:center;
    margin-bottom:25px;
    font-size:26px;
    color:#e0e7ff;
}

input{
    width:100%;
    padding:12px;
    margin-bottom:15px;
    border:none;
    outline:none;
    border-radius:8px;
    background:rgba(255,255,255,0.15);
    color:white;
    font-size:15px;
}

input::placeholder{
    color:#cbd5e1;
}

button{
    width:100%;
    padding:12px;
    border:none;
    border-radius:8px;
    background:linear-gradient(90deg,#2563eb,#3b82f6);
    color:white;
    font-size:16px;
    font-weight:bold;
    cursor:pointer;
}

button:hover{
    transform:scale(1.03);
}

.note{
    text-align:center;
    margin-top:15px;
    font-size:13px;
    color:#cbd5e1;
}

#toast{
    position: fixed;
    bottom: 20px;
    right: 20px;
    padding: 8px 14px;
    border-radius: 5px;
    font-size: 14px;
    color: white;
    opacity: 0.9;
}
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

</style>

</head>

<body>

<div class="container">
<a href="home.jsp" class="back-btn">←</a>

    <h2>➕ Add Student</h2>

    <%
        String msg = (String) session.getAttribute("msg");

        if (msg != null) {

            String lower = msg.toLowerCase();
            String color = "#000";

            if (lower.contains("success")) {
                color = "#22c55e";
            } 
            else if (lower.contains("not") || lower.contains("error") || lower.contains("exists")) {
                color = "#ef4444";
            }
    %>

    <div id="toast"><%= msg %></div>

    <script>
        setTimeout(() => {
            let t = document.getElementById("toast");
            if (t) t.style.display = "none";
        }, 2000);
    </script>

    <style>
        #toast{
            background:<%= color %>;
        }
    </style>

    <%
            session.removeAttribute("msg");
        }
    %>

    <form action="addStudent" method="post">

        <input type="number" name="id" placeholder="Enter Student ID" required>

        <input type="text" name="name" placeholder="Enter Student Name" required>

        <input type="email" name="email" placeholder="Enter Student Email" required>

        <input type="text" name="course" placeholder="Enter Course Name" required>

        <button type="submit">Save Student</button>

    </form>

    <div class="note">
        ID and Email must be unique
    </div>

</div>

</body>
</html>