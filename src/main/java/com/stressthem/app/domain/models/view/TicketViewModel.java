package com.stressthem.app.domain.models.view;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
public class TicketViewModel {

    private String subject;
    private LocalDateTime localDateTime;
    private boolean isResolved;
    private String email;

}
