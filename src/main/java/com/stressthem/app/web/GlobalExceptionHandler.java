package com.stressthem.app.web;

import com.stressthem.app.web.annotations.PageTitle;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;

@ControllerAdvice
public class GlobalExceptionHandler {

    private Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);


    @ExceptionHandler(Throwable.class)
    @PageTitle("Oops...")
    public ModelAndView handle(Throwable ex, HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView("error");

        modelAndView.addObject("message", ex.getMessage());
        //todo fix this
        logger.error("error",ex);
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        return modelAndView;
    }
}
