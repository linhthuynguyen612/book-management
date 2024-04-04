package com.test.service;

import com.test.model.Book;
import com.test.repository.BookRepository;

import java.util.List;

public class BookService {
    private BookRepository bookRepository;

    public BookService() {
        this.bookRepository = new BookRepository();
    }

    public List<Book> getBooks() {
        return this.bookRepository.getBooks();
    }

    public void addNewBook(Book book) {
        this.bookRepository.AddNewBook(book);
    }
}
