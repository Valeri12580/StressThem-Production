package com.stressthem.app.exceptions;

public class PaymentCodeNotFound extends RuntimeException {
    public PaymentCodeNotFound(String message) {
        super(message);
    }
}
