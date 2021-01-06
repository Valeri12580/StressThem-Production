package com.stressthem.app.config;

import com.stressthem.app.domain.models.binding.AttackBindingModel;
import com.stressthem.app.domain.models.service.AttackServiceModel;
import com.stressthem.app.domain.models.service.MethodServiceModel;
import com.stressthem.app.domain.models.service.UserServiceModel;
import com.stressthem.app.domain.models.view.ProfileEditViewModel;
import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.net.http.HttpClient;

@Configuration
public class ApplicationBeanConfiguration {


    @Bean
    public ModelMapper modelMapper() {
        ModelMapper mapper = new ModelMapper();

        PropertyMap<UserServiceModel, ProfileEditViewModel> editMap = new PropertyMap<>() {
            @Override
            protected void configure() {

                map().getPasswordWrapper().setPassword(source.getPassword());
                map().getPasswordWrapper().setConfirmPassword(source.getPassword());
            }
        };



        PropertyMap<AttackBindingModel, AttackServiceModel> editAttack = new PropertyMap<AttackBindingModel, AttackServiceModel>() {
            @Override
            protected void configure() {

                map().getMethod().setName(source.getMethod());
            }
        };


//        PropertyMap<AttackServiceModel, AttackViewModel>myMap=new PropertyMap<AttackServiceModel, AttackViewModel>() {
//            @Override
//            protected void configure() {
//                DateTimeFormatter formatter=DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
//                map().setExpiresOn(source.getExpiresOn().format(formatter));
//                map().setStatus(source.getExpiresOn().isBefore(LocalDateTime.now(ZoneId.systemDefault()))?"Active":"Inactive");
//            }
//
//
//
//        };

        mapper.addMappings(editMap);
        mapper.addMappings(editAttack);


        return mapper;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public HttpClient httpClient() {
        return HttpClient.newBuilder().build();
    }


}
