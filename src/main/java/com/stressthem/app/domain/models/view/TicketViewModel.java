package com.stressthem.app.domain.models.view;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
public class TicketViewModel{
    private String id;
    private String subject;
    private LocalDateTime createdOn;
    private boolean isResolved;
    private String email;

}
