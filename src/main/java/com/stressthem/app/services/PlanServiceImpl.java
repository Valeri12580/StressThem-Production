package com.stressthem.app.services;

import com.stressthem.app.domain.entities.Plan;
import com.stressthem.app.domain.models.service.MethodServiceModel;
import com.stressthem.app.domain.models.service.PlanServiceModel;
import com.stressthem.app.domain.models.service.UserServiceModel;
import com.stressthem.app.exceptions.PlanNotFoundException;
import com.stressthem.app.repositories.PlanRepository;
import com.stressthem.app.services.interfaces.MethodService;
import com.stressthem.app.services.interfaces.PlanService;
import com.stressthem.app.services.interfaces.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class PlanServiceImpl implements PlanService {
    private ModelMapper modelMapper;
    private PlanRepository planRepository;
    private UserService userService;
    private MethodService methodService;

    @Autowired
    public PlanServiceImpl(ModelMapper modelMapper, PlanRepository planRepository, UserService userService, @Lazy MethodService methodService) {
        this.modelMapper = modelMapper;
        this.planRepository = planRepository;
        this.userService = userService;
        this.methodService = methodService;
    }

    @Override
    public PlanServiceModel register(PlanServiceModel planServiceModel,List<String>methods, String username) {

        List<MethodServiceModel> methodServiceModels = methods.stream().map(m -> this.methodService.findMethodByName(m)).collect(Collectors.toList());
        UserServiceModel author = this.userService.getUserByUsername(username);

        planServiceModel.setAuthor(author);
        planServiceModel.setMethods(methodServiceModels);

        Plan plan = this.modelMapper.map(planServiceModel, Plan.class);

        plan.setCreatedOn(LocalDateTime.now(ZoneId.systemDefault()));

        planRepository.save(plan);

        return this.modelMapper.map(plan, PlanServiceModel.class);
    }

    @Override
    public List<PlanServiceModel> getAllPlans() {
        return Arrays.stream(this.modelMapper.map(this.planRepository.findAll(), PlanServiceModel[].class))
                .sorted(Comparator.comparing(PlanServiceModel::getPrice)).collect(Collectors.toList());

    }

    @Override
    public PlanServiceModel getPlanById(String id) {
        return this.modelMapper.map(this.planRepository.findById(id)
                .orElseThrow(() -> new PlanNotFoundException("The plan is not available")), PlanServiceModel.class);
    }

    @Override
    public void deletePlanById(String id) {
        this.planRepository.deleteById(id);
    }

    @Override
    public PlanServiceModel findPlanByType(String type) {
        Plan plan = planRepository.findByType(type).orElseThrow(() -> new PlanNotFoundException("The plan doesnt exist!"));

        return this.modelMapper.map(plan,PlanServiceModel.class);
    }


    @Override
    public void saveMethodForPlans(List<String> plans, MethodServiceModel methodServiceModel) {
        List<PlanServiceModel> plansServiceModel =plans.stream().map(this::findPlanByType)
               .collect(Collectors.toList());
        plansServiceModel.forEach(p->p.addMethod(methodServiceModel));;

        this.planRepository.saveAll(List.of(this.modelMapper.map(plansServiceModel,Plan[].class)));

    }

    @Override
    public List<PlanServiceModel> findAllPlansByAuthorId(String authorId) {


        return List.of(this.modelMapper.map(this.planRepository.findAllByAuthor_Id(authorId),PlanServiceModel[].class));
    }
}
