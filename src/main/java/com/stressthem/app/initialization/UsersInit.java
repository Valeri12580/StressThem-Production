package com.stressthem.app.initialization;

import com.stressthem.app.domain.entities.User;
import com.stressthem.app.repositories.UserRepository;
import com.stressthem.app.services.interfaces.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.HashSet;
import java.util.List;
import java.util.stream.Collectors;

@Component
@Order(value = 2)
public class UsersInit implements CommandLineRunner {

    private UserRepository userRepository;

    private PasswordEncoder passwordEncoder;

    private RoleService roleService;

    @Autowired
    public UsersInit(UserRepository userRepository, PasswordEncoder passwordEncoder, RoleService roleService) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.roleService = roleService;
    }

    @Override
    public void run(String... args) throws Exception {

        if (this.userRepository.count() == 0) {

            User pride = new User("Pride", passwordEncoder.encode("h7r31331"), "pride@gmail.com",
                    "https://i.ytimg.com/vi/WhIrvsbEJ6Q/maxresdefault.jpg",
                    LocalDateTime.now(ZoneId.systemDefault()), null,
                    new HashSet<>(this.roleService.getAllRoles().stream().filter(e -> !e.getName().equals("UNCONFIRMED")).collect(Collectors.toSet())),
                    null, null, null, null, null, null, null);

            User google = new User("Google", passwordEncoder.encode("IhaveaTree123"), "google@gmail.com",
                    "https://i.pinimg.com/564x/f8/a1/e9/f8a1e948ae5109629e4dd84c2ce1cf55.jpg",
                    LocalDateTime.now(ZoneId.systemDefault()), null,
                    new HashSet<>(this.roleService.getAllRoles().stream().filter(e -> !e.getName().equals("UNCONFIRMED")).collect(Collectors.toSet())),
                    null, null, null, null, null, null, null);
            User normal = new User("normal", passwordEncoder.encode("12345678"), "normal@gmail.com",
                    "",
                    LocalDateTime.now(ZoneId.systemDefault()), null,
                    new HashSet<>(this.roleService.getAllRoles().stream().filter(e -> e.getName().equals("USER")).collect(Collectors.toSet())),
                    null, null, null, null, null, null, null);
            userRepository.saveAll(List.of(pride, google, normal));

        }


    }
}
