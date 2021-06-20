package com.mao.controller;

import com.github.pagehelper.PageInfo;
import com.mao.pojo.Book;
import com.mao.service.BookService;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;

    @GetMapping("/allBook")
    public String allBook(Integer page, Model model) {
        page = Integer.valueOf(page != null ? page.intValue() : 1);
        PageInfo pageInfo = bookService.getAllBook(page.intValue(), 4);
        model.addAttribute("pageInfo", pageInfo);
        return "allBook";
    }

    @RequestMapping("/toAddBook")
    public String toAddPage()
    {
        return "addBook";
    }

    @PostMapping("/addBook")
    public String addBook(Book book) {
        bookService.addBook(book);
        return "redirect:allBook";
    }

    @GetMapping("/deleteBook")
    public String deleteBook(int bookID) {
        bookService.deleteBook(bookID);
        return "redirect:allBook";
    }

    @GetMapping("/toUpdateBook")
    public String toUpdatePage(int bookID, Model model) {
        Map map = new HashMap();
        map.put("bookID", Integer.valueOf(bookID));
        List books = bookService.queryBook(map);
        Book book = (Book)books.get(0);
        model.addAttribute("book", book);
        return "updateBook";
    }

    @PostMapping("/updateBook")
    public String updateBook(Book book) {
        bookService.updateBook(book);
        return "redirect:allBook";
    }

    @PostMapping("/queryBook")
    public String queryBook(String bookName, Model model) {
        Map map = new HashMap();
        bookName = (new StringBuilder()).append("%").append(bookName).append("%").toString();
        map.put("bookName", bookName);
        List booksList = bookService.queryBook(map);
        model.addAttribute("booksList", booksList);
        return "queryBook";
    }
}
