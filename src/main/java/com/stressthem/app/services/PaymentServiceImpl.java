package com.stressthem.app.services;

import com.stressthem.app.domain.entities.PaymentCode;
import com.stressthem.app.domain.entities.User;
import com.stressthem.app.domain.models.service.UserServiceModel;
import com.stressthem.app.repositories.PaymentCodeRepository;
import com.stressthem.app.services.interfaces.PaymentService;
import com.stressthem.app.services.interfaces.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityExistsException;

@Service
public class PaymentServiceImpl  implements PaymentService {


    private PaymentCodeRepository paymentCodeRepository;
    private UserService userService;
    private  ModelMapper modelMapper;

    @Autowired
    public PaymentServiceImpl(PaymentCodeRepository paymentCodeRepository, UserService userService, ModelMapper modelMapper) {
        this.paymentCodeRepository = paymentCodeRepository;
        this.userService = userService;
        this.modelMapper = modelMapper;
    }

    @Override
    public void saveCode(String code, String username) {
        if(!paymentCodeRepository.findByCode(code).isEmpty()){
            throw new EntityExistsException("The code already exists!");
        }
        UserServiceModel user = this.userService.getUserByUsername(username);
        PaymentCode paymentCode=new PaymentCode(code,this.modelMapper.map(user, User.class));
        paymentCodeRepository.save(paymentCode);
    }
}
