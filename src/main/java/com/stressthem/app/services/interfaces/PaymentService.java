package com.stressthem.app.services.interfaces;

import com.stressthem.app.domain.models.service.PaymentCodeServiceModel;
import com.stressthem.app.domain.models.service.UserServiceModel;

public interface PaymentService {

    void saveCode(String code, String planName, String username);

    PaymentCodeServiceModel findPaymentCode(String code);

    void purchasePlan(String id, String username, String paymentCode);

    void changePaymentCodeStatus(String code,boolean isUsed);
}
