package com.stressthem.app.services.interfaces;

import com.stressthem.app.domain.models.service.PaymentCodeServiceModel;

public interface PaymentService {

    void saveCode(String code, String planName, String username);

    PaymentCodeServiceModel findPaymentCode(String code);
}
