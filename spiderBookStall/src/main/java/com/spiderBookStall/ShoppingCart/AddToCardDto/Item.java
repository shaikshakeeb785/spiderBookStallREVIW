package com.spiderBookStall.ShoppingCart.AddToCardDto;

import com.spiderBookStall.CustomerDto.Book;

public class Item {

    private Book book;
    private int quantity;

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Item{" +
                "book=" + book +
                ", quantity=" + quantity +
                '}';
    }
}
