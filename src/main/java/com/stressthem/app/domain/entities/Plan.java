package com.stressthem.app.domain.entities;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;
import javax.validation.constraints.PositiveOrZero;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Table(name = "plans")
@Entity
@Getter
@Setter
@NoArgsConstructor
public class Plan extends BaseEntity {

    @Column
    @NotNull
    private String type;

    @Column
    @Positive
    @NotNull
    private BigDecimal price;

    @Column
    @NotNull
    @Positive
    private int durationInDays;

    @Column
    @NotNull
    @Positive
    private double maxBootTimeInSeconds;

    @Column
    @NotNull
    @Positive
    private int maxBootsPerDay;

    @Column
    @NotNull
    @PositiveOrZero
    private int concurrent;


    @Column
    private LocalDateTime createdOn;

    @Column
    private String token;


    @OneToMany(mappedBy = "plan",cascade = CascadeType.REMOVE)
    private List<PaymentCode> paymentCodes;

    @ManyToOne
    @JoinColumn(name = "creator_id", referencedColumnName = "id")
    private User author;

    public Plan(@NotNull String type, @Positive @NotNull BigDecimal price, @NotNull @Positive int durationInDays, @NotNull @Positive double maxBootTimeInSeconds, @NotNull @Positive int maxBootsPerDay, @NotNull @PositiveOrZero int concurrent, LocalDateTime createdOn
            , String token) {
        this.type = type;
        this.price = price;
        this.durationInDays = durationInDays;
        this.maxBootTimeInSeconds = maxBootTimeInSeconds;
        this.maxBootsPerDay = maxBootsPerDay;
        this.concurrent = concurrent;
        this.createdOn = createdOn;
        this.token = token;
    }
}
