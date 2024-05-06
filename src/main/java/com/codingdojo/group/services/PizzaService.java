package com.codingdojo.group.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.group.models.Pizza;
import com.codingdojo.group.repositories.PizzaRepository;

@Service
public class PizzaService {
	
	@Autowired
	private PizzaRepository pizzaRepo;
	
	public List<Pizza> allPizzas() {
		return pizzaRepo.findAll();
	}
	
	public Pizza createPizza(Pizza pizza) {
		return pizzaRepo.save(pizza);
	}

	public Pizza updatePizza(Pizza pizza) {
		Pizza oldPizza = pizzaRepo.findById(pizza.getId()).get();
		oldPizza.setDeliveryMethod(pizza.getDeliveryMethod());
		oldPizza.setSize(pizza.getSize());
		oldPizza.setCrust(pizza.getCrust());
		oldPizza.setQuantity(pizza.getQuantity());
		oldPizza.setToppings(pizza.getToppings());
		return pizzaRepo.save(oldPizza);
	}
	
	public Pizza findPizza(Long id) {
		Optional<Pizza> optionalPizza = pizzaRepo.findById(id);
		if (optionalPizza.isPresent()) {
			return optionalPizza.get();
		} else {
			return null;
		}
	}
	
	public List<Pizza> findAllById(Long userId) {
		List<Pizza> userPizzas = pizzaRepo.findByUserId(userId);
		return userPizzas;
		
	}
	
	public void deletePizza(Long id) {
		pizzaRepo.deleteById(id);
	}
}
