package com.stressthem.app.services.interfaces;

import com.stressthem.app.domain.models.service.MethodServiceModel;
import java.util.List;
public interface MethodService {


    void saveMethod(MethodServiceModel method,List<String>plans);


    MethodServiceModel findMethodByName(String name);

    List<MethodServiceModel>findAllMethods();
}
