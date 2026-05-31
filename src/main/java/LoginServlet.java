import java.io.IOException;


import java.net.http.HttpClient;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DbConnection.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	@Override
    protected void service(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        Connection con = DBConnection.createDbConnection();
        HttpSession session = req.getSession();

        try {
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            // check mail
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM register WHERE email=? and password=?"
            );
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (!rs.next()) {
           
                session.setAttribute("msg", "Invalid Email and password");
                res.sendRedirect("login.jsp");

            } else {
                res.sendRedirect("home.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("msg", "Something went wrong!");
            res.sendRedirect("login.jsp");
        }
    }

}
