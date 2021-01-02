package com.stressthem.app.initialization;

import com.stressthem.app.services.interfaces.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Order(value = 5)
@Component
public class PaymentInitialization implements CommandLineRunner  {

    private PlanService planService;
    private PaymentService paymentService;

    @Autowired
    public PaymentInitialization(PlanService planService, PaymentService paymentService) {
        this.planService = planService;
        this.paymentService = paymentService;
    }

    @Override
    public void run(String... args) throws Exception {
        String planId = this.planService.findPlanByType("LIFETIME").getId();
        paymentService.purchasePlan(planId,"valeri12580","basictest2");
    }
}
