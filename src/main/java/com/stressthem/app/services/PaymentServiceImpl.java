package com.stressthem.app.services;

import com.stressthem.app.domain.entities.PaymentCode;
import com.stressthem.app.domain.models.service.PaymentCodeServiceModel;
import com.stressthem.app.domain.models.service.PlanServiceModel;
import com.stressthem.app.domain.models.service.UserServiceModel;
import com.stressthem.app.repositories.PaymentCodeRepository;
import com.stressthem.app.services.interfaces.PaymentService;
import com.stressthem.app.services.interfaces.PlanService;
import com.stressthem.app.services.interfaces.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityExistsException;

@Service
public class PaymentServiceImpl implements PaymentService {

    private PaymentCodeRepository paymentCodeRepository;
    private UserService userService;
    private PlanService planService;
    private ModelMapper modelMapper;

    @Autowired
    public PaymentServiceImpl(PaymentCodeRepository paymentCodeRepository, UserService userService, PlanService planService, ModelMapper modelMapper) {
        this.paymentCodeRepository = paymentCodeRepository;
        this.userService = userService;
        this.planService = planService;
        this.modelMapper = modelMapper;
    }

    @Override
    public void saveCode(String code, String planName, String username) {
        if (!paymentCodeRepository.findByCode(code).isEmpty()) {
            throw new EntityExistsException("The code already exists!");
        }
        UserServiceModel user = this.userService.getUserByUsername(username);
        PlanServiceModel plan = this.planService.findPlanByType(planName);
        PaymentCodeServiceModel paymentCode = new PaymentCodeServiceModel(code, plan, user);
        paymentCodeRepository.save(this.modelMapper.map(paymentCode, PaymentCode.class));
    }

    public PaymentCodeServiceModel findPaymentCode(String code) {
        PaymentCode paymentCode = this.paymentCodeRepository.findByCode(code).orElse(null);

        return paymentCode == null ? null : this.modelMapper.map(paymentCode, PaymentCodeServiceModel.class);
    }
}
