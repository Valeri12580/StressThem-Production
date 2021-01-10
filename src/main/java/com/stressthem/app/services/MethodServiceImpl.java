package com.stressthem.app.services;

import com.stressthem.app.domain.entities.Method;
import com.stressthem.app.domain.models.service.MethodServiceModel;
import com.stressthem.app.domain.models.service.PlanServiceModel;
import com.stressthem.app.repositories.MethodRepository;
import com.stressthem.app.services.interfaces.MethodService;
import com.stressthem.app.services.interfaces.PlanService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityExistsException;
import java.util.List;
import java.util.stream.Collectors;


@Service
public class MethodServiceImpl implements MethodService {
    private MethodRepository methodRepository;
    private ModelMapper modelMapper;
    private PlanService planService;

    @Autowired
    public MethodServiceImpl(MethodRepository methodRepository, ModelMapper modelMapper, PlanService planService) {
        this.methodRepository = methodRepository;
        this.modelMapper = modelMapper;
        this.planService = planService;
    }


    @Override
    public void saveMethod(MethodServiceModel method, List<String> plans) {


        if (methodRepository.findMethodByName(method.getName()).isPresent()) {
            throw new EntityExistsException("Method already exist");
        }


        Method methodEntity = this.modelMapper.map(method,Method.class);
        this.methodRepository.save(methodEntity);
        method.setId(methodEntity.getId());
        this.planService.saveMethodForPlans(plans,method);

    }

    @Override
    public MethodServiceModel findMethodByName(String name) {

        Method methodByName = this.methodRepository.findMethodByName(name).get();

        return this.modelMapper.map(methodByName, MethodServiceModel.class);
    }
}
