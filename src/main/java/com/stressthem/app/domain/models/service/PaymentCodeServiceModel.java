package com.stressthem.app.domain.models.service;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class PaymentCodeServiceModel extends BaseServiceModel {

    private String code;

    private PlanServiceModel plan;

    private UserServiceModel author;

    private boolean isUsed;


}
