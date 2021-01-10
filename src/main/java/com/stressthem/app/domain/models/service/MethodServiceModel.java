package com.stressthem.app.domain.models.service;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor

public class MethodServiceModel extends BaseServiceModel {

    public MethodServiceModel(String name) {
        this.name = name;
    }

    private String name;

    private List<PlanServiceModel> plans;
}
