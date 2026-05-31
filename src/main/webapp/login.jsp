<%@page import="com.sun.org.apache.xpath.internal.operations.Div"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management - Login</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#667eea,#764ba2);
}

.container{
    width:850px;
    height:500px;
    background:white;
    border-radius:20px;
    overflow:hidden;
    display:flex;
    box-shadow:0 10px 30px rgba(0,0,0,0.3);
}

.left{
    width:50%;
    background:url('https://images.unsplash.com/photo-1523240795612-9a054b0db644?q=80&w=1200&auto=format&fit=crop') center/cover;
    position:relative;
}

.left::after{
    content:"Welcome Back";
    position:absolute;
    bottom:40px;
    left:20px;
    color:white;
    font-size:35px;
    font-weight:bold;
    text-shadow:2px 2px 10px black;
}

.right{
    width:50%;
    padding:50px;
}

.right h2{
    text-align:center;
    margin-bottom:30px;
    color:#333;
}

input{
    width:100%;
    padding:12px;
    margin-top:18px;
    border:1px solid #ccc;
    border-radius:8px;
    outline:none;
    font-size:15px;
}

input:focus{
    border-color:#667eea;
}

button{
    width:100%;
    padding:12px;
    margin-top:25px;
    border:none;
    border-radius:8px;
    background:#667eea;
    color:white;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    background:#4c51bf;
}

p{
    text-align:center;
    margin-top:20px;
}

a{
    text-decoration:none;
    color:#667eea;
    font-weight:bold;
}

</style>

</head>
<body>

<div class="container">

    <div class="left"></div>

    <div class="right">

        <h2>Login</h2>
        <%
        String msg=(String)session.getAttribute("msg");
        if(msg!=null){
        
        	   %>

               <div style="color:red; font-weight:bold; margin-bottom:10px;">
                   <%= msg %>
               </div>

           <%
                   session.removeAttribute("msg");
               }
           %>


        <form action="login" method="post">

            <input type="email" name="email" placeholder="Enter Email" required>

            <input type="password" name="password" placeholder="Enter Password" required>

            <button type="submit">Login</button>

        </form>

        <p>
            Don't have account?
            <a href="register.jsp">Register</a>
        </p>

    </div>

</div>

</body>
</html>