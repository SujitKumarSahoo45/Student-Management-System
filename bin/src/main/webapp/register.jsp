<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management - Register</title>

<style>
/* your CSS unchanged */
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
    background:linear-gradient(135deg,#4facfe,#00f2fe);
}

.container{
    width:900px;
    height:550px;
    background:white;
    border-radius:20px;
    overflow:hidden;
    display:flex;
    box-shadow:0 10px 30px rgba(0,0,0,0.3);
}

.left{
    width:50%;
    background:url('https://images.unsplash.com/photo-1522202176988-66273c2fd55f?q=80&w=1200&auto=format&fit=crop') center/cover;
    position:relative;
}

.left::after{
    content:"Student Management System";
    position:absolute;
    bottom:40px;
    left:20px;
    color:white;
    font-size:32px;
    font-weight:bold;
    text-shadow:2px 2px 10px black;
}

.right{
    width:50%;
    padding:40px;
}

input,select{
    width:100%;
    padding:12px;
    margin-top:15px;
    border:1px solid #ccc;
    border-radius:8px;
    outline:none;
    font-size:15px;
}

button{
    width:100%;
    padding:12px;
    margin-top:20px;
    border:none;
    border-radius:8px;
    background:#4facfe;
    color:white;
    font-size:16px;
    cursor:pointer;
}
</style>

</head>
<body>

<div class="container">

    <div class="left"></div>

    <div class="right">

        <h2>Create Account</h2>

        <!-- ✅ MESSAGE FIXED HERE -->
        <%
            String msg = (String) session.getAttribute("msg");
            if (msg != null) {
        %>

            <div style="color:red; font-weight:bold; margin-bottom:10px;">
                <%= msg %>
            </div>

        <%
                session.removeAttribute("msg");
            }
        %>

        <form action="register" method="post">

            <input type="number" name="id" placeholder="Enter ID" required>
            <input type="text" name="name" placeholder="Enter Name" required>
            <input type="email" name="email" placeholder="Enter Email" required>
            <input type="password" name="password" placeholder="Enter Password" required>

            <select name="role" required>
                <option value="">Select Role</option>
                <option value="ADMIN">ADMIN</option>
                <option value="STUDENT">STUDENT</option>
            </select>

            <button type="submit">Register</button>

        </form>

        <p style="text-align:center; margin-top:20px;">
            Already have account?
            <a href="login.jsp">Login</a>
        </p>

    </div>

</div>

</body>
</html>