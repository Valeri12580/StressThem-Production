package com.stressthem.app.domain.models.service;

import lombok.*;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import  java.util.*;

@Getter
@Setter
@RequiredArgsConstructor
@NoArgsConstructor
public class PlanServiceModel extends BaseServiceModel {


    @NonNull
    private String type;

    @NonNull
    private BigDecimal price;
    @NonNull
    private int durationInDays;

    @NonNull
    private double maxBootTimeInSeconds;

    @NonNull
    private int maxBootsPerDay;

    @NonNull
    private LocalDateTime createdOn;

    @NonNull
    private int concurrent;

    private String paymentLink;

    private List<PaymentCodeServiceModel> paymentCodes;

    private List<MethodServiceModel>methods;

    @NotNull
    private UserServiceModel author;

}
