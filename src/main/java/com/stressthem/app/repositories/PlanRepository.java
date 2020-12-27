package com.stressthem.app.repositories;

import com.stressthem.app.domain.entities.Plan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PlanRepository extends JpaRepository<Plan,String> {

    Optional<Plan>findByType(String type);
}
