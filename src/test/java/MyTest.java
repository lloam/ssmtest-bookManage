import com.mao.dao.BookMapper;
import com.mao.pojo.Book;
import com.mao.service.BookService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MyTest {

    @Autowired
    BookService bookService;

    @Test
    public void test(){
//
//        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//
////        BookMapper bookService = context.getBean("bookMapper", BookMapper.class);
//        BookService bookService = context.getBean("bookService", BookService.class);
        Map map = new HashMap<>();
        List<Book> books = bookService.queryBook(map);

        for (Book book : books) {
            System.out.println(book);
        }
    }

}
