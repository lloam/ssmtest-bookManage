<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/3/13
  Time: 17:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍列表</title>
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>书籍列表 —— 显示所有书籍</small>
                </h1>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="/book/toAddBook">新增书籍</a>
            <a class="btn btn-primary" href="/book/allBook">显示全部书籍</a>
        </div>
        <%--查询书籍--%>
        <div class="col-md-8 column">
            <form action="/book/queryBook" method="post" style="float: right">
                <span style="color: #ff0000;font-weight: bold">${error}</span>
                <input type="text" name="bookName" placeholder="请输入要查询的书籍名称">
                <input type="submit" class="btn btn-primary" value="查询">
            </form>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th>书籍编号</th>
                        <th>书籍名称</th>
                        <th>书籍数目</th>
                        <th>书籍详情</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="book" items="${pageInfo.list}">
                        <tr>
                        <td>${book.getBookID()}</td>
                        <td>${book.getBookName()}</td>
                        <td>${book.getBookCounts()}</td>
                        <td>${book.getDetail()}</td>
                            <td><a href="/book/toUpdateBook?bookID=${book.getBookID()}">更改</a>
                                &nbsp;|&nbsp;
                                <a href="/book/deleteBook?bookID=${book.getBookID()}">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="/book/allBook?page=${pageInfo.prePage}" aria-label="Previous" class="${pageInfo.pageNum==1?'hidden':''}">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="1" var="i" end="${pageInfo.pages}" step="1">
                        <li><a href="/book/allBook?page=${i}">${i}</a></li>
                    </c:forEach>
                    <li>
                        <a href="/book/allBook?page=${pageInfo.nextPage}" aria-label="Next" class="${pageInfo.pageNum==pageInfo.pages?'hidden':''}">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
            <p class="text-muted html-editor-align-center">当前是第${pageInfo.pageNum}页，共${pageInfo.pages}页，每页${pageInfo.pageSize}条，共${pageInfo.total}条记录</p>
        </div>
    </div>
</div>
</body>
</html>
