<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Page</title>
    <style>
        body {
            background: #f0f2f5;
            font-family: Arial, sans-serif;
        }
        .register-container {
            width: 350px;
            margin: 100px auto;
            padding: 30px;
            background: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
        }
        .register-container h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }
        .register-container input[type="text"],
        .register-container input[type="password"] {
            width: 100%;
            padding: 12px 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }
        .register-container input[type="submit"] {
            width: 100%;
            padding: 12px;
            background: #2196F3;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }
        .register-container input[type="submit"]:hover {
            background: #1976D2;
        }
        .register-container p {
            text-align: center;
            margin-top: 15px;
        }
        .register-container a {
            color: #2196F3;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h2>Create Account</h2>
        <form action="RegisterServlet" method="post">
            <input type="text" name="username" placeholder="Username" required />
            <input type="password" name="password" placeholder="Password" required />
            <input type="submit" value="Register" />
        </form>
        <p>Already have an account? <a href="index.jsp">Login here</a></p>
    </div>
</body>
</html>