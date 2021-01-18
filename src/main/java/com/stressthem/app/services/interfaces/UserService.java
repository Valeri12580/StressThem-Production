package com.stressthem.app.services.interfaces;

import com.stressthem.app.domain.models.service.UserActivePlanServiceModel;
import com.stressthem.app.domain.models.service.UserServiceModel;

import java.util.List;

public interface UserService {

    UserActivePlanServiceModel getActivePlan(String username);

    UserServiceModel register(UserServiceModel userServiceModel);

    UserServiceModel findUserById(String id);

    UserServiceModel getUserByUsername(String username);
    UserServiceModel getUserByEmail(String email);



    boolean hasUserActivePlan(String username);



    int getUserAvailableAttacks(String username);

    UserServiceModel updateUser(String username, UserServiceModel userServiceModel);

    void changeUserRole(String username, String roleName,String type, String administrator);

    List<UserServiceModel>getAllUsers();

    void disableUser(String username);



    void validateUsers(String username, UserServiceModel modified);

    void sendConfirmationEmail(String username);

    boolean confirmConfirmationCode(String code,String username);


}
