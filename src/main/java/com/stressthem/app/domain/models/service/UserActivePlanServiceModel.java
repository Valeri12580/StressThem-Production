package com.stressthem.app.domain.models.service;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
public class UserActivePlanServiceModel extends BaseServiceModel {

    private UserServiceModel user;

    private PlanServiceModel plan;

    private int leftDays;
    private int leftAttacksForTheDay;
    private LocalDateTime startedOn;

}
