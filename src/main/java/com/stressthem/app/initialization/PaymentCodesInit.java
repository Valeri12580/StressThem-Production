package com.stressthem.app.initialization;

import com.stressthem.app.domain.entities.PaymentCode;
import com.stressthem.app.domain.entities.Plan;
import com.stressthem.app.domain.entities.User;
import com.stressthem.app.repositories.PaymentCodeRepository;
import com.stressthem.app.repositories.PlanRepository;
import com.stressthem.app.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import java.util.*;

@Component
@Order(value = 4)
public class PaymentCodesInit implements CommandLineRunner {
    private PaymentCodeRepository paymentCodeRepository;
    private PlanRepository planRepository;
    private UserRepository userRepository;

    @Autowired
    public PaymentCodesInit(PaymentCodeRepository paymentCodeRepository, PlanRepository planRepository, UserRepository userRepository) {
        this.paymentCodeRepository = paymentCodeRepository;
        this.planRepository = planRepository;
        this.userRepository = userRepository;
    }

    @Override
    public void run(String... args) throws Exception {
        User user=this.userRepository.findUserByUsername("valeri12580").get();
        Plan plan=this.planRepository.findByType("BASIC").get();
        PaymentCode paymentCodeOne=new PaymentCode("basictest1",plan,user,false);
        PaymentCode paymentCodeTwo=new PaymentCode("basictest2",plan,user,false);

        paymentCodeRepository.saveAll(List.of(paymentCodeOne,paymentCodeTwo));
    }
}
