package com.stressthem.app.domain.models.binding;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Getter
@Setter
@NoArgsConstructor
public class TicketBindingModel {

    @NotEmpty
    @Email
    private String email;

    @NotEmpty
    @Size(min = 10,message = "Must be >= 10 symbols")
    private String subject;

    @NotEmpty
    @Size(min = 20,message = "Must be >= 20 symbols" )
    private String message;

}
