package com.crud;

import com.crud.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WorkerConnection {
    private final String url = "jdbc:mysql://localhost:3306/test";
    private final String userName = "root";
    private final String password = "root";
    private final String query = "SELECT * FROM user";
    private Connection connection = null;
    private Statement statement = null;
    private ResultSet resultSet = null;

    public WorkerConnection() {
    }

    public List<User> getUsers() {
        User user = null;
        List<User> result = new ArrayList<User>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, userName, password);
            statement = connection.createStatement();
            System.out.println(query);
            resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt(1));
                user.setName(resultSet.getString(2));
                user.setAge(resultSet.getInt(3));
                int admin = resultSet.getInt(4);

                if (admin == 0)
                    user.setAdmin(false);
                else user.setAdmin(true);

                user.setCreatedDate(resultSet.getDate(5));
                result.add(user);
            }
        } catch (ClassNotFoundException ex) {
            System.err.print("error");
        } catch (SQLException sqlEx) {
            sqlEx.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException sqlEx) {
                sqlEx.printStackTrace();
            }
        }
        return result;
    }
}
