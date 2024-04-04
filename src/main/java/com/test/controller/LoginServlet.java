package com.test.controller;

import com.test.service.LoginService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.*;



@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private LoginService loginService;

    public LoginServlet() {
        this.loginService = new LoginService();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean isLogin = this.loginService.checkLogin(username, password);

        if(isLogin) {
            request.getSession().setAttribute("username", username);
            request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request,response);
        } else {
            request.setAttribute("errorMessage", "Invalid username or password");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }

    }
}

// Import statements
