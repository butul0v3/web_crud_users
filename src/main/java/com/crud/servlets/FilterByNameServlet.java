package com.crud.servlets;

import com.crud.WorkerConnection;
import com.crud.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class FilterByNameServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doGet(req, resp);
        String userName = (String) req.getParameter("userName");
        WorkerConnection workerConnection = new WorkerConnection();
        List<User> select = workerConnection.getUsers(userName);
        req.setAttribute("selectedUsers", select);

        req.getRequestDispatcher("WEB-INF/pages/filter.jsp").forward(req, resp);
    }
}
