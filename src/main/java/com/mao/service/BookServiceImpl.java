package com.mao.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mao.dao.BookMapper;
import com.mao.pojo.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private BookMapper bookMapper;

    @Override
    public int addBook(Book book) {
        return bookMapper.addBook(book);
    }

    @Override
    public int deleteBook(int bookID) {
        return bookMapper.deleteBook(bookID);
    }

    @Override
    public int updateBook(Book book) {
        return bookMapper.updateBook(book);
    }

    @Override
    public List<Book> queryBook(Map map) {
        return bookMapper.queryBook(map);
    }

    @Override
    public PageInfo getAllBook(int page, int pageSize) {
        PageHelper.startPage(page, pageSize);
        Map map = new HashMap();
        List bookList = bookMapper.queryBook(map);
        PageInfo pageInfo = new PageInfo(bookList);
        return pageInfo;
    }
}
