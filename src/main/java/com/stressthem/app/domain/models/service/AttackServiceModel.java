package com.stressthem.app.domain.models.service;

import com.stressthem.app.domain.entities.User;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;


@Getter
@Setter
@NoArgsConstructor
public class AttackServiceModel extends BaseServiceModel {

    private String host;
    private String port;


    private MethodServiceModel method;


    private LocalDateTime expiresOn;

    private int time;



    //todo userservicemodel here
    private User attacker;


}
