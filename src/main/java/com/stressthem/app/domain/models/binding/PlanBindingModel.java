package com.stressthem.app.domain.models.binding;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Positive;
import javax.validation.constraints.PositiveOrZero;
import javax.validation.constraints.Size;
import java.math.BigDecimal;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class PlanBindingModel {
    @Size(min = 1, max = 15, message = "The size must be between 1 and 15 characters")
    private String type;

    @PositiveOrZero(message = "The price must be >=0")
    private BigDecimal price;

    @Positive(message = "The duration must be positive ")
    private int durationInDays;

    @Positive(message = "The max boot time must be positive")
    private double maxBootTimeInSeconds;

    @Positive(message = "The max boot per day  must be positive")
    private int maxBootsPerDay;

    @Positive(message = "Must be positive")
    private int concurrent;

    @NotEmpty(message = "Must have at least one method")
    private List<String>methods;
}
