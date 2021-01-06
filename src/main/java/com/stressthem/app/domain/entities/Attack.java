package com.stressthem.app.domain.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

@Table(name = "attack_history")
@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Attack extends BaseEntity {

    @Column
    @NotNull
    private String host;

    @Column
    @NotNull
    private String port;


    @ManyToOne
    @JoinColumn(name = "method_id",referencedColumnName = "id")
    private Method method;


    @Column
    @NotNull
    private LocalDateTime expiresOn;


    @ManyToOne
    @JoinColumn(name = "attacker_id", referencedColumnName = "id")
    private User attacker;
}
