package com.crud.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class NextPage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doGet(req, resp);

        int pageNumber = Integer.parseInt(req.getParameter("page"));
        req.getRequestDispatcher("/users/" + pageNumber++).forward(req, resp);
    }
}
