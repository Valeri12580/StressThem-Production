package com.stressthem.app.services;

import com.stressthem.app.repositories.PaymentCodeRepository;
import com.stressthem.app.services.interfaces.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentServiceImpl  implements PaymentService {


    private PaymentCodeRepository paymentCodeRepository;

    @Autowired
    public PaymentServiceImpl(PaymentCodeRepository paymentCodeRepository) {
        this.paymentCodeRepository = paymentCodeRepository;
    }

    @Override
    public void saveCode(String code, String username) {

    }
}
