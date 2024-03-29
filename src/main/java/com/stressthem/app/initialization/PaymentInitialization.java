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

@Order(value = 6)
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
        if (userActivePlanRepository.count() == 0) {
           saveUser("Admin","LIFETIME");
           saveUser("user","LIFETIME");
           saveUser("Normal","FREE");

        }

    }

    private void saveUser(String username,String planName){
        User user = userRepository.findUserByUsername(username).get();
        Plan plan = planRepository.findByType(planName).get();

        UserActivePlan userActivePlan = new UserActivePlan(plan, user, plan.getDurationInDays(), plan.getMaxBootsPerDay(),
                LocalDateTime.now());
        userActivePlan.setUser(user);

        userActivePlanRepository.save(userActivePlan);
        transactionRepository.save(new Transaction(user, plan, null, LocalDateTime.now()));
    }

  
}
