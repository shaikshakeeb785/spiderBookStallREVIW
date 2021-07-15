package com.spiderBookStall.CustomerDto;


import javax.validation.constraints.NotBlank;

public class Order {
    private String userId;
    private int oderId;
    private String productID;
    @NotBlank(message = "check box is empty")
    private String paymentMethod;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getOderId() {
        return oderId;
    }

    public void setOderId(int oderId) {
        this.oderId = oderId;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    @Override
    public String toString() {
        return "order{" +
                "userId='" + userId + '\'' +
                ", oderId=" + oderId +
                ", productID='" + productID + '\'' +
                ", paymentMethod='" + paymentMethod + '\'' +
                '}';
    }
}
