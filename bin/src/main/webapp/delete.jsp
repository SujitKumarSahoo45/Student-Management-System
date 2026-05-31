<%@ page import="java.sql.*" %>
<%@ page import="com.DbConnection.DBConnection" %>

<%

String id = request.getParameter("id");

try{

    Connection con = DBConnection.createDbConnection();

    PreparedStatement ps =
    con.prepareStatement(
        "DELETE FROM students WHERE id=?"
    );

    ps.setInt(1, Integer.parseInt(id));

    ps.executeUpdate();

    response.sendRedirect("deleteStudents.jsp");

}catch(Exception e){

    out.println(e);
}

%>