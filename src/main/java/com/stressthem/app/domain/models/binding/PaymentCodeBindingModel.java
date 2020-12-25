package com.stressthem.app.domain.models.binding;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotEmpty;

@Getter
@Setter
@NoArgsConstructor
public class PaymentCodeBindingModel {

    @NotEmpty(message = "The code cant be empty")
    private String code;
}
