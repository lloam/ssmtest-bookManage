<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/3/13
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改书籍内容</title>
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改书籍</small>
                </h1>
            </div>
        </div>
    </div>
    <form action="/book/updateBook" method="post">
        <div class="form-group">
            <input type="text" name="bookID" value="${book.getBookID()}" hidden>
            <label for="bkname">书籍名称</label>
            <input type="text" class="form-control" id="bkname" name="bookName" value="${book.getBookName()}" required>
        </div>
        <div class="form-group">
            <label for="bkcounts">书籍数量</label>
            <input type="text" class="form-control" id="bkcounts" name="bookCounts" value="${book.getBookCounts()}" required>
        </div>
        <div class="form-group">
            <label for="bkdetail">书籍描述</label>
            <input type="text" class="form-control" id="bkdetail" name="detail" value="${book.getDetail()}" required>
        </div>
        <button type="submit" class="btn btn-default">修改</button>
    </form>
</div>
</body>
</html>
