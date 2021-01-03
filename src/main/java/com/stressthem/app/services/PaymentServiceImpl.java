package com.stressthem.app.services;

import com.stressthem.app.domain.entities.PaymentCode;
import com.stressthem.app.domain.entities.Plan;
import com.stressthem.app.domain.entities.User;
import com.stressthem.app.domain.entities.UserActivePlan;
import com.stressthem.app.domain.models.service.PaymentCodeServiceModel;
import com.stressthem.app.domain.models.service.PlanServiceModel;
import com.stressthem.app.domain.models.service.TransactionServiceModel;
import com.stressthem.app.domain.models.service.UserServiceModel;
import com.stressthem.app.exceptions.PaymentCodeNotFound;
import com.stressthem.app.exceptions.UserPlanActivationException;
import com.stressthem.app.repositories.PaymentCodeRepository;
import com.stressthem.app.services.interfaces.*;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityExistsException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Optional;

@Service
public class PaymentServiceImpl implements PaymentService {

    private PaymentCodeRepository paymentCodeRepository;
    private UserService userService;
    private PlanService planService;
    private ModelMapper modelMapper;
    private UserActivePlanService userActivePlanService;
    private TransactionService transactionService;

    @Autowired
    public PaymentServiceImpl(PaymentCodeRepository paymentCodeRepository, UserService userService, PlanService planService, ModelMapper modelMapper, UserActivePlanService userActivePlanService, TransactionService transactionService) {
        this.paymentCodeRepository = paymentCodeRepository;
        this.userService = userService;
        this.planService = planService;
        this.modelMapper = modelMapper;
        this.userActivePlanService = userActivePlanService;
        this.transactionService = transactionService;
    }

    @Override
    public void saveCode(String code, String planName, String username) {
        if (!paymentCodeRepository.findByCode(code).isEmpty()) {
            throw new EntityExistsException("The code already exists!");
        }
        UserServiceModel user = this.userService.getUserByUsername(username);
        PlanServiceModel plan = this.planService.findPlanByType(planName);
        PaymentCodeServiceModel paymentCode = new PaymentCodeServiceModel(code, plan, user,false);
        paymentCodeRepository.save(this.modelMapper.map(paymentCode, PaymentCode.class));
    }

    public PaymentCodeServiceModel findPaymentCode(String code) {
        PaymentCode paymentCode = this.paymentCodeRepository.findByCode(code).orElse(null);

        return paymentCode == null ? null : this.modelMapper.map(paymentCode, PaymentCodeServiceModel.class);
    }

    @Override
    public void purchasePlan(String id, String username, String paymentCode) {

        User user = this.modelMapper.map(userService.getUserByUsername(username),User.class);

        Plan plan = this.modelMapper.map(this.planService.getPlanById(id), Plan.class);

        PaymentCodeServiceModel paymentCodeServiceModel=this.findPaymentCode(paymentCode);




        if(paymentCodeServiceModel==null || paymentCodeServiceModel.isUsed() || !paymentCodeServiceModel.getPlan().getId().equals(plan.getId())){
            throw new PaymentCodeNotFound("The code is not valid");
        }

        if(user.getUserActivePlan()!=null){
            this.userActivePlanService.removeActivePlan(user.getUserActivePlan().getId());
        }

        UserActivePlan userActivePlan = new UserActivePlan(plan,user, plan.getDurationInDays(), plan.getMaxBootsPerDay(),
                LocalDateTime.now(ZoneId.systemDefault()));

            //todo query did not return a unique result: 2; nested exception is javax.persistence.NonUniqueResultException: query did not return a unique result: 2
        this.userActivePlanService.saveActivatedPlan(userActivePlan);
        this.transactionService.saveTransaction(new TransactionServiceModel(user, plan, paymentCodeServiceModel , LocalDateTime.now(ZoneId.systemDefault())));
        this.changePaymentCodeStatus(paymentCode,true);

    }

    @Override
    public void changePaymentCodeStatus(String code, boolean isUsed) {
        PaymentCode paymentCode = this.paymentCodeRepository.findByCode(code).orElse(null);
        paymentCode.setUsed(isUsed);
        this.paymentCodeRepository.save(paymentCode);
    }
}
