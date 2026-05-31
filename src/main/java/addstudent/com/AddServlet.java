package addstudent.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DbConnection.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addStudent")
public class AddServlet extends HttpServlet {

    protected void service(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        Connection con = DBConnection.createDbConnection();

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String course = req.getParameter("course");

            // CHECK EMAIL EXISTS
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM students WHERE email=?"
            );
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                req.getSession().setAttribute("msg", "Student already exists!");
                res.sendRedirect("addStudent.jsp");

            } else {

                PreparedStatement ps1 = con.prepareStatement(
                    "INSERT INTO students (id, name, email, course) VALUES (?,?,?,?)"
                );

                ps1.setInt(1, id);
                ps1.setString(2, name);
                ps1.setString(3, email);
                ps1.setString(4, course);

                int i = ps1.executeUpdate();

                if (i > 0) {
                    req.getSession().setAttribute("msg", "Student saved successfully!");
                } else {
                    req.getSession().setAttribute("msg", "Student not saved!");
                }

                res.sendRedirect("addStudent.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("msg", "Error occurred!");
            res.sendRedirect("addStudent.jsp");
        }
    }
}