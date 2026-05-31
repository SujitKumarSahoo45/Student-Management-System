package student.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DbConnection.DBConnection;
import model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/editStudent")
public class EditStudentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        try {
            Connection con = DBConnection.createDbConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM students WHERE id=?"
            );
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Student s = new Student();

                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setCourse(rs.getString("course"));

                req.setAttribute("student", s);

                req.getRequestDispatcher("editdata.jsp")
                   .forward(req, res);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}