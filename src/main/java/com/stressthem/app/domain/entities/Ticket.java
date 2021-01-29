package com.stressthem.app.domain.entities;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

@Entity
@Table
@Getter
@Setter
@NoArgsConstructor
public class Ticket extends BaseEntity{



    @Column
    @NotNull
    private String email;

    @Column
    @NotNull
    private String subject;

    @Column
    @NotNull
    private String message;

    @Column
    private boolean isResolved;

    @Column
    private LocalDateTime localDateTime;
}
