package com.stressthem.app.repositories;

import com.stressthem.app.domain.entities.Method;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MethodRepository extends JpaRepository<Method, String> {

}
