package com.mao.dao;

import com.mao.pojo.Book;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import java.util.Map;

public interface BookMapper {

    //增加一本书
    int addBook(Book book);

    //删除一本书
    int deleteBook(@Param("bookID")int bookID);

    //更新一本书
    int updateBook(Book book);

    //查询书籍(包括根据bookID查询书籍，根据bookName查询书籍，查询全部书籍)
    List<Book> queryBook(Map map);


}
