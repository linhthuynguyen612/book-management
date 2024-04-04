<%--
  Created by IntelliJ IDEA.
  User: cuong
  Date: 4/4/2024
  Time: 3:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        html{
            font-size: 20px;
        }
    </style>
</head>
<body class="sb-nav-fixed">
<div id="layoutSidenav">

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <div class="container container-xl mt-5">
                    <div class="row">
                        <div class="col-md-6 col-12 mb-3 col-12 mx-auto">
                            <h2>
                                Thêm mới sách
                            </h2>
                            <hr>
                            <form class="row g-3 border border-black rounded px-3" method="post" action="http://localhost:8080/test_war_exploded/add-new-book">
                                <div class="col-12 mb-3">
                                    <label class="form-label">Tên sách:</label>
                                    <input type="text" class="form-control"
                                                name="title"
                                    />

                                </div>
                                <div class="col-12 mb-3">
                                    <label class="form-label">Tên tác giả:</label>
                                    <input type="text" class="form-control"
                                                name="author"
                                    />
                                </div>
                                <div class="col-12 mb-3">
                                    <label class="form-label">Năm xuất bản:</label>
                                    <input type="text" class="form-control"
                                                name="yearPublished"
                                    />
                                </div>

                                <div class="col-12 mb-5">
                                    <button type="submit" class="btn btn-primary">Thêm mới</button>
                                </div>
                            </form>
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
