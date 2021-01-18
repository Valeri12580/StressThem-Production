package com.stressthem.app.domain.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table
@AllArgsConstructor

public class Transaction extends BaseEntity {


    @ManyToOne
    @JoinColumn(name = "user_id",referencedColumnName = "id",nullable = true)
    private User user;


    @NotNull
    @ManyToOne
    @JoinColumn(name = "plan_id",referencedColumnName = "id")
    private Plan plan;



    @OneToOne
    @JoinColumn(name = "payment_code_id",referencedColumnName = "id")
    private PaymentCode paymentCode;

    @NotNull
    @Column
    private LocalDateTime createdOn;


}
