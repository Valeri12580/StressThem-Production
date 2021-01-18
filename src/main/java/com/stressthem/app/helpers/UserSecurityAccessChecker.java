package com.stressthem.app.helpers;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;


@Component("userSecurityAccessChecker")
public class UserSecurityAccessChecker {

    public boolean canAccessByUsername(Authentication authentication, String username) {

        String currentUser = authentication.getName();

        return currentUser.equals(username);
    }


}
