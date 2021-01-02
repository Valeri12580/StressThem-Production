package com.stressthem.app.validation;

import com.stressthem.app.exceptions.EmailNotFoundException;
import com.stressthem.app.services.interfaces.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;


@Component
public class UniqueUserValidator implements ConstraintValidator<UniqueUser,String> {
    private UserService userService;
    private String type;


    @Autowired
    public UniqueUserValidator(UserService userService) {
        this.userService = userService;
    }


    @Override
    public void initialize(UniqueUser constraintAnnotation) {
        this.type=constraintAnnotation.fieldType();
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        boolean result;
       if(type.equals("email")){
           try {
               this.userService.getUserByEmail(value);
           }catch (EmailNotFoundException ex){
               return true;
           }

           return  false;
       }

       try {
           this.userService.getUserByUsername(value);
       }catch (UsernameNotFoundException ex){
           return true;
       }

        return false;
    }
}
