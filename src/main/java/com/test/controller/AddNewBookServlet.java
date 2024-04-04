package com.test.controller;

import com.test.model.Book;
import com.test.service.BookService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AddNewBookServlet", value = "/add-new-book")
public class AddNewBookServlet extends HttpServlet {
    private final BookService bookService;

    public AddNewBookServlet() {
        this.bookService = new BookService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/book/create.jsp").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String author = req.getParameter("author");
        int yearPublished = Integer.parseInt(req.getParameter("yearPublished"));

        Book newBook = new Book(title, author, yearPublished);

        this.bookService.addNewBook(newBook);

        resp.sendRedirect(req.getContextPath() + "/book");
    }
}
