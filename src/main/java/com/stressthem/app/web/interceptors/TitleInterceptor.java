package com.stressthem.app.web.interceptors;

import com.stressthem.app.web.annotations.PageTitle;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Component
public class TitleInterceptor extends HandlerInterceptorAdapter {

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response,
                           Object handler, ModelAndView modelAndView) throws Exception {

        if(modelAndView!=null){
            if(handler instanceof HandlerMethod){
                PageTitle pageTitle=((HandlerMethod)handler).getMethodAnnotation(PageTitle.class);
                if(pageTitle!=null){
                    modelAndView.addObject("title",String.format("%s - Reqest.wtf",pageTitle.value()));
                }
            }
        }


    }
}
