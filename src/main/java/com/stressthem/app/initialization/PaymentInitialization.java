package com.stressthem.app.initialization;

import com.stressthem.app.domain.entities.Plan;
import com.stressthem.app.domain.entities.Transaction;
import com.stressthem.app.domain.entities.User;
import com.stressthem.app.domain.entities.UserActivePlan;
import com.stressthem.app.repositories.PlanRepository;
import com.stressthem.app.repositories.TransactionRepository;
import com.stressthem.app.repositories.UserActivePlanRepository;
import com.stressthem.app.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.ZoneId;

@Order(value = 5)
@Component
public class PaymentInitialization implements CommandLineRunner {

    private PlanRepository planRepository;
    private UserRepository userRepository;
    private TransactionRepository transactionRepository;
    private UserActivePlanRepository userActivePlanRepository;

    @Autowired
    public PaymentInitialization(PlanRepository planRepository, UserRepository userRepository, TransactionRepository transactionRepository, UserActivePlanRepository userActivePlanRepository) {
        this.planRepository = planRepository;
        this.userRepository = userRepository;
        this.transactionRepository = transactionRepository;
        this.userActivePlanRepository = userActivePlanRepository;
    }


    @Override
    public void run(String... args) throws Exception {
        User user=userRepository.findUserByUsername("valeri12580").get();
        Plan plan=planRepository.findByType("LIFETIME").get();
        UserActivePlan userActivePlan = new UserActivePlan(plan, plan.getDurationInDays(), plan.getMaxBootsPerDay(),
                LocalDateTime.now());
        userActivePlan.setUser(user);

        userActivePlanRepository.save(userActivePlan);
        transactionRepository.save(new Transaction(user,plan,null,LocalDateTime.now()));

    }
}