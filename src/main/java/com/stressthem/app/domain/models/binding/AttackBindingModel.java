package com.stressthem.app.domain.models.binding;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.*;

@Getter
@Setter
@NoArgsConstructor
public class AttackBindingModel {

    @Pattern(regexp = "https?:\\/\\/(www\\.)?[-a-zA-Z0-9@:%._\\+~#=]{1,256}\\.[a-zA-Z0-9()]{1,6}\\b([-a-zA-Z0-9()@:%_\\+.~#?&//=]*)", message = "The host is not valid!")
    @NotEmpty(message = "Must not be empty")
    private String host;

    @Min(value = 0, message = "The minimum value is 0")
    @Max(value = 65535, message = "The maximum value is 65535")
    private int port;

    private String method;

    @Positive(message = "The time must be >0")
    private int time;

}
