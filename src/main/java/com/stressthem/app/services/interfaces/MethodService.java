package com.stressthem.app.services.interfaces;

import com.stressthem.app.domain.models.service.MethodServiceModel;

public interface MethodService {


    void saveMethod(MethodServiceModel methodServiceModel);


    MethodServiceModel findMethodByName(String name);
}
