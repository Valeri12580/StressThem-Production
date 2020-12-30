package com.stressthem.app.domain.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Table(name = "payment_codes")
@Entity
@NoArgsConstructor
@Getter
@Setter
@AllArgsConstructor
public class PaymentCode extends BaseEntity {

    @Column
    private String code;

    @ManyToOne
    @JoinColumn(name = "plan_id",referencedColumnName = "id")
    private Plan plan;



    @ManyToOne
    @JoinColumn(name = "author_id",referencedColumnName = "id")
    private User author;

    @Column
    private boolean isUsed;


}
