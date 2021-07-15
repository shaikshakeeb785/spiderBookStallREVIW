package com.spiderBookStall.CustomerDto;

import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.*;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Book {
    @XmlElement
    private String bookId;
    @XmlElement
    @NotBlank(message = "*should not blank")
    private String bookName;
    @XmlElement
    @NotBlank(message = "*should not blank")
    private String bookAuthor;
    @XmlElement
    @Range(min = 50, max = 2500, message = "Price must be between 50 and 2500")
    private String bookPrice;
    @XmlElement
    @NotBlank(message = "*should not blank")
    private String bookPublishDate;
    @XmlElement
    @NotBlank(message = "*should not blank")
    private String sellerName;
    @XmlElement
    @NotBlank(message = "*should not blank")
    private String publication;

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public String getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(String bookPrice) {
        this.bookPrice = bookPrice;
    }

    public String getBookPublishDate() {
        return bookPublishDate;
    }

    public void setBookPublishDate(String bookPublishDate) {
        this.bookPublishDate = bookPublishDate;
    }

    public String getSellerName() {
        return sellerName;
    }

    public void setSellerName(String sellerName) {
        this.sellerName = sellerName;
    }

    public String getPublication() {
        return publication;
    }

    public void setPublication(String publication) {
        this.publication = publication;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookId='" + bookId + '\'' +
                ", bookName='" + bookName + '\'' +
                ", bookAuthor='" + bookAuthor + '\'' +
                ", bookPrice='" + bookPrice + '\'' +
                ", bookPublishDate='" + bookPublishDate + '\'' +
                ", sellerName='" + sellerName + '\'' +
                ", publication='" + publication + '\'' +
                '}';
    }
}
