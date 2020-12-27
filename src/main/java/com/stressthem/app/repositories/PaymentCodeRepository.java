package com.stressthem.app.repositories;

import com.stressthem.app.domain.entities.PaymentCode;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PaymentCodeRepository extends JpaRepository<PaymentCode, String> {

    Optional<PaymentCode>findByCode(String code);
}
