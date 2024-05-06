package com.codingdojo.group.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.group.models.Pizza;

@Repository
public interface PizzaRepository extends CrudRepository<Pizza, Long> {
	
	List<Pizza> findAll();
	
	List<Pizza> findByUserId(Long userId);
	
	Optional<Pizza> findById(Long id);
}
