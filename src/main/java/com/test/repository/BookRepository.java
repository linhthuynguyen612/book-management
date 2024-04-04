package com.test.repository;

import com.test.config.MysqlConnection;
import com.test.model.Book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookRepository {
    public List<Book> getBooks() {
        List<Book> list = new ArrayList<>();
        Connection connection = MysqlConnection.getConnection();
        String query = "SELECT * FROM books";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Book book = new Book();
                book.setId(resultSet.getInt("id"));
                book.setTitle(resultSet.getString("title"));
                book.setAuthor(resultSet.getString("author"));
                book.setYearPublished(resultSet.getInt("yearPublished"));
                list.add(book);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public Book AddNewBook(Book book) {
        Connection connection = MysqlConnection.getConnection();
        String query = "INSERT INTO books (title, author, yearPublished) VALUES (?, ?, ?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, book.getTitle());
            preparedStatement.setString(2, book.getAuthor());
            preparedStatement.setInt(3, book.getYearPublished());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return book;
    }
}
