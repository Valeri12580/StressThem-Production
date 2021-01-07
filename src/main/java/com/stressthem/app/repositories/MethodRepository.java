package com.stressthem.app.repositories;

import com.stressthem.app.domain.entities.Method;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface MethodRepository extends JpaRepository<Method, String> {

    Optional<Method>findMethodByName(String name);

}
