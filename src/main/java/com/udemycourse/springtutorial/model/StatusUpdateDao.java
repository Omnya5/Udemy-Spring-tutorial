package com.udemycourse.springtutorial.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

public interface StatusUpdateDao extends JpaRepository<StatusUpdate, Long> {
    StatusUpdate findFirstByOrderByAddedDesc();
}
