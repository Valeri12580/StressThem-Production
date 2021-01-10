package com.stressthem.app.domain.models.binding;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotEmpty;
import java.util.*;

@Getter
@Setter
@NoArgsConstructor
public class MethodBindingModel {

    @NotEmpty(message = "Can't be empty!")
    private String name;

    @NotEmpty(message = "Must have at least one method")
    private List<String>plans;
}
