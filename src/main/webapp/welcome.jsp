<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("index.jsp"); // Redirect to login if not logged in
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #83a4d4, #b6fbff);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .container {
            width: 100%;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .card {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
            text-align: center;
            max-width: 400px;
            width: 90%;
        }
        .card h2 {
            color: #333;
            margin-bottom: 15px;
        }
        .card p {
            font-size: 18px;
            margin-bottom: 30px;
        }
        .logout-btn {
            padding: 10px 25px;
            font-size: 16px;
            background-color: #f44336;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        .logout-btn:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <h2>Welcome, <%= username %>!</h2>
            <p>You have successfully logged in to your account.</p>
            <a href="logout.jsp" class="logout-btn">Logout</a>
        </div>
    </div>
</body>
</html>
