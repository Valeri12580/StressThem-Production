package com.stressthem.app.domain.models.service;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
public class TicketServiceModel extends BaseServiceModel {

    private String email;
    private String subject;
    private String message;
    private boolean isResolved;
    private LocalDateTime localDateTime;


}
