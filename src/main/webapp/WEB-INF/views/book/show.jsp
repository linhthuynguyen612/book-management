<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.List" %>
<%@ page import="com.test.model.Book" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Book</title>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body class="sb-nav-fixed">
<div id="layoutSidenav">

    <div id="layoutSidenav_content">
        <main class="overflow-auto">
            <div class="container-fluid px-4 w-75">
                <div class="mt-5">
                    <div class="row">
                        <div class="col-12 mx-auto">
                            <div class="d-flex justify-content-between">
                                <h2>
                                    Danh sách sách
                                </h2>
                                <a href="http://localhost:8080/test_war_exploded/add-new-book" class="btn btn-primary">Thêm mới sách</a>
                            </div>

                            <hr>
                            <%-- desgin this table more vibrant and beautiful--%>
                            <table class="table table-striped table-hover table-responsive-md">
                                <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Tên sách</th>
                                    <th scope="col">Tác Giả</th>
                                    <th scope="col">Năm xuất bản</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <% List<Book> list = (List<Book>) request.getAttribute("books"); %>

                                    <% for(Book book:list) { %>
                                        <tr>
                                            <td><%=book.getId()%></td>
                                            <td><%=book.getTitle()%></td>
                                            <td><%=book.getAuthor()%></td>
                                            <td><%=book.getYearPublished()%></td>
                                        </tr>
                                    <% } %>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
</body>
</html>
