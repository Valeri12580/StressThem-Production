package com.stressthem.app.domain.models.view;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
public class AttackViewModel {
    private String host;
    private String port;
    private String methodName;
    private LocalDateTime expiresOn;
}
