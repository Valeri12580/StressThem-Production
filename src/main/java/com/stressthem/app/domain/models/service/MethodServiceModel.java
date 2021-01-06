package com.stressthem.app.domain.models.service;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor

public class MethodServiceModel extends BaseServiceModel{

    public MethodServiceModel(String name) {
        this.name = name;
    }

    private String name;

    private PlanServiceModel plan;
}
