package student.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.DbConnection.DBConnection;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/updateStudent")
public class UpdateStudentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String course = req.getParameter("course");

        try {
            Connection con = DBConnection.createDbConnection();

            PreparedStatement ps = con.prepareStatement(
                "UPDATE students SET name=?, email=?, course=? WHERE id=?"
            );

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, course);
            ps.setInt(4, id);

            ps.executeUpdate();

            HttpSession session = req.getSession();
            session.setAttribute("msg", "Student updated successfully!");

            res.sendRedirect("viewStudents.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}