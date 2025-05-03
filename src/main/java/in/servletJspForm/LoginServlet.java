package in.servletJspForm;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/userdb", "root", "123213Abhi@")) {

                PreparedStatement pr = conn.prepareStatement(
                        "SELECT * FROM users WHERE username=? AND password=?");
                pr.setString(1, username);
                pr.setString(2, password);
                ResultSet rs = pr.executeQuery();

                if (rs.next()) {
                    // Set session attribute
                    HttpSession session = req.getSession();
                    session.setAttribute("username", username);

                    // Redirect to welcome page
                    resp.sendRedirect("welcome.jsp");
                } else {
                    // Invalid login
                    req.setAttribute("errorMsg", "Invalid username or password.");
                    req.getRequestDispatcher("index.jsp").forward(req, resp);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMsg", "Login failed due to an internal error.");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }
}
