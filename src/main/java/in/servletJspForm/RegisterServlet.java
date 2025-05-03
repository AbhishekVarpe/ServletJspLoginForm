package in.servletJspForm;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        resp.setContentType("text/html;charset=UTF-8");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(
                     "jdbc:mysql://localhost:3306/userdb", "root", "123213Abhi@")) {

                PreparedStatement checkUser = conn.prepareStatement(
                        "SELECT * FROM users WHERE username = ?");
                checkUser.setString(1, username);
                ResultSet rs = checkUser.executeQuery();

                if (rs.next()) {
                    resp.getWriter().print("User already exists... Try logging in.");
                } else {
                    PreparedStatement insertUser = conn.prepareStatement(
                            "INSERT INTO users(username, password) VALUES(?, ?)");
                    insertUser.setString(1, username);
                    insertUser.setString(2, password); // ❗ Use hashing in real applications
                    insertUser.executeUpdate();
                    resp.sendRedirect("index.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().print("Registration failed due to server error.");
        }
    }
}
