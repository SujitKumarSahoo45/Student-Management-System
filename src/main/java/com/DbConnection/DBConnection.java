package com.DbConnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String url =
            "jdbc:mysql://localhost:3306/student";

    private static final String username = "root";

    private static final String password = "@Sujit789437";

    public static Connection createDbConnection() {

        Connection connection = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            connection = DriverManager.getConnection(
                    url,
                    username,
                    password
            );

        }
        catch (Exception e) {

            e.printStackTrace();
        }

        return connection;
    }
}