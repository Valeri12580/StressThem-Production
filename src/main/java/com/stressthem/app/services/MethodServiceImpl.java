package com.stressthem.app.services;

import com.stressthem.app.domain.entities.Method;
import com.stressthem.app.domain.models.service.MethodServiceModel;
import com.stressthem.app.repositories.MethodRepository;
import com.stressthem.app.services.interfaces.MethodService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityExistsException;

@Service
public class MethodServiceImpl implements MethodService {
    private MethodRepository methodRepository;
    private ModelMapper modelMapper;

    @Autowired
    public MethodServiceImpl(MethodRepository methodRepository, ModelMapper modelMapper) {
        this.methodRepository = methodRepository;
        this.modelMapper = modelMapper;
    }


    @Override
    public void saveMethod(MethodServiceModel methodServiceModel) {
        if(methodRepository.findMethodByName(methodServiceModel.getName()).isPresent()){
            throw new EntityExistsException("Method already exist");
        }
        Method method=this.modelMapper.map(methodServiceModel,Method.class);
        this.methodRepository.save(method);

    }
}
