package com.stressthem.app.services;

import com.stressthem.app.domain.entities.*;
import com.stressthem.app.domain.models.service.UserActivePlanServiceModel;
import com.stressthem.app.domain.models.service.UserServiceModel;
import com.stressthem.app.exceptions.*;
import com.stressthem.app.repositories.PaymentCodeRepository;
import com.stressthem.app.repositories.PlanRepository;
import com.stressthem.app.repositories.TransactionRepository;
import com.stressthem.app.repositories.UserRepository;
import com.stressthem.app.services.interfaces.*;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService, UserDetailsService {

    private RoleService roleService;
    private PlanService planService;
    private UserRepository userRepository;
    private TransactionService transactionService;
    private CryptocurrencyService cryptocurrencyService;
    private ModelMapper modelMapper;
    private PasswordEncoder passwordEncoder;
    private UserActivePlanService userActivePlanService;
    private ConfirmationService confirmationService;
    private PaymentService paymentService;
    private PlanRepository planRepository;
    private PaymentCodeRepository paymentCodeRepository;
    private TransactionRepository transactionRepository;

    @Autowired
    public UserServiceImpl(RoleService roleService, @Lazy PlanService planService, UserRepository userRepository, TransactionService transactionService, CryptocurrencyService cryptocurrencyService, ModelMapper modelMapper, PasswordEncoder passwordEncoder, UserActivePlanService userActivePlanService, ConfirmationService confirmationService, @Lazy PaymentService paymentService, PlanRepository planRepository, PaymentCodeRepository paymentCodeRepository, TransactionRepository transactionRepository) {
        this.roleService = roleService;
        this.planService = planService;
        this.userRepository = userRepository;
        this.transactionService = transactionService;
        this.cryptocurrencyService = cryptocurrencyService;
        this.modelMapper = modelMapper;
        this.passwordEncoder = passwordEncoder;
        this.userActivePlanService = userActivePlanService;
        this.confirmationService = confirmationService;
        this.paymentService = paymentService;
        this.planRepository = planRepository;
        this.paymentCodeRepository = paymentCodeRepository;
        this.transactionRepository = transactionRepository;
    }

    @Override
    public UserActivePlanServiceModel getActivePlan(String username) {
        UserActivePlan plan = this.userRepository.findUserByUsername(username).orElseThrow(() -> new UsernameNotFoundException("User not found")
        ).getUserActivePlan();
        if (plan != null) {
            return this.modelMapper.map(plan, UserActivePlanServiceModel.class);
        }
        return null;


    }

    @Override
    public UserServiceModel register(UserServiceModel userServiceModel) {
        User user = this.modelMapper.map(userServiceModel, User.class);
        this.setRegistrationDetails(user);

        this.userRepository.save(user);
        this.purchaseFreePlan(user);
        return this.modelMapper.map(user, UserServiceModel.class);
    }
    private void setRegistrationDetails(User user){
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRoles(Set.of(this.roleService.getRoleByName("USER")));
        user.setRegisteredOn(LocalDateTime.now(ZoneId.systemDefault()));

    }

    private void purchaseFreePlan(User user){
        Plan plan = this.modelMapper.map(planService.findPlanByType("FREE"), Plan.class);
        UserActivePlan userActivePlan = new UserActivePlan(plan,user, plan.getDurationInDays(), plan.getMaxBootsPerDay(),
                LocalDateTime.now(ZoneId.systemDefault()));


        this.userActivePlanService.saveActivatedPlan(userActivePlan);

    }

    @Override
    public UserServiceModel findUserById(String id) {
        //todo vsichki trqbva da stanat kato tova
        User user = this.userRepository.findById(id).orElseThrow(() -> new UsernameNotFoundException("User not found"));
        return this.modelMapper.map(user, UserServiceModel.class);
    }

    @Override
    public UserServiceModel getUserByEmail(String email) {
        User user = this.userRepository.findUserByEmail(email).orElseThrow(()->new EmailNotFoundException("Email not found"));

        return this.modelMapper.map(user, UserServiceModel.class);
    }



    @Override
    public boolean hasUserActivePlan(String username) {

        return this.userRepository.findUserByUsername(username).
                orElseThrow(() -> new UsernameNotFoundException("User not found"))
                .getUserActivePlan() != null;
    }


    @Override
    public int getUserAvailableAttacks(String username) {
        User user = this.userRepository.findUserByUsername(username).orElseThrow(() -> new UsernameNotFoundException("User not found"));
        if (user.getUserActivePlan() == null) {
            return 0;
        }
        return user.getUserActivePlan().getLeftAttacksForTheDay();
    }

    @Override
    public UserServiceModel updateUser(String username, UserServiceModel userServiceModel) {
        User user = this.userRepository.findUserByUsername(username).orElseThrow(() -> new UsernameNotFoundException("User  not found"));

        modifyUser(userServiceModel, user);

        this.userRepository.save(user);
        return this.modelMapper.map(user, UserServiceModel.class);
    }

    public void validateUsers(String oldUsername, UserServiceModel modified) {
        User main = this.userRepository.findUserByUsername(oldUsername).orElseThrow(() -> new UsernameNotFoundException("User  not found"));

        User userWithEmail = userRepository.findUserByEmail(modified.getEmail()).orElse(null);
        User userWithUsername = userRepository.findUserByUsername(modified.getUsername()).orElse(null);

        if (userWithEmail != null && !userWithEmail.getId().equals(main.getId())) {
            throw new DuplicatedEmailException("User with this email already exists");
        }

        if (userWithUsername != null && !userWithUsername.getId().equals(main.getId())) {
            throw new DuplicatedUsernameException("User with this name already exists");
        }
    }

    @Override
    public void sendConfirmationEmail(String username) {
        String email = userRepository.findUserByUsername(username).orElseThrow(() -> new UsernameNotFoundException("User not found")).getEmail();

        String code = confirmationService.sendConfirmationEmail(email);


    }

    @Override
    public boolean confirmConfirmationCode(String code, String username) {
        boolean isConfirmed = confirmationService.confirmConfirmationCode(code);
        if (isConfirmed) {
            userRepository.findUserByUsername(username).orElseThrow(() -> new UsernameNotFoundException("User not found"))
                    .setRoles(Set.of(roleService.getRoleByName("USER")));
        }
        return isConfirmed;
    }

    private void modifyUser(UserServiceModel modified, User main) {


        main.setUsername(modified.getUsername());
        main.setEmail(modified.getEmail());
        main.setImageUrl(modified.getImageUrl());
        main.setPassword(passwordEncoder.encode(modified.getPassword()));

    }

    @Override
    public void changeUserRole(String username, String roleName, String type, String administrator) {
        User user = this.userRepository.findUserByUsername(username).orElseThrow(() -> new UsernameNotFoundException("User not found"));
        Role role = this.roleService.getRoleByName(roleName);

        if (administrator.equals(username)) {
            throw new ChangeRoleException("You can only change other user roles");
        }

        if (type.equals("Add")) {
            if (user.getRoles().contains(role)) {
                throw new ChangeRoleException("This user already have that role");
            }

            user.getRoles().add(role);

        } else if (type.equals("Remove")) {
            if (!user.getRoles().contains(role)) {
                throw new ChangeRoleException("This user doesn't have that role");
            }

            user.getRoles().remove(role);
        }

        this.userRepository.save(user);


    }

    @Override
    public List<UserServiceModel> getAllUsers() {
        return List.of(this.modelMapper.map(this.userRepository.findAll(), UserServiceModel[].class));
    }

    @Override
    public void disableUser(String username) {
        User user = userRepository.findUserByUsername(username).get();
        user.setEnabled(false);

        this.userRepository.save(user);
    }






    @Override
    public UserServiceModel getUserByUsername(String username) {
        User user = this.userRepository.findUserByUsername(username).orElseThrow(() -> new UsernameNotFoundException("User doesnt exist"));

        return this.modelMapper.map(user, UserServiceModel.class);
    }

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        User user = this.userRepository.findUserByUsername(s).orElseThrow(() -> new UsernameNotFoundException("User not found"));
        return user;
    }


}
