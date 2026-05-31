package com.register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.DbConnection.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        Connection con = DBConnection.createDbConnection();
        HttpSession session = req.getSession();

        try {

            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String role = req.getParameter("role");

            // CHECK EMAIL
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM register WHERE email=?"
            );
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (!rs.next()) {

                // INSERT USER
                PreparedStatement ps1 = con.prepareStatement(
                    "INSERT INTO register (id, name, email, password, role) VALUES (?,?,?,?,?)"
                );

                ps1.setInt(1, id);
                ps1.setString(2, name);
                ps1.setString(3, email);
                ps1.setString(4, password);
                ps1.setString(5, role);

                ps1.executeUpdate();

                session.setAttribute("msg", "Registration successful!");
                res.sendRedirect("login.jsp");

            } else {

                session.setAttribute("msg", "Email already exists!");
                res.sendRedirect("register.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("msg", "Something went wrong!");
            res.sendRedirect("register.jsp");
        }
    }
}