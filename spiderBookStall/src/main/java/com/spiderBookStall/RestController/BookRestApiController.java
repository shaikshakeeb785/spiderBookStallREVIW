package com.spiderBookStall.RestController;

import com.spiderBookStall.CustomerController.CustomerController;
import com.spiderBookStall.CustomerDto.Book;
import com.spiderBookStall.RestService.BookRestApiService;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

@Controller
public class BookRestApiController {
    private static final Logger logger = LogManager.getLogger(CustomerController.class);
    @Autowired
    private BookRestApiService bookRestApiService;

    @RequestMapping("/getBookById")
    public String getBookByID(@RequestParam("bookId") String bookId, Model model) {

        BasicConfigurator.configure();
        logger.info("this getBookByID Method return Book By Using BookId or BookName");
        try {
            Book book = bookRestApiService.getBookById(bookId);
            /*Book book2 = bookRestApiService.getBookById2(bookId);*/
            if (book != null) {
                model.addAttribute("bookObject1", book);
                /*model.addAttribute("bookObject1", book2);*/
                return "getBookByIdPage";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("notFound", "BOOK IS NOT FOUND FOR SEARCHED ID:'" + bookId + "'");
        return "getBookByIdPage";
    }
}
