package com.stressthem.app.exceptions;

public class TicketNotFoundException extends RuntimeException{
    public TicketNotFoundException(String msg) {
        super(msg);
    }
}
